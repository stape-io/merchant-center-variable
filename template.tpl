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
        "displayName": "Items (input to be enriched)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "merchant_center_id",
        "displayName": "Merchant center id",
        "simpleValueType": true
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
        "displayName": "Feed language",
        "simpleValueType": true,
        "help": "Find parameter in merchant center url: feedLabel\u003dDK"
      },
      {
        "type": "TEXT",
        "name": "feed_label",
        "displayName": "Feed label",
        "simpleValueType": true,
        "help": "Find parameter in merchant center url: language\u003dda"
      },
      {
        "type": "CHECKBOX",
        "name": "map_categories",
        "checkboxText": "Map product_types into item_categories",
        "simpleValueType": true
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
            "displayName": "Merchant center variable",
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
        ]
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
            "displayName": "Merchant center variable",
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
        ]
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

scenarios: []


___NOTES___

Created on 17.12.2023 20.58.54


