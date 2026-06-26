___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Merchant Center Lookup by Stape",
  "description": "This variable allows you to retrieve product information from Google Merchant Center.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "apiMigrationWarningLabel",
    "displayName": "⚠️ \u003cb\u003eImportant: API Migration Required (deadline August 18, 2026)\u003c/b\u003e ⚠️ \n\u003cbr/\u003e\nThe Content API for Shopping used by this variable will be sunset on August 18, 2026 and replaced by the Merchant API. This variable has been updated to utilize the new Merchant API to query product data.\n\u003cbr/\u003e\nPlease complete the \u003ca href\u003d\"https://github.com/stape-io/merchant-center-variable#migrating-from-content-api-for-shopping-to-merchant-api\"\u003erequired steps\u003c/a\u003e to migrate to the Merchant API before publishing this updated variable version to production. After completing the migration, make sure to test and verify all mapped Merchant Center attributes used by this variable. You can then safely ignore this warning.\n\u003cbr/\u003e\u003cbr/\u003e"
  },
  {
    "type": "GROUP",
    "name": "settingsGroup",
    "subParams": [
      {
        "type": "TEXT",
        "name": "items",
        "displayName": "Items Array (input to be enriched)",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "useGA4Items",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "useGA4Items",
        "checkboxText": "Use GA4 Items as Items Array",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "itemIdKey",
        "displayName": "Custom Item ID Key",
        "simpleValueType": true,
        "help": "Optional.\n\u003cbr/\u003e\u003cbr/\u003e\nSpecify a custom Item ID key in the Items array. This key will be used to match products with their corresponding Item IDs in Merchant Center.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault: \u003ci\u003eitem_id\u003c/i\u003e."
      },
      {
        "type": "TEXT",
        "name": "merchant_center_id",
        "displayName": "Merchant Center Account ID",
        "simpleValueType": true,
        "help": "The Merchant Center Account ID.\n\u003cbr/\u003e\u003cbr/\u003e\nThis is located in the top-left corner under your account name. \n\u003cbr/\u003e\nAlternatively, you can find it in the URL as the value for the \u003ci\u003ea\u003d{Account ID}\u003c/i\u003e parameter.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "12345678"
      },
      {
        "type": "TEXT",
        "name": "feed_language",
        "displayName": "Feed Language",
        "simpleValueType": true,
        "help": "You can find this parameter in the URL while editing a product in Merchant Center (e.g., \u003ci\u003elanguage\u003dda\u003c/i\u003e). \n\u003cbr/\u003e\nAlternatively, add the \u003cb\u003eFeed Language\u003c/b\u003e column to your product table overview to see this value directly.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "da"
      },
      {
        "type": "TEXT",
        "name": "feed_label",
        "displayName": "Feed Label",
        "simpleValueType": true,
        "help": "You can find this parameter in the URL while editing a product in Merchant Center (e.g., \u003ci\u003efeedLabel\u003dDK\u003c/i\u003e). \n\u003cbr/\u003e\nAlternatively, add the \u003cb\u003eFeed Label\u003c/b\u003e column to your product table overview to see this value directly.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "DK"
      },
      {
        "type": "TEXT",
        "name": "cache",
        "displayName": "Cache (hours)",
        "simpleValueType": true,
        "defaultValue": 12,
        "valueValidators": [
          {
            "type": "NON_NEGATIVE_NUMBER"
          }
        ],
        "help": "All requests to Merchant Center are cached to avoid unwanted additional network requests.\n\u003cbr/\u003e\nIf you don\u0027t want to cache them, set it to 0."
      },
      {
        "type": "CHECKBOX",
        "name": "map_categories",
        "checkboxText": "Map productTypes array into item_category properties",
        "simpleValueType": true,
        "help": "If enabled, this option maps the \u003ci\u003e\u003ca href\u003d\"https://developers.google.com/merchant/api/reference/rest/products_v1/ProductAttributes#:~:text\u003dof%20this%20item.-,productTypes,-%5B%5D\"\u003eproductTypes\u003c/a\u003e\u003c/i\u003e array from Merchant Center to the GA4 \u003ci\u003eitem_category\u003c/i\u003e fields (\u003ci\u003eitem_category\u003c/i\u003e, \u003ci\u003eitem_category2\u003c/i\u003e, \u003ci\u003eitem_category3\u003c/i\u003e etc.)."
      },
      {
        "type": "CHECKBOX",
        "name": "enable_item_match_status",
        "checkboxText": "Add item match status property",
        "simpleValueType": true,
        "help": "Adds the property \u003cb\u003emerchant_center_status\u003c/b\u003e to each product in the Items Array. It returns:\u003c/br\u003e\n\u003cul\u003e\n\u003cli\u003e\u003cb\u003ematch\u003c/b\u003e: The item was found in your catalog.\u003c/li\u003e\n\u003cli\u003e\u003cb\u003eno_match\u003c/b\u003e:  The item was not found in your catalog.\u003c/li\u003e\n\u003cli\u003e\u003cb\u003eapi_error\u003c/b\u003e: There was a problem in the API call.\u003c/li\u003e\n\u003c/ul\u003e"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "basicMappingGroup",
    "displayName": "Basic Mapping",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "mapping_basic",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Merchant Center attribute",
            "name": "merchant_center_variable",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "adult",
                "displayValue": "productAttributes.adult"
              },
              {
                "value": "ageGroup",
                "displayValue": "productAttributes.ageGroup"
              },
              {
                "value": "availability",
                "displayValue": "productAttributes.availability"
              },
              {
                "value": "isBundle",
                "displayValue": "productAttributes.isBundle"
              },
              {
                "value": "brand",
                "displayValue": "productAttributes.brand"
              },
              {
                "value": "color",
                "displayValue": "productAttributes.color"
              },
              {
                "value": "condition",
                "displayValue": "productAttributes.condition"
              },
              {
                "value": "gender",
                "displayValue": "productAttributes.gender"
              },
              {
                "value": "gtin",
                "displayValue": "gtin (deprecated - use productAttributes.gtins[0] instead)"
              },
              {
                "value": "gtins",
                "displayValue": "productAttributes.gtins[0]"
              },
              {
                "value": "imageLink",
                "displayValue": "productAttributes.imageLink"
              },
              {
                "value": "link",
                "displayValue": "productAttributes.link"
              },
              {
                "value": "material",
                "displayValue": "productAttributes.material"
              },
              {
                "value": "mpn",
                "displayValue": "productAttributes.mpn"
              },
              {
                "value": "pattern",
                "displayValue": "productAttributes.pattern"
              },
              {
                "value": "title",
                "displayValue": "productAttributes.title"
              },
              {
                "value": "legacyLocal",
                "displayValue": "legacyLocal"
              },
              {
                "value": "dataSource",
                "displayValue": "dataSource"
              },
              {
                "value": "archived",
                "displayValue": "archived"
              },
              {
                "value": "versionNumber",
                "displayValue": "versionNumber"
              }
            ],
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Item attribute",
            "name": "item_variable",
            "type": "TEXT",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "help": "Map  \u003cb\u003epredefined\u003c/b\u003e attributes from your Merchant Center data to item data. Either from root object returned by Merchant Center (\u003ca href\u003d\"https://developers.google.com/merchant/api/reference/rest/products_v1/accounts.products#Product\"\u003e[1]\u003c/a\u003e) or from the \u003ci\u003eproductAttributes\u003c/i\u003e key (\u003ca href\u003d\"https://developers.google.com/merchant/api/reference/rest/products_v1/ProductAttributes\"\u003e[2]\u003c/a\u003e).",
        "displayName": "Basic Mapping",
        "newRowButtonText": "Add attribute"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customMappingGroup",
    "displayName": "Custom Mapping",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "mapping_custom",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Merchant Center attribute",
            "name": "merchant_center_variable",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "isUnique": true
          },
          {
            "defaultValue": "",
            "displayName": "Item attribute",
            "name": "item_variable",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "isUnique": true
          }
        ],
        "help": "Map \u003cb\u003eother\u003c/b\u003e attributes from your Merchant Center data to item data. From root object returned by Merchant Center or from any other nested array or object (\u003ci\u003eProductAttributes\u003c/i\u003e, \u003ci\u003eProductStatus\u003c/i\u003e, \u003ci\u003eCustomAttributes\u003c/i\u003e etc.). \u003ca href\u003d\"https://developers.google.com/merchant/api/reference/rest/products_v1/accounts.products#Product\"\u003eLearn more\u003c/a\u003e.\n\u003cbr/\u003e\nUse dot notation syntax to access nested values. Examples:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003eproductAttributes.price.currency\u003c/i\u003e: to retrieve the price currency\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eproductStatus.creationDate\u003c/i\u003e: to retrieve the creation date.\u003c/li\u003e\n\u003cli\u003e\u003ci\u003ecustomAttributes.0.name\u003c/i\u003e: to access the name of the first custom attribute in the array.\u003c/li\u003e\n\u003c/ul\u003e",
        "displayName": "Custom Mapping",
        "newRowButtonText": "Add attribute"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

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


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_template_storage",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://merchantapi.googleapis.com/*"
              }
            ]
          }
        },
        {
          "key": "allowGoogleDomains",
          "value": {
            "type": 8,
            "boolean": true
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "use_google_credentials",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedScopes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googleapis.com/auth/content"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "items"
              }
            ]
          }
        },
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: '[Early Exit] Returns undefined when items is not an array'
  code: |-
    mockData.items = undefined;

    const variableResult = runCode(mockData);

    assertThat(variableResult).isUndefined();
    assertApi('sendHttpRequest').wasNotCalled();
