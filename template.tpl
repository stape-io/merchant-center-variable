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
    "type": "GROUP",
    "name": "settingsGroup",
    "groupStyle": "NO_ZIPPY",
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
        ]
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
        "displayName": "Merchant Center ID Account ID",
        "simpleValueType": true,
        "help": "The Merchant Center ID Account ID. \u003ca href\u003d\"https://support.google.com/paymentscenter/answer/7163092?hl\u003den\"\u003eLearn more\u003c/a\u003e.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
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
        ]
      },
      {
        "type": "TEXT",
        "name": "feed_language",
        "displayName": "Feed Language",
        "simpleValueType": true,
        "help": "You can find the parameter in Merchant Center URL: \u003ci\u003elanguage\u003dda\u003c/i\u003e",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "feed_label",
        "displayName": "Feed Label",
        "simpleValueType": true,
        "help": "You can find the parameter in Merchant Center URL: \u003ci\u003efeedLabel\u003dDK\u003c/i\u003e",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "map_categories",
        "checkboxText": "Map product_types into item_categories",
        "simpleValueType": true,
        "help": "If checked, this option maps the \u003ci\u003eproduct_type\u003c/i\u003e in the Merchant Center to the \u003ci\u003eitem_category\u003c/i\u003e field."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "basicMappingGroup",
    "displayName": "Basic mapping",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "mapping_basic",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Merchant Center variable",
            "name": "merchant_center_variable",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "adult",
                "displayValue": "adult"
              },
              {
                "value": "age_group",
                "displayValue": "age_group"
              },
              {
                "value": "availability",
                "displayValue": "availability"
              },
              {
                "value": "is_bundle",
                "displayValue": "bundle (is_bundle)"
              },
              {
                "value": "brand",
                "displayValue": "brand"
              },
              {
                "value": "color",
                "displayValue": "color"
              },
              {
                "value": "condition",
                "displayValue": "condition"
              },
              {
                "value": "gender",
                "displayValue": "gender"
              },
              {
                "value": "gtin",
                "displayValue": "gtin"
              },
              {
                "value": "imageLink",
                "displayValue": "imageLink"
              },
              {
                "value": "link",
                "displayValue": "link"
              },
              {
                "value": "material",
                "displayValue": "material"
              },
              {
                "value": "mpn",
                "displayValue": "mpn"
              },
              {
                "value": "pattern",
                "displayValue": "pattern"
              },
              {
                "value": "title",
                "displayValue": "title"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Item variable",
            "name": "item_variable",
            "type": "TEXT"
          }
        ],
        "help": "Map predefined attributes from your Merchant Center data to item data.",
        "displayName": "Basic mapping"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customMappingGroup",
    "displayName": "Custom mapping",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "mapping_custom",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Merchant Center variable",
            "name": "merchant_center_variable",
            "type": "TEXT",
            "selectItems": [
              {
                "value": "adult",
                "displayValue": "adult"
              },
              {
                "value": "age_group",
                "displayValue": "age_group"
              },
              {
                "value": "availability",
                "displayValue": "availability"
              },
              {
                "value": "is_bundle",
                "displayValue": "bundle (is_bundle)"
              },
              {
                "value": "brand",
                "displayValue": "brand"
              },
              {
                "value": "color",
                "displayValue": "color"
              },
              {
                "value": "condition",
                "displayValue": "condition"
              },
              {
                "value": "gender",
                "displayValue": "gender"
              },
              {
                "value": "gtin",
                "displayValue": "gtin"
              },
              {
                "value": "image_link",
                "displayValue": "image_link"
              },
              {
                "value": "link",
                "displayValue": "link"
              },
              {
                "value": "material",
                "displayValue": "material"
              },
              {
                "value": "mpn",
                "displayValue": "mpn"
              },
              {
                "value": "pattern",
                "displayValue": "pattern"
              },
              {
                "value": "title",
                "displayValue": "title"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Item variable",
            "name": "item_variable",
            "type": "TEXT"
          }
        ],
        "help": "Map custom attributes from your Merchant Center data to item data.",
        "displayName": "Custom mapping"
      }
    ]
  },
  {
    "displayName": "Logs Settings",
    "name": "logsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "RADIO",
        "name": "logType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log"
          },
          {
            "value": "debug",
            "displayValue": "Log to console during debug and preview"
          },
          {
            "value": "always",
            "displayValue": "Always log to console"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "debug"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

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


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
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
                "string": "https://shoppingcontent.googleapis.com/*"
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
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "trace-id"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
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
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
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
  }
]


