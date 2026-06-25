const createRegex = require('createRegex');
const encodeUriComponent = require('encodeUriComponent');
const getEventData = require('getEventData');
const getGoogleAuth = require('getGoogleAuth');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Promise = require('Promise');
const sendHttpRequest = require('sendHttpRequest');
const templateDataStorage = require('templateDataStorage');
const toBase64 = require('toBase64');

/*==============================================================================
==============================================================================*/

const API_VERSION = '1';
const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
const items = data.useGA4Items ? getEventData('items') : data.items;

if (getType(items) !== 'array') return undefined;

return Promise.all(items.map(getItemData));

/*==============================================================================
  Vendor related functions
==============================================================================*/

function getMerchantApiRequestUrl(item) {
  const merchantId = enc(data.merchant_center_id);
  const feedLanguage = makeString(data.feed_language);
  const feedLabel = makeString(data.feed_label);
  const itemId = makeString(item[itemIdKey]);
  const baseUrl = 'https://merchantapi.googleapis.com/products/v' + API_VERSION + '/';

  let productStringPath = feedLanguage + '~' + feedLabel + '~' + itemId;
  if (productStringPathNeedsEncoding(feedLanguage + feedLabel + itemId)) {
    productStringPath = encodeForMerchantApi(productStringPath);
  }

  const productPath = ['accounts', merchantId, 'products', productStringPath].join('/');
  return baseUrl + productPath;
}

function productStringPathNeedsEncoding(string) {
  // URI reserved characters
  if (string.match('[\\.\\:\\,\\(\\)\\*\\!\\/\\&\\?\\#\\=\\%\\~\\@\\+\\$]')) return true;
  return false;
}

function encodeForMerchantApi(string) {
  if (!string) return '';
  const paddingRegex = createRegex('=*', 'ig');
  const encodedString = toBase64(string, { urlEncoding: true });
  return encodedString.replace(paddingRegex, '');
}

function getItemData(item) {
  const enableItemMatchStatus = data.enable_item_match_status;

  const feedIdentifier = data.merchant_center_id + '_' + data.feed_language + '_' + data.feed_label;
  const storageKey = feedIdentifier + item[itemIdKey];
  const cacheExpirationTime = makeNumber(data.cache) * 60 * 60 * 1000;
  const cachedResultData = templateDataStorage.getItemCopy(storageKey);
  if (cachedResultData && cachedResultData.ts + cacheExpirationTime > getTimestampMillis()) {
    if (enableItemMatchStatus) item.merchant_center_status = 'match';
    item = mapResult(item, cachedResultData);
    return item;
  }

  const merchantApiUrl = getMerchantApiRequestUrl(item);
  const auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/content']
  });
  return sendHttpRequest(merchantApiUrl, { method: 'GET', authorization: auth }).then(
    (result) => {
      const resultData = JSON.parse(result.body || '{}');
      if (result.statusCode >= 200 && result.statusCode < 300) {
        if (enableItemMatchStatus) item.merchant_center_status = 'match';
        resultData.ts = getTimestampMillis();
        templateDataStorage.setItemCopy(storageKey, resultData);
        item = mapResult(item, resultData);
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

function mapResult(item, resultData) {
  item = mapResultVariables(item, resultData, data.mapping_basic);
  item = mapResultVariables(item, resultData, data.mapping_custom);

  const productTypes = (resultData.productAttributes || {}).productTypes || resultData.productTypes; // Backward compatibility.
  if (data.map_categories && getType(productTypes) === 'array') {
    productTypes.forEach((productType, index) => {
      const itemCategoryIndex = index !== 0 ? index + 1 : '';
      item['item_category' + itemCategoryIndex] = productType;
    });
  }

  return item;
}

function mapResultVariables(item, resultData, mapping) {
  if (getType(mapping) !== 'array') return item;

  const contentApiToMerchantApiDictionary = {
    // Top-level attributes
    id: 'name',
    targetCountry: 'feedLabel',
    // .productAttributes attributes
    gtin: 'gtins'
  };

  mapping.forEach((mappingItem) => {
    const keyForMerchant = mappingItem.merchant_center_variable;
    const activeKey = contentApiToMerchantApiDictionary[keyForMerchant] || keyForMerchant || '';
    const activeKeyPathArray = activeKey.split('.');
    const usesDotNotation = activeKeyPathArray.length > 1;
    const productAttributes = resultData.productAttributes || {};

    let value;
    // Backward compatibility for old Content API fields in the UI.
    // For the new API, field names are mutually exclusive. If not using dot notation, check productAttributes first, and if the attribute is not found, check the top-level resultData.
    if (!usesDotNotation) {
      value =
        getType(productAttributes[activeKey]) !== 'undefined'
          ? productAttributes[activeKey]
          : resultData[activeKey];
    } else {
      value = getNestedValue(resultData, activeKeyPathArray);
    }

    if (
      (keyForMerchant === 'gtin' /* Backward compatibility */ ||
        keyForMerchant ===
          'gtins') /* New API, but we still return only one element of the array */ &&
      getType(value) === 'array'
    ) {
      value = value[0];
    }

    const keyForGAItems = mappingItem.item_variable;
    if (isValidValue(value)) item[keyForGAItems] = value;
  });

  return item;
}

/*==============================================================================
  Helpers
==============================================================================*/

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}

function isValidValue(value) {
  const valueType = getType(value);
  return valueType !== 'null' && valueType !== 'undefined' && value !== '' && value === value;
}

function getNestedValue(obj, pathArray) {
  return pathArray.reduce((acc, key) => {
    return getType(acc) !== 'undefined' && getType(acc) !== 'null' ? acc[key] : undefined;
  }, obj);
}
