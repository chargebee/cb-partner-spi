# InvoiceApi

All URIs are relative to *https://rest.taxes.provider.com/api/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**commitInvoice**](InvoiceApi.md#commitInvoice) | **POST** /invoices/{invoiceId}/commit | Commit Invoice |
| [**createInvoice**](InvoiceApi.md#createInvoice) | **POST** /invoices | Create Invoice |
| [**fetchInvoice**](InvoiceApi.md#fetchInvoice) | **GET** /invoices/{invoiceId} | Retrieve Invoice |
| [**voidInvoice**](InvoiceApi.md#voidInvoice) | **POST** /invoices/{invoiceId}/void | Void Invoice |


<a id="commitInvoice"></a>
# **commitInvoice**
> commitInvoice(invoiceId, merchantId, traceId)

Commit Invoice

This endpoint is used to commit an invoice for a given invoice id. Once committed, the invoice is considered to be finalized.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.InvoiceApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    InvoiceApi apiInstance = new InvoiceApi(defaultClient);
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    try {
      apiInstance.commitInvoice(invoiceId, merchantId, traceId);
    } catch (ApiException e) {
      System.err.println("Exception when calling InvoiceApi#commitInvoice");
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
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | |
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
| **204** | Invoice committed successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="createInvoice"></a>
# **createInvoice**
> Invoice createInvoice(merchantId, traceId, invoiceRequest)

Create Invoice

This endpoint is used to send an invoice to the Tax Service Provider. Invoices created in Chargebee are statements of amounts owed by the Customer to the Merchant for a specific purchase.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.InvoiceApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    InvoiceApi apiInstance = new InvoiceApi(defaultClient);
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    InvoiceRequest invoiceRequest = new InvoiceRequest(); // InvoiceRequest | 
    try {
      Invoice result = apiInstance.createInvoice(merchantId, traceId, invoiceRequest);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InvoiceApi#createInvoice");
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
| **invoiceRequest** | [**InvoiceRequest**](InvoiceRequest.md)|  | [optional] |

### Return type

[**Invoice**](Invoice.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Invoice created successfully. |  -  |
| **400** | Bad request. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="fetchInvoice"></a>
# **fetchInvoice**
> Invoice fetchInvoice(invoiceId, merchantId, traceId)

Retrieve Invoice

This endpoint is used to retrieve an invoice for a given invoice id.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.InvoiceApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    InvoiceApi apiInstance = new InvoiceApi(defaultClient);
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    try {
      Invoice result = apiInstance.fetchInvoice(invoiceId, merchantId, traceId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InvoiceApi#fetchInvoice");
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
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | |
| **merchantId** | **String**| Merchant&#39;s domain name will be sent by Chargebee | [optional] |
| **traceId** | **String**| Unique id of the request will be sent by Chargebee | [optional] |

### Return type

[**Invoice**](Invoice.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Invoice retrieved successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="voidInvoice"></a>
# **voidInvoice**
> voidInvoice(invoiceId, merchantId, traceId, voidRequest)

Void Invoice

This endpoint is used to mark a specific invoice as void. Voiding cancels the invoice without deleting it.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.InvoiceApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    InvoiceApi apiInstance = new InvoiceApi(defaultClient);
    String invoiceId = "invoiceId_example"; // String | The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider.
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    VoidRequest voidRequest = new VoidRequest(); // VoidRequest | 
    try {
      apiInstance.voidInvoice(invoiceId, merchantId, traceId, voidRequest);
    } catch (ApiException e) {
      System.err.println("Exception when calling InvoiceApi#voidInvoice");
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
| **invoiceId** | **String**| The unique identifier of the invoice at the Tax Service Adapter or Tax Service Provider. | |
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
| **204** | Invoice voided successfully. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **404** | Not found. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