___TESTS___

scenarios:
- name: Request URL contains required fields (when NOT using a Custom ID Key)
  code: "runCode(mockData).then(variableResult => {\n  mockData.items.forEach(item\
    \ => {\n    assertApi('sendHttpRequest').wasCalledWith(\n      'https://shoppingcontent.googleapis.com/content/v2.1/'\
    \ + \n      enc(mockData.merchant_center_id) + \n      '/products/online:' + \n\
    \      enc(mockData.feed_language) + \n      ':' + \n      enc(mockData.feed_label)\
    \ + \n      ':' + \n      enc(item.item_id), \n      { method: 'GET', authorization:\
    \ 'expectedGoogleAuth' }\n    );\n  });\n});\n"
- name: Request URL contains required fields (when using a Custom ID Key)
  code: "mockData.itemIdKey = 'item_sku';\n\nrunCode(mockData).then(variableResult\
    \ => {\n  mockData.items.forEach(item => {\n  assertApi('sendHttpRequest').wasCalledWith(\n\
    \    'https://shoppingcontent.googleapis.com/content/v2.1/' + \n    enc(mockData.merchant_center_id)\
    \ + \n    '/products/online:' + \n    enc(mockData.feed_language) + \n    ':'\
    \ + \n    enc(mockData.feed_label) + \n    ':' + \n    enc(item[mockData.itemIdKey]),\
    \ \n    { method: 'GET', authorization: 'expectedGoogleAuth' }\n    );\n  });\n\
    });\n\n"
- name: Items Array is modified when the Item ID matches the Item ID in Merchant Center
    (when NOT using a Custom Item ID Key)
  code: |-
    mockData.map_categories = true;
    mockData.mapping_basic = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable: 'description'} ];

    setSendHttpRequest();

    runCode(mockData).then(variableResult => {
      assertThat(variableResult).isEqualTo([
        {
          item_id: '123',
          item_sku: 'abc',
          price: 1,
          product_type: 'produtinho maravilhoso para voce123',
          description:
            'test testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest test',
          item_category: 'Garden furniture'
        },
        {
          item_id: '456',
          item_sku: 'def',
          price: 2.99,
          product_type: 'produtinho maravilhoso para voce456',
          description:
            'test testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest test',
          item_category: 'Garden furniture'
        }
      ]);
    });
- name: Items Array is modified when the Item ID matches the Item ID in Merchant Center
    (when using a Custom Item ID Key)
  code: |-
    mockData.itemIdKey = 'item_sku';
    mockData.map_categories = true;
    mockData.mapping_basic = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable: 'description'} ];

    setSendHttpRequest();

    runCode(mockData).then(variableResult => {
      assertThat(variableResult).isEqualTo([
        {
          item_id: '123',
          item_sku: 'abc',
          price: 1,
          product_type: 'produtinho maravilhoso para voceabc',
          description:
            'test testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest test',
          item_category: 'Garden furniture'
        },
        {
          item_id: '456',
          item_sku: 'def',
          price: 2.99,
          product_type: 'produtinho maravilhoso para vocedef',
          description:
            'test testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest testtest test',
          item_category: 'Garden furniture'
        }
      ]);
    });
- name: Items Array is NOT modified when the Item ID does NOT match the Item ID in
    Merchant Center
  code: |
    mockData.map_categories = true;
    mockData.mapping_basic = [ { merchant_center_variable : 'title', item_variable: 'product_type'} ];
    mockData.mapping_custom = [ { merchant_center_variable : 'description', item_variable: 'description'} ];

    const noMatch = true;
    setSendHttpRequest(noMatch);

    runCode(mockData).then(variableResult => {
      assertThat(variableResult).isEqualTo([
        { item_id: '123', item_sku: 'abc', price: 1 },
        { item_id: '456', item_sku: 'def', price: 2.99 }
      ]);
    });