- name: '[Request URL] Request URL contains required fields (when NOT using a Custom
    ID Key)'
  code: "\nrunCode(mockData).then(variableResult => {\n mockData.items.forEach(item\
    \ => {\n   const productStringPath = mockData.feed_language + '~' + mockData.feed_label\
    \ + '~' + item.item_id;\n   const productPath = ['accounts', enc(mockData.merchant_center_id),\
    \ 'products', enc(productStringPath)].join('/');\n   const expectedUrl = 'https://merchantapi.googleapis.com/products/v1/'\
    \ + productPath;\n   \n   assertApi('sendHttpRequest').wasCalledWith(\n    expectedUrl,\
    \ \n    { method: 'GET', authorization: 'expectedGoogleAuth' }\n    );\n   });\n\
    \ });"
- name: '[Request URL] Request URL contains required fields (when using a Custom ID
    Key)'
  code: "mockData.itemIdKey = 'item_sku';\n\nrunCode(mockData).then(variableResult\
    \ => {\n  mockData.items.forEach(item => {\n   let productStringPath = mockData.feed_language\
    \ + '~' + mockData.feed_label + '~' + item[mockData.itemIdKey];\n   let productPath\
    \ = ['accounts', enc(mockData.merchant_center_id), 'products', enc(productStringPath)].join('/');\n\
    \   let expectedUrl = 'https://merchantapi.googleapis.com/products/v1/' + productPath;\n\
    \ \n  assertApi('sendHttpRequest').wasCalledWith(\n   expectedUrl, \n   { method:\
    \ 'GET', authorization: 'expectedGoogleAuth' }\n   );\n  });\n});\n"
