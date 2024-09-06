const Promise = require('Promise');
const logToConsole = require('logToConsole');
const templateDataStorage = require('templateDataStorage');
const makeNumber = require('makeNumber');
const JSON = require('JSON');
const getTimestampMillis = require('getTimestampMillis');
const sendHttpRequest = require('sendHttpRequest');
const getGoogleAuth = require('getGoogleAuth');
const getRequestHeader = require('getRequestHeader');
const getContainerVersion = require('getContainerVersion');
const encodeUriComponent = require('encodeUriComponent');
const getType = require('getType');

const isLoggingEnabled = determinateIsLoggingEnabled();
const traceId = isLoggingEnabled ? getRequestHeader('trace-id') : undefined;

const cache = makeNumber(data.cache) * 60 * 60 * 1000;
const feed_identifier = data.feed_language + '_' + data.feed_label;
let items = data.items;

if (!items) return undefined;

return Promise.all(items.map(getData));

function getData(item) {
  const storageKey = feed_identifier + item.item_id;
  const cachedItem = templateDataStorage.getItemCopy(storageKey);
  if (cachedItem && cachedItem.ts + cache > getTimestampMillis() ) {
    mapResult(item, cachedItem);

    return item;
  }

  const url = 'https://shoppingcontent.googleapis.com/content/v2.1/' + enc(data.merchant_center_id) + '/products/online:' + enc(data.feed_language) + ':' + enc(data.feed_label) + ':' + enc(item.item_id);

  if (isLoggingEnabled) {
    logToConsole(
      JSON.stringify({
        Name: 'GoogleMerchantCenterLookup',
        Type: 'Request',
        TraceId: traceId,
        EventName: 'LookupRequest',
        RequestMethod: 'GET',
        RequestUrl: url,
      })
    );
  }

  const auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/content']
  });

  return sendHttpRequest(url, { method: 'GET', authorization: auth })
    .then((successResult) => {
      if (isLoggingEnabled) {
        logToConsole(
          JSON.stringify({
            Name: 'GoogleMerchantCenterLookup',
            Type: 'Response',
            TraceId: traceId,
            EventName: 'LookupRequest',
            ResponseStatusCode: successResult.statusCode,
            ResponseHeaders: successResult.headers,
            ResponseBody: successResult.body,
          })
        );
      }

      let result_data = JSON.parse(successResult.body);

      result_data.ts = getTimestampMillis();
      templateDataStorage.setItemCopy(storageKey, result_data);
      mapResult(item, result_data);

      return item;
    }, function() {
      if (isLoggingEnabled) {
        logToConsole(
          JSON.stringify({
            Name: 'GoogleMerchantCenterLookup',
            Type: 'Response',
            TraceId: traceId,
            EventName: 'LookupRequest',
            ResponseStatusCode: 500,
            ResponseHeaders: {},
            ResponseBody: {},
          })
        );
      }

      return item;
    });
}

// function to ignore and map result
function mapResult(item, result_data) {
  mapResultVariables(item, result_data, data.mapping_basic);
  mapResultVariables(item, result_data, data.mapping_custom);

  if (data.map_categories && result_data.productTypes ) {
    for (let z = 0; z < result_data.productTypes.length; z++) {
      if (z === 0) {
        item.item_category = result_data.productTypes[0];
      }
      else {
        item['item_category' + z] = result_data.productTypes[z];
      }
    }
  }

  return item;
}

function mapResultVariables(item, result_data, mapping) {
  if(getType(mapping) !== 'array') return;
  for (let i = 0; i < mapping.length; i++) {
    const mappingItem = mapping[i];
    const value = result_data[mappingItem.merchant_center_variable];
    if (value) item[mappingItem.item_variable] = value;
  }
}

function determinateIsLoggingEnabled() {
  const containerVersion = getContainerVersion();
  const isDebug = !!(containerVersion && (containerVersion.debugMode || containerVersion.previewMode));

  if (!data.logType) {
    return isDebug;
  }

  if (data.logType === 'no') {
    return false;
  }

  if (data.logType === 'debug') {
    return isDebug;
  }

  return data.logType === 'always';
}

function enc(data) {
  data = data || '';
  return encodeUriComponent(data);
}

