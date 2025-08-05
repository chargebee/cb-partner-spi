# CreditNoteApi

All URIs are relative to *https://rest.taxes.provider.com/api/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**commitCreditNote**](CreditNoteApi.md#commitCreditNote) | **POST** /credit-notes/{creditNoteId}/commit | Commit credit note |
| [**createCreditNote**](CreditNoteApi.md#createCreditNote) | **POST** /credit-notes | Create credit note |
| [**fetchCreditNote**](CreditNoteApi.md#fetchCreditNote) | **GET** /credit-notes/{creditNoteId} | Retrieve credit note |
| [**voidCreditNote**](CreditNoteApi.md#voidCreditNote) | **POST** /credit-notes/{creditNoteId}/void | Void credit note |


<a id="commitCreditNote"></a>
# **commitCreditNote**
> commitCreditNote(creditNoteId, invoiceId, merchantId, traceId)

Commit credit note

This endpoint is used to mark a credit note as committed. Once committed, the credit note is considered as finalized.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.CreditNoteApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    CreditNoteApi apiInstance = new CreditNoteApi(defaultClient);
    String creditNoteId = "creditNoteId_example"; // String | The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider.
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    try {
      apiInstance.commitCreditNote(creditNoteId, invoiceId, merchantId, traceId);
    } catch (ApiException e) {
      System.err.println("Exception when calling CreditNoteApi#commitCreditNote");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **creditNoteId** | **String**| The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider. | |
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | [optional] |
| **merchantId** | **String**| Merchant&#39;s domain name will be sent by Chargebee | [optional] |
| **traceId** | **String**| Unique id of the request will be sent by Chargebee | [optional] |

### Return type

null (empty response body)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Credit note committed successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="createCreditNote"></a>
# **createCreditNote**
> CreditNote createCreditNote(merchantId, traceId, creditNoteRequest)

Create credit note

This endpoint is used to send a credit note to the Tax Service Adapter. A credit note is used to reduce the amount due on an invoice. If the credit note is issued after payments have been made for the invoice, refunds can be issued to the Customer.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.CreditNoteApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    CreditNoteApi apiInstance = new CreditNoteApi(defaultClient);
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    CreditNoteRequest creditNoteRequest = new CreditNoteRequest(); // CreditNoteRequest | 
    try {
      CreditNote result = apiInstance.createCreditNote(merchantId, traceId, creditNoteRequest);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling CreditNoteApi#createCreditNote");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **merchantId** | **String**| Merchant&#39;s domain name will be sent by Chargebee | [optional] |
| **traceId** | **String**| Unique id of the request will be sent by Chargebee | [optional] |
| **creditNoteRequest** | [**CreditNoteRequest**](CreditNoteRequest.md)|  | [optional] |

### Return type

[**CreditNote**](CreditNote.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Credit note created successfully. |  -  |
| **400** | Bad request. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="fetchCreditNote"></a>
# **fetchCreditNote**
> CreditNote fetchCreditNote(creditNoteId, invoiceId, merchantId, traceId)

Retrieve credit note

This endpoint is used to retrieve a specific credit note using the unique credit note id.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.CreditNoteApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    CreditNoteApi apiInstance = new CreditNoteApi(defaultClient);
    String creditNoteId = "creditNoteId_example"; // String | The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider.
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    try {
      CreditNote result = apiInstance.fetchCreditNote(creditNoteId, invoiceId, merchantId, traceId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling CreditNoteApi#fetchCreditNote");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **creditNoteId** | **String**| The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider. | |
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | [optional] |
| **merchantId** | **String**| Merchant&#39;s domain name will be sent by Chargebee | [optional] |
| **traceId** | **String**| Unique id of the request will be sent by Chargebee | [optional] |

### Return type

[**CreditNote**](CreditNote.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Credit note retrieved successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="voidCreditNote"></a>
# **voidCreditNote**
> voidCreditNote(creditNoteId, invoiceId, merchantId, traceId, voidRequest)

Void credit note

This endpoint is used to void the credit note for a specific credit note id. Voiding reverses the credit note, thereby restoring the amount due on the invoice.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.CreditNoteApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    CreditNoteApi apiInstance = new CreditNoteApi(defaultClient);
    String creditNoteId = "creditNoteId_example"; // String | The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider.
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    VoidRequest voidRequest = new VoidRequest(); // VoidRequest | 
    try {
      apiInstance.voidCreditNote(creditNoteId, invoiceId, merchantId, traceId, voidRequest);
    } catch (ApiException e) {
      System.err.println("Exception when calling CreditNoteApi#voidCreditNote");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **creditNoteId** | **String**| The unique identifier of the credit note at the Tax Service Adapter or Tax Service Provider. | |
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | [optional] |
| **merchantId** | **String**| Merchant&#39;s domain name will be sent by Chargebee | [optional] |
| **traceId** | **String**| Unique id of the request will be sent by Chargebee | [optional] |
| **voidRequest** | [**VoidRequest**](VoidRequest.md)|  | [optional] |

### Return type

null (empty response body)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Credit note voided successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