- name: '[Request URL] Encodes product path when Item ID contains special characters'
  code: "mockData.feed_label= 'US';\nmockData.items = [{ item_id: 'sku/123', price:\
    \ 10 }];\n        \nrunCode(mockData).then(variableResult => {\n  assertApi('toBase64').wasCalledWith('en~US~sku/123',{urlEncoding:\
    \ true });\n\n  const expectedUrl = 'https://merchantapi.googleapis.com/products/v1/accounts/1111111111/products/ZW5-VVN-c2t1LzEyMw';\n\
    \        \n  assertApi('sendHttpRequest').wasCalledWith(expectedUrl, \n      \
    \    { method: 'GET', authorization: 'expectedGoogleAuth' }\n  );\n});"
- name: '[Field Mapping] Items Array is modified when the Item ID matches the Item
    ID in Merchant Center (when NOT using a Custom Item ID Key)'
  code: "mockData.map_categories = true;\nmockData.mapping_basic = [ { merchant_center_variable\
    \ : 'title', item_variable: 'product_type'} ];\nmockData.mapping_custom = [ {\
    \ merchant_center_variable : 'description', item_variable: 'description'} ];\n\
    \nsetSendHttpRequest();\n\nrunCode(mockData).then(variableResult => {\n  assertThat(variableResult).isEqualTo([\n\
    \    {\n      item_id: '123',\n      item_sku: 'abc',\n      price: 1,\n     \
    \ product_type: 'produtinho maravilhoso para voce123',\n      description:\n \
    \       'test testtest testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest test',\n    \
    \  item_category: 'Garden furniture'\n    },\n    {\n      item_id: '456',\n \
    \     item_sku: 'def',\n      price: 2.99,\n      product_type: 'produtinho maravilhoso\
    \ para voce456',\n      description:\n        'test testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest test',\n      item_category: 'Garden furniture'\n\
    \    },\n    { \n      item_id: '789', \n      item_sku: 'ghi', \n      price:\
    \ 3.5, \n      product_type: 'produtinho maravilhoso para voce789',\n      description:\n\
    \        'test testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest test',\n\
    \      item_category: 'Garden furniture' \n    },{ \n      item_id: '101', \n\
    \      item_sku: 'jkl', \n      price: 0.5, \n      product_type: 'produtinho\
    \ maravilhoso para voce101',\n      description:\n        'test testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest testtest test',\n      item_category: 'Garden furniture'\
    \ \n    }]);\n});"
