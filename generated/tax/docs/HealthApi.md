# HealthApi

All URIs are relative to *https://rest.taxes.provider.com/api/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**fetchHealth**](HealthApi.md#fetchHealth) | **GET** /health | Fetch the health status of the Service Provider. |


<a id="fetchHealth"></a>
# **fetchHealth**
> HealthCheckResponse fetchHealth(merchantId, traceId)

Fetch the health status of the Service Provider.

This endpoint is used to fetch the health status of the Service Provider.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.HealthApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    HealthApi apiInstance = new HealthApi(defaultClient);
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    try {
      HealthCheckResponse result = apiInstance.fetchHealth(merchantId, traceId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling HealthApi#fetchHealth");
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

### Return type

[**HealthCheckResponse**](HealthCheckResponse.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Service is healthy. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

