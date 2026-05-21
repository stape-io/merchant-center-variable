const encodeUriComponent = require('encodeUriComponent');
const getGoogleAuth = require('getGoogleAuth');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Promise = require('Promise');
const sendHttpRequest = require('sendHttpRequest');
const templateDataStorage = require('templateDataStorage');

/*==============================================================================
==============================================================================*/

const cache = makeNumber(data.cache) * 60 * 60 * 1000;
const feed_identifier = data.feed_language + '_' + data.feed_label;
const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
const enableItemMatchStatus = data.enable_item_match_status;

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
    if (enableItemMatchStatus) item.merchant_center_status = 'match';
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

  const auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/content']
  });

  return sendHttpRequest(url, { method: 'GET', authorization: auth }).then(
    (result) => {
      const result_data = JSON.parse(result.body || '{}');
      if (result.statusCode >= 200 && result.statusCode < 300) {
        if (enableItemMatchStatus) item.merchant_center_status = 'match';
        result_data.ts = getTimestampMillis();
        templateDataStorage.setItemCopy(storageKey, result_data);
        mapResult(item, result_data);
      } else if (result.statusCode === 404) {
        if (enableItemMatchStatus) item.merchant_center_status = 'no_match';
      } else {
        if (enableItemMatchStatus) item.merchant_center_status = 'api_error';
      }
      return item;
    },
    (result) => {
      if (enableItemMatchStatus) item.merchant_center_status = 'api_error';
      return item;
    }
  );
}

function mapResult(item, result_data) {
  mapResultVariables(item, result_data, data.mapping_basic);
  mapResultVariables(item, result_data, data.mapping_custom);

  if (data.map_categories && result_data.productTypes) {
    result_data.productTypes.forEach((productType, index) => {
      const itemCategoryIndex = index !== 0 ? index + 1 : '';
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

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}