- name: '[Field Mapping] Items Array is modified when the Item ID matches the Item
    ID in Merchant Center (when using a Custom Item ID Key)'
  code: "mockData.itemIdKey = 'item_sku';\nmockData.map_categories = true;\nmockData.mapping_basic\
    \ = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];\n\
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable:\
    \ 'description'} ];\n\nsetSendHttpRequest();\n\nrunCode(mockData).then(variableResult\
    \ => {\n  assertThat(variableResult).isEqualTo([\n    {\n      item_id: '123',\n\
    \      item_sku: 'abc',\n      price: 1,\n      product_type: 'produtinho maravilhoso\
    \ para voceabc',\n      description:\n        'test testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest test',\n      item_category: 'Garden furniture'\n\
    \    },\n    {\n      item_id: '456',\n      item_sku: 'def',\n      price: 2.99,\n\
    \      product_type: 'produtinho maravilhoso para vocedef',\n      description:\n\
    \        'test testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest test',\n\
    \      item_category: 'Garden furniture'\n    },{ \n      item_id: '789', \n \
    \     item_sku: 'ghi', \n      price: 3.5, \n      product_type: 'produtinho maravilhoso\
    \ para voceghi',\n      description:\n        'test testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest test',\n      item_category: 'Garden furniture' \n\
    \    },{ \n      item_id: '101', \n      item_sku: 'jkl', \n      price: 0.5,\
    \ \n      product_type: 'produtinho maravilhoso para vocejkl',\n      description:\n\
    \        'test testtest testtest testtest testtest testtest testtest testtest\
    \ testtest testtest testtest testtest testtest testtest testtest testtest test',\n\
    \      item_category: 'Garden furniture' \n    }\n  ]);\n});"
- name: '[Field Mapping] Items Array is NOT modified when the Item ID does NOT match
    the Item ID in Merchant Center'
  code: |
    mockData.map_categories = true;
    mockData.mapping_basic = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable: 'description'} ];

    const noMatch = true;
    setSendHttpRequest(noMatch);

    runCode(mockData).then(variableResult => {
      assertThat(variableResult).isEqualTo([
        { item_id: '123', item_sku: 'abc', price: 1},
        { item_id: '456', item_sku: 'def', price: 2.99},
        { item_id: '789', item_sku: 'ghi', price: 3.5 },
        { item_id: '101', item_sku: 'jkl', price: 0.5 }
      ]);
    });
