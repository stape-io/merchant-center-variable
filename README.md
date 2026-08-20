# Google Merchant Center Lookup Variable for Google Tag Manager Server Container

The **Google Merchant Center Lookup** variable retrieves and enhances product data by querying a Google Merchant Center account.

It's especially useful for adding product details like categories or attributes when sending data to other systems, such as Google Ads or Google Analytics, through a server-side GTM container.

## Merchant API setup

### Configuration Steps
<details>
    <summary>⬇️ Click to expand ⬇️</summary>
    <br/>

**Run the following commands from a terminal or [Cloud Shell](https://console.cloud.google.com/welcome?cloudshell=true) on your GCP Project to enable the Merchant API in the GCP Project and register your GCP Project with the Merchant Center account.**

Registration is required by the Merchant API and must be done once per Merchant Center account.
[Learn more](https://developers.google.com/merchant/api/guides/quickstart/registration).

> **Important:** Perform this registration on your **primary** Merchant Center account only, not on its sub-accounts. A GCP Project can only be linked to one Merchant Center account, but a Merchant Center account can have multiple GCP Projects registered.

1. Open terminal or [Cloud Shell](https://console.cloud.google.com/welcome?cloudshell=true) on your GCP Project.

2. Copy the following script into a text editor and replace the `GCP_PROJECT_ID`, `MERCHANT_CENTER_ACCOUNT_ID`, and `SERVICE_ACCOUNT_EMAIL` variables with your actual values.
   > ⚠️ The `SERVICE_ACCOUNT_EMAIL` must belong to a Service Account that has Admin access to the Merchant Center account. You can reuse the existing one (recommended) or create a new Service Account, but ensure it has the necessary permissions.

   ```bash
   # Replace these with your actual values
   GCP_PROJECT_ID="your-gcp-project-id" # https://support.google.com/googleapi/answer/7014113?hl=en
   MERCHANT_CENTER_ACCOUNT_ID="your-merchant-center-account-id" # https://support.google.com/paymentscenter/answer/7163092?hl=en
   SERVICE_ACCOUNT_EMAIL="your-service-account@your-project.iam.gserviceaccount.com"

   # Do not change anything in the lines below!

   # Set your active gcloud project context
   gcloud config set project ${GCP_PROJECT_ID}

   # Enable the Merchant API and the IAM Service Account Credentials API
   # (can also be done via the GCP Console UI)
   gcloud services enable merchantapi.googleapis.com iamcredentials.googleapis.com

   # Generate an access token by impersonating the Service Account with the Merchant Center scope.
   # If this command throws a permission error, ensure your personal user account
   # has the "Service Account Token Creator" IAM role on the project.
   ACCESS_TOKEN=$(gcloud auth application-default print-access-token \
     --impersonate-service-account="${SERVICE_ACCOUNT_EMAIL}" \
     --scopes="https://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/content")

   # Register the GCP Project with the Merchant Center account
   curl -X POST \
     "https://merchantapi.googleapis.com/accounts/v1/accounts/${MERCHANT_CENTER_ACCOUNT_ID}/developerRegistration:registerGcp" \
     -H "Authorization: Bearer ${ACCESS_TOKEN}" \
     -H "Content-Type: application/json" \
     -d "{}"

3. After replacing the values, copy the modified version, paste it into the GCP Project Terminal or Cloud Shell, and run it.
4. If everything was successful, a message like this one should be displayed.
   ```json
   {
      "name": "accounts/YOUR_MERCHANT_CENTER_ACCOUNT_ID/developerRegistration",
      "gcpIds": [
        "YOUR_GCP_PROJECT_NUMBER"
      ]
   }
   ```

5. **Update the variable template in sGTM and test it**
6. **Publish the changes**
</details>

## Migrating from Content API for Shopping to Merchant API

The template uses the [**Merchant API**](https://developers.google.com/merchant/api) starting from June, 2026.

If you were previously using a version of this template that used the **Content API for Shopping** (scheduled to be deprecated in August 18, 2026) or if you are configuring the integration from scratch, follow [these steps](https://github.com/stape-io/merchant-center-variable#configuration-steps) to configure the Merchant API.

## Useful resources

- [Google Merchant Center Lookup variable for Google Tag Manager server container step-by-step guide](https://stape.io/blog/google-merchant-center-lookup-variable-for-google-tag-manager-server-container)

## Open Source

Initial development was done by [Lars Friis](https://www.linkedin.com/in/lars-friis/).

The **Google Merchant Center Lookup** variable for GTM Server is developed and maintained by the [Stape Team](https://stape.io/) under the Apache 2.0 license.

### GTM Gallery Status
🟢 [Listed](https://tagmanager.google.com/gallery/#/owners/stape-io/templates/merchant-center-variable)
