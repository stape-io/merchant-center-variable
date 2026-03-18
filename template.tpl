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
        "type": "CHECKBOX",
        "name": "map_categories",
        "checkboxText": "Map product_types into item_categories",
        "simpleValueType": true,
        "help": "If checked, this option maps the \u003ci\u003eproduct_type\u003c/i\u003e in the Merchant Center to the \u003ci\u003eitem_category\u003c/i\u003e field."
      },
      {
        "type": "CHECKBOX",
        "name": "enable_item_match_status",
        "checkboxText": "Add item match status property",
        "simpleValueType": true,
        "help": "Adds the property \u003cb\u003emerchant_center_status\u003c/b\u003e to each product in the Items Array. It returns\u003c/br\u003e\n\u003cul\u003e\n\u003cli\u003e\u003cb\u003ematch\u003c/b\u003e: The item was found in your catalogue.\u003c/li\u003e\n\u003cli\u003e\u003cb\u003eno_match\u003c/b\u003e:  The item was not found in your catalogue.\u003c/li\u003e\n\u003cli\u003e\u003cb\u003eapi_error\u003c/b\u003e: There was a problem in the API call.\u003c/li\u003e\n\u003c/ul\u003e"
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
  },
  {
    "displayName": "BigQuery Logs Settings",
    "name": "bigQueryLogsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "RADIO",
        "name": "bigQueryLogType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log to BigQuery"
          },
          {
            "value": "always",
            "displayValue": "Log to BigQuery"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "no"
      },
      {
        "type": "GROUP",
        "name": "logsBigQueryConfigGroup",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "logBigQueryProjectId",
            "displayName": "BigQuery Project ID",
            "simpleValueType": true,
            "help": "Optional. \u003cbr\u003e\u003cbr\u003e  If omitted, it will be retrieved from the environment variable \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e where the server container is running. If the server container is running on Google Cloud, \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e will already be set to the Google Cloud project\u0027s ID."
          },
          {
            "type": "TEXT",
            "name": "logBigQueryDatasetId",
            "displayName": "BigQuery Dataset ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "logBigQueryTableId",
            "displayName": "BigQuery Table ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const BigQuery = require('BigQuery');
const encodeUriComponent = require('encodeUriComponent');
const getContainerVersion = require('getContainerVersion');
const getGoogleAuth = require('getGoogleAuth');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
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

  log({
    Name: 'GoogleMerchantCenterLookup',
    Type: 'Request',
    EventName: 'LookupRequest',
    RequestMethod: 'GET',
    RequestUrl: url
  });

  const auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/content']
  });

  return sendHttpRequest(url, { method: 'GET', authorization: auth }).then(
    (result) => {
      log({
        Name: 'GoogleMerchantCenterLookup',
        Type: 'Response',
        EventName: 'LookupRequest',
        ResponseStatusCode: result.statusCode,
        ResponseHeaders: result.headers,
        ResponseBody: result.body
      });
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
      log({
        Name: 'GoogleMerchantCenterLookup',
        Type: 'Message',
        EventName: 'LookupRequest',
        Message: 'Some request may have failed or timed out.',
        Reason: JSON.stringify(result)
      });
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

function log(rawDataToLog) {
  const logDestinationsHandlers = {};
  if (determinateIsLoggingEnabled()) logDestinationsHandlers.console = logConsole;
  if (determinateIsLoggingEnabledForBigQuery()) logDestinationsHandlers.bigQuery = logToBigQuery;

  rawDataToLog.TraceId = getRequestHeader('trace-id');

  const keyMappings = {
    // No transformation for Console is needed.
    bigQuery: {
      Name: 'tag_name',
      Type: 'type',
      TraceId: 'trace_id',
      EventName: 'event_name',
      RequestMethod: 'request_method',
      RequestUrl: 'request_url',
      RequestBody: 'request_body',
      ResponseStatusCode: 'response_status_code',
      ResponseHeaders: 'response_headers',
      ResponseBody: 'response_body'
    }
  };

  for (const logDestination in logDestinationsHandlers) {
    const handler = logDestinationsHandlers[logDestination];
    if (!handler) continue;

    const mapping = keyMappings[logDestination];
    const dataToLog = mapping ? {} : rawDataToLog;

    if (mapping) {
      for (const key in rawDataToLog) {
        const mappedKey = mapping[key] || key;
        dataToLog[mappedKey] = rawDataToLog[key];
      }
    }

    handler(dataToLog);
  }
}

function logConsole(dataToLog) {
  logToConsole(JSON.stringify(dataToLog));
}

function logToBigQuery(dataToLog) {
  const connectionInfo = {
    projectId: data.logBigQueryProjectId,
    datasetId: data.logBigQueryDatasetId,
    tableId: data.logBigQueryTableId
  };
  dataToLog.timestamp = getTimestampMillis();

  ['request_body', 'response_headers', 'response_body'].forEach((p) => {
    dataToLog[p] = JSON.stringify(dataToLog[p]);
  });
  BigQuery.insert(connectionInfo, [dataToLog], { ignoreUnknownValues: true });
}

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

function determinateIsLoggingEnabledForBigQuery() {
  if (data.bigQueryLogType === 'no') return false;
  return data.bigQueryLogType === 'always';
}

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
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
  },
  {
    "instance": {
      "key": {
        "publicId": "access_bigquery",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedTables",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "projectId"
                  },
                  {
                    "type": 1,
                    "string": "datasetId"
                  },
                  {
                    "type": 1,
                    "string": "tableId"
                  },
                  {
                    "type": 1,
                    "string": "operation"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ]
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
- name: '[Early Exit] Returns undefined when items is not an array'
  code: |-
    mockData.items = undefined;

    const variableResult = runCode(mockData);

    assertThat(variableResult).isUndefined();
    assertApi('sendHttpRequest').wasNotCalled();
- name: '[Request URL] Request URL contains required fields (when NOT using a Custom
    ID Key)'
  code: "runCode(mockData).then(variableResult => {\n  mockData.items.forEach(item\
    \ => {\n    assertApi('sendHttpRequest').wasCalledWith(\n      'https://shoppingcontent.googleapis.com/content/v2.1/'\
    \ + \n      enc(mockData.merchant_center_id) + \n      '/products/online:' + \n\
    \      enc(mockData.feed_language) + \n      ':' + \n      enc(mockData.feed_label)\
    \ + \n      ':' + \n      enc(item.item_id), \n      { method: 'GET', authorization:\
    \ 'expectedGoogleAuth' }\n    );\n  });\n});\n"
- name: '[Request URL] Request URL contains required fields (when using a Custom ID
    Key)'
  code: "mockData.itemIdKey = 'item_sku';\n\nrunCode(mockData).then(variableResult\
    \ => {\n  mockData.items.forEach(item => {\n  assertApi('sendHttpRequest').wasCalledWith(\n\
    \    'https://shoppingcontent.googleapis.com/content/v2.1/' + \n    enc(mockData.merchant_center_id)\
    \ + \n    '/products/online:' + \n    enc(mockData.feed_language) + \n    ':'\
    \ + \n    enc(mockData.feed_label) + \n    ':' + \n    enc(item[mockData.itemIdKey]),\
    \ \n    { method: 'GET', authorization: 'expectedGoogleAuth' }\n    );\n  });\n\
    });\n\n"
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

Created on 17.12.2023 20.58.54