- name: '[Category Mapping] Maps multiple product_types to correct item_category fields'
  code: |-
    mockData.map_categories = true;

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({
            productTypes: ['Furniture', 'Garden Furniture', 'Outdoor Seating']
          })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].item_category).isEqualTo('Furniture');
      assertThat(variableResult[0].item_category2).isEqualTo('Garden Furniture');
      assertThat(variableResult[0].item_category3).isEqualTo('Outdoor Seating');
    });
- name: '[Error Handling] Items Array is NOT modified when a request promise rejects'
  code: |
    mockData.map_categories = true;
    mockData.mapping_basic = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable: 'description'} ];

    const noMatch = true;
    mock('sendHttpRequest', () => {
      return Promise.create((resolve, reject) => {
        reject({ reason: 'failed' });
      });
    });

    runCode(mockData).then(variableResult => {
      assertThat(variableResult).isEqualTo([
        { item_id: '123', item_sku: 'abc', price: 1},
        { item_id: '456', item_sku: 'def', price: 2.99},
        { item_id: '789', item_sku: 'ghi', price: 3.5 },
        { item_id: '101', item_sku: 'jkl', price: 0.5 }
      ]);
    });
- name: '[Match Status] Items Array is enriched with match status for all items when
    status is enabled'
  code: |
    mockData.enable_item_match_status = true;

    runCode(mockData).then((variableResult) => {
      variableResult.forEach((item) => {
        assertThat(item.merchant_center_status).isEqualTo('match');
      });
    });
- name: '[Match Status] Items Array is enriched with correct merchant_center_status
    when enabled'
  code: |-
    mockData.enable_item_match_status = true;

    let index = 0;

    mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {
      const currentIndex = index;
      index++;

      if (currentIndex === 0) {
        return Promise.create((resolve, reject) => {
          resolve({ statusCode: 404, body: JSON.stringify(getNoMatchResponse().body) });
        });
      }
      if (currentIndex === 1) {
        return Promise.create((resolve, reject) => {
          resolve({ statusCode: 200, body: JSON.stringify(getMatchResponse().body) });
        });
      }
      if (currentIndex === 2) {
        return Promise.create((resolve, reject) => reject());
      }
      return Promise.create((resolve, reject) => {
        resolve({ statusCode: 500, body: '{}' });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].merchant_center_status).isEqualTo('no_match');
      assertThat(variableResult[1].merchant_center_status).isEqualTo('match');
      assertThat(variableResult[2].merchant_center_status).isEqualTo('api_error');
      assertThat(variableResult[3].merchant_center_status).isEqualTo('api_error');
    });
- name: '[Template Storage] Caches successful API response in template storage'
  code: |-
    let storedItems = 0;

    mockObject('templateDataStorage', {
      getItemCopy: (key) => undefined,
      setItemCopy: (key, value) => {
        storedItems++;
        assertThat(value.ts).isDefined();
      }
    });

    runCode(mockData).then(() => {
      assertThat(storedItems).isEqualTo(4);
    });
- name: '[Cache] Serves item from cache without HTTP request'
  code: |-
    const NOW = 1000000000000;
    mock('getTimestampMillis', NOW);
    mockData.mapping_basic = [{ merchant_center_variable: 'title', item_variable: 'product_title' }];

    mockObject('templateDataStorage', {
      getItemCopy: (key) => {
        return { title: 'Cached Product Title', ts: NOW };
      },
      setItemCopy: (key, value) => {}
    });

    runCode(mockData).then((variableResult) => {
      assertApi('sendHttpRequest').wasNotCalled();
      variableResult.forEach((item) => {
        assertThat(item.product_title).isEqualTo('Cached Product Title');
      });
    });