- name: Items Array is NOT modified when a request promise rejects
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
        { item_id: '123', item_sku: 'abc', price: 1 },
        { item_id: '456', item_sku: 'def', price: 2.99 }
      ]);
    });
setup: "const encodeUriComponent = require('encodeUriComponent');\nconst Promise =\
  \ require('Promise');\nconst JSON = require('JSON');\n\nconst enc = (data) => {\n\
  \  return encodeUriComponent(data || '');\n};\n\nconst mockData = {\n  items: [{\
  \ item_id: '123', item_sku: 'abc', price: 1 }, { item_id: '456', item_sku: 'def',\
  \ price: 2.99 }],\n  cache: '12',\n  merchant_center_id: '1111111111',\n  feed_language:\
  \ 'en',\n  feed_label: 'BR'\n};\n\n\nconst getNoMatchResponse = () => {\n  return\
  \ {\n    statusCode: 404,\n    body: {\n      error: {\n        code: 404,\n   \
  \     message: 'item not found',\n        errors: [\n          {\n            message:\
  \ 'item not found',\n            domain: 'global',\n            reason: 'notFound'\n\
  \          }\n        ]\n      }\n    }\n  };\n};\n\nconst getMatchResponse = ()\
  \ => {\n  return {\n    statusCode: 200,\n    body: {\n      kind: 'content#product',\n\
  \      id: 'online:en:BR:',\n      offerId: '',\n      identifierExists: false,\n\
  \      title: 'produtinho maravilhoso para voce',\n      description:\n        'test\
  \ testtest testtest testtest testtest testtest testtest testtest testtest testtest\
  \ testtest testtest testtest testtest testtest testtest test',\n      link: 'https://example.com/',\n\
  \      imageLink:\n        'https://shopping.googleusercontent.com/image?q=test',\n\
  \      contentLanguage: 'en',\n      targetCountry: 'BR',\n      feedLabel: 'BR',\n\
  \      channel: 'online',\n      availability: 'in stock',\n      condition: 'new',\n\
  \      googleProductCategory: '5181',\n      price: {\n        value: '1.00',\n\
  \        currency: 'USD'\n      },\n      productTypes: ['Garden furniture'],\n\
  \      shipping: [\n        {\n          country: 'BR'\n        }\n      ],\n  \
  \    includedDestinations: ['SurfacesAcrossGoogle'],\n      customAttributes: [\n\
  \        {\n          name: 'update type',\n          value: 'merge'\n        }\n\
  \      ]\n    }\n  };\n};\n\nconst setSendHttpRequest = (noMatch) => {\n  let sendHttpRequestExecutions\
  \ = 0;\n  mock('sendHttpRequest', (requestUrl, requestOptions, requestBody) => {\n\
  \    const itemIdKey = mockData.itemIdKey ? mockData.itemIdKey : 'item_id';\n  \
  \  const itemId = mockData.items[sendHttpRequestExecutions][itemIdKey];\n    \n\
  \    let response;\n    if (noMatch) {\n      response = getNoMatchResponse();\n\
  \    } else {\n      response = getMatchResponse();\n      response.body.id += itemId;\n\
  \      response.body.offerId += itemId;\n      response.body.title += itemId;\n\
  \    }\n\n    sendHttpRequestExecutions++;\n\n    return Promise.create((resolve,\
  \ reject) => {\n      resolve({\n        statusCode: response.statusCode,\n    \
  \    body: JSON.stringify(response.body)\n      });\n    });\n  });\n};\nsetSendHttpRequest();\n\
  \nmockObject('templateDataStorage', {\n  setItemCopy: (key, value) => { },\n  getItemCopy:\
  \ (key) => { }\n});\n\nmock('getGoogleAuth', 'expectedGoogleAuth');"


___NOTES___

Created on 17.12.2023 20.58.54


