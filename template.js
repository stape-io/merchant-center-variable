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

/*==============================================================================
==============================================================================*/

const isLoggingEnabled = determinateIsLoggingEnabled();
const traceId = isLoggingEnabled ? getRequestHeader('trace-id') : undefined;

const cache = makeNumber(data.cache) * 60 * 60 * 1000;
const feed_identifier = data.feed_language + '_' + data.feed_label;
const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';

const items = data.items;

if (getType(items) !== 'array') return undefined;

return Promise.all(items.map(getData));

/*==============================================================================
  Vendor related functions
==============================================================================*/

function getData(item) {
  const storageKey = feed_identifier + item[itemIdKey];
  const cachedItem = templateDataStorage.getItemCopy(storageKey);
  if (cachedItem && cachedItem.ts + cache > getTimestampMillis()) {
    mapResult(item, cachedItem);
    return item;
  }

  const url =
    'https://shoppingcontent.googleapis.com/content/v2.1/' +
    enc(data.merchant_center_id) +
    '/products/online:' +
    enc(data.feed_language) +
    ':' +
    enc(data.feed_label) +
    ':' +
    enc(item[itemIdKey]);

  if (isLoggingEnabled) {
    logToConsole(
      JSON.stringify({
        Name: 'GoogleMerchantCenterLookup',
        Type: 'Request',
        TraceId: traceId,
        EventName: 'LookupRequest',
        RequestMethod: 'GET',
        RequestUrl: url
      })
    );
  }

  const auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/content']
  });

  return sendHttpRequest(url, { method: 'GET', authorization: auth }).then(
    (result) => {
      if (isLoggingEnabled) {
        logToConsole(
          JSON.stringify({
            Name: 'GoogleMerchantCenterLookup',
            Type: 'Response',
            TraceId: traceId,
            EventName: 'LookupRequest',
            ResponseStatusCode: result.statusCode,
            ResponseHeaders: result.headers,
            ResponseBody: result.body
          })
        );
      }

      if (result.statusCode >= 200 && result.statusCode < 300) {
        const result_data = JSON.parse(result.body);
        result_data.ts = getTimestampMillis();
        templateDataStorage.setItemCopy(storageKey, result_data);
        mapResult(item, result_data);
      }

      return item;
    },
    (result) => {
      if (isLoggingEnabled) {
        logToConsole(
          JSON.stringify({
            Name: 'GoogleMerchantCenterLookup',
            Type: 'Message',
            TraceId: traceId,
            EventName: 'LookupRequest',
            Message: 'Some request may have failed or timed out.',
            Reason: JSON.stringify(result)
          })
        );
      }

      return item;
    }
  );
}

function mapResult(item, result_data) {
  mapResultVariables(item, result_data, data.mapping_basic);
  mapResultVariables(item, result_data, data.mapping_custom);

  if (data.map_categories && result_data.productTypes) {
    result_data.productTypes.forEach((productType, index) => {
      const itemCategoryIndex = index !== 0 ? index : '';
      item['item_category' + itemCategoryIndex] = productType;
    });
  }

  return item;
}

function mapResultVariables(item, result_data, mapping) {
  if (getType(mapping) !== 'array') return;

  for (let i = 0; i < mapping.length; i++) {
    const mappingItem = mapping[i];
    const value = result_data[mappingItem.merchant_center_variable];
    if (value) item[mappingItem.item_variable] = value;
  }
}

/*==============================================================================
  Helpers
==============================================================================*/

function determinateIsLoggingEnabled() {
  const containerVersion = getContainerVersion();
  const isDebug = !!(
    containerVersion &&
    (containerVersion.debugMode || containerVersion.previewMode)
  );

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
  return encodeUriComponent(data || '');
}