- name: '[Cache] Sets match status for cached items when enable_item_match_status
    is enabled'
  code: |-
    const NOW = 1000000000000;
    mock('getTimestampMillis', NOW);
    mockData.enable_item_match_status = true;

    mockObject('templateDataStorage', {
      getItemCopy: (key) => {
        return { title: 'Cached Title', ts: NOW };
      },
      setItemCopy: (key, value) => {}
    });

    runCode(mockData).then((variableResult) => {
      assertApi('sendHttpRequest').wasNotCalled();
      variableResult.forEach((item) => {
        assertThat(item.merchant_center_status).isEqualTo('match');
      });
    });
- name: '[Cache] Makes HTTP request when cached item has expired'
  code: |-
    const NOW = 1000000000000;
    const CACHE_MS = 12 * 60 * 60 * 1000;
    mock('getTimestampMillis', NOW);

    mockObject('templateDataStorage', {
      getItemCopy: (key) => {
        return { title: 'Old Title', ts: NOW - CACHE_MS };
      },
      setItemCopy: (key, value) => {}
    });

    runCode(mockData).then(() => {
      assertApi('sendHttpRequest').wasCalled();
    });
- name: '[Field Mapping] Dot notation resolves nested value and array element by numeric
    key'
  code: |-
    mockData.items = [{ item_id: '123', price: 1 }];
    mockData.mapping_custom = [
      { merchant_center_variable: 'productAttributes.brand', item_variable: 'brand' },
      { merchant_center_variable: 'productAttributes.gtins.0', item_variable: 'gtin_direct' }
    ];

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({ productAttributes: { brand: 'TestBrand', gtins: ['12345', '67890'] } })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].brand).isEqualTo('TestBrand');
      assertThat(variableResult[0].gtin_direct).isEqualTo('12345');
    });
- name: '[Field Mapping] Dot notation returns undefined when path does not exist or
    has null midway'
  code: |-
    mockData.items = [{ item_id: '123', price: 1 }];
    mockData.mapping_custom = [
      { merchant_center_variable: 'productAttributes.nonExistent.deep', item_variable: 'missing_field' },
      { merchant_center_variable: 'productAttributes.brand.sub', item_variable: 'null_midway_field' }
    ];

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({ productAttributes: { brand: null } })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].missing_field).isUndefined();
      assertThat(variableResult[0].null_midway_field).isUndefined();
    });
- name: '[Field Mapping] id key is remapped to name via backward compat dictionary'
  code: |-
    mockData.items = [{ item_id: '123', price: 1 }];
    mockData.mapping_custom = [
      { merchant_center_variable: 'id', item_variable: 'product_name' }
    ];

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({ name: 'accounts/123/products/sku1' })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].product_name).isEqualTo('accounts/123/products/sku1');
    });
- name: '[Field Mapping] gtins key unwraps array and returns first element'
  code: |-
    mockData.items = [{ item_id: '123', price: 1 }];
    mockData.mapping_basic = [
      { merchant_center_variable: 'gtins', item_variable: 'item_gtin' }
    ];

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({ productAttributes: { gtins: ['111', '222'] } })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].item_gtin).isEqualTo('111');
    });
- name: '[Field Mapping] Non dot notation prefers productAttributes value and falls
    back to top-level resultData'
  code: |-
    mockData.items = [{ item_id: '123', price: 1 }];
    mockData.mapping_custom = [
      { merchant_center_variable: 'brand', item_variable: 'brand_field' },
      { merchant_center_variable: 'feedLabel', item_variable: 'feed_label_val' }
    ];

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => {
        resolve({
          statusCode: 200,
          body: JSON.stringify({
            feedLabel: 'US',
            brand: 'TopLevel',
            productAttributes: { brand: 'Nested' }
          })
        });
      });
    });

    runCode(mockData).then((variableResult) => {
      assertThat(variableResult[0].brand_field).isEqualTo('Nested');
      assertThat(variableResult[0].feed_label_val).isEqualTo('US');
    });
setup: "const encodeUriComponent = require('encodeUriComponent');\nconst Promise =\
  \ require('Promise');\nconst JSON = require('JSON');\n\nconst enc = (data) => {\n\
  \  return encodeUriComponent(data || '');\n};\n\nconst mockData = {\n  items: [\n\
  \    { item_id: '123', item_sku: 'abc', price: 1 },\n    { item_id: '456', item_sku:\
  \ 'def', price: 2.99 },\n    { item_id: '789', item_sku: 'ghi', price: 3.5 },\n\
  \    { item_id: '101', item_sku: 'jkl', price: 0.5 }\n  ],\n  cache: '12',\n  merchant_center_id:\
  \ '1111111111',\n  feed_language: 'en',\n  feed_label: 'BR',\n  enable_item_match_status:\
  \ false\n};\n\nconst getNoMatchResponse = () => {\n  return {\n    statusCode: 404,\n\
  \    body: {\n      error: {\n        code: 404,\n        message: 'item not found',\n\
  \        errors: [\n          {\n            message: 'item not found',\n      \
  \      domain: 'global',\n            reason: 'notFound'\n          }\n        ]\n\
  \      }\n    }\n  };\n};\n\nconst getMatchResponse = () => {\n  return {\n    statusCode:\
  \ 200,\n    body: {\n      kind: 'content#product',\n      id: 'online:en:BR:',\n\
  \      offerId: '',\n      identifierExists: false,\n      title: 'produtinho maravilhoso\
  \ para voce',\n      description:\n        'test testtest testtest testtest testtest\
  \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
  \ testtest testtest test',\n      link: 'https://example.com/',\n      imageLink:\n\
  \        'https://shopping.googleusercontent.com/image?q=test',\n      contentLanguage:\
  \ 'en',\n      targetCountry: 'BR',\n      feedLabel: 'BR',\n      channel: 'online',\n\
  \      availability: 'in stock',\n      condition: 'new',\n      googleProductCategory:\
  \ '5181',\n      price: {\n        value: '1.00',\n        currency: 'USD'\n   \
  \   },\n      productTypes: ['Garden furniture'],\n      shipping: [\n        {\n\
  \          country: 'BR'\n        }\n      ],\n      includedDestinations: ['SurfacesAcrossGoogle'],\n\
  \      customAttributes: [\n        {\n          name: 'update type',\n        \
  \  value: 'merge'\n        }\n      ]\n    }\n  };\n};\n\nconst setSendHttpRequest\
  \ = (noMatch) => {\n  let sendHttpRequestExecutions = 0;\n  mock('sendHttpRequest',\
  \ (requestUrl, requestOptions, requestBody) => {\n    const itemIdKey = mockData.itemIdKey\
  \ ? mockData.itemIdKey : 'item_id';\n    const itemId = mockData.items[sendHttpRequestExecutions][itemIdKey];\n\
  \    \n    let response;\n    if (noMatch) {\n      response = getNoMatchResponse();\n\
  \    } else {\n      response = getMatchResponse();\n      response.body.id += itemId;\n\
  \      response.body.offerId += itemId;\n      response.body.title += itemId;\n\
  \    }\n    \n    sendHttpRequestExecutions++;\n\n    return Promise.create((resolve,\
  \ reject) => {\n      resolve({\n        statusCode: response.statusCode,\n    \
  \    body: JSON.stringify(response.body)\n      });\n    });\n  });\n};\nsetSendHttpRequest();\n\
  \nmockObject('templateDataStorage', {\n  setItemCopy: (key, value) => { },\n  getItemCopy:\
  \ (key) => { }\n});\n\nmock('getGoogleAuth', 'expectedGoogleAuth');"


___NOTES___

2026-06-25 Change Notes:
 - Update to new Merchant Center API. Follow the required migration steps https://github.com/stape-io/merchant-center-variable#migrating-from-content-api-for-shopping-to-merchant-api.

2026-05-21 Change Notes:
 - Console and BigQuery logging removal.

Created on 17.12.2023 20.58.54

