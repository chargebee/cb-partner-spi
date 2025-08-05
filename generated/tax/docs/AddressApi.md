# AddressApi

All URIs are relative to *https://rest.taxes.provider.com/api/v1*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**checkAddressTaxability**](AddressApi.md#checkAddressTaxability) | **POST** /address/check-taxability | Check taxability |
| [**validateAddress**](AddressApi.md#validateAddress) | **POST** /address/validate | Address validation |


<a id="checkAddressTaxability"></a>
# **checkAddressTaxability**
> CheckAddressTaxabilityResponse checkAddressTaxability(merchantId, traceId, checkAddressTaxabilityRequest)

Check taxability

Checks whether the tax address is valid in terms of tax calculation. This endpoint checks whether the address information of the customer is sufficient for the tax provider to return a tax rate. It does not consider the nexus status of the merchant and is mandatory to integrate for the tax provider.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.AddressApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    AddressApi apiInstance = new AddressApi(defaultClient);
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    CheckAddressTaxabilityRequest checkAddressTaxabilityRequest = new CheckAddressTaxabilityRequest(); // CheckAddressTaxabilityRequest | 
    try {
      CheckAddressTaxabilityResponse result = apiInstance.checkAddressTaxability(merchantId, traceId, checkAddressTaxabilityRequest);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling AddressApi#checkAddressTaxability");
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
| **checkAddressTaxabilityRequest** | [**CheckAddressTaxabilityRequest**](CheckAddressTaxabilityRequest.md)|  | [optional] |

### Return type

[**CheckAddressTaxabilityResponse**](CheckAddressTaxabilityResponse.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Tax can be calculated for the address provided. |  -  |
| **400** | Bad request. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

<a id="validateAddress"></a>
# **validateAddress**
> AddressValidationResponse validateAddress(merchantId, traceId, addressValidationRequest)

Address validation

Checks whether a given address is a valid delivery address for shipping purposes. The tax provider can decide whether to mention the full or valid address depending on their requirement.

### Example
```java
// Import classes:
import org.chargebee.spi.tax.client.ApiClient;
import org.chargebee.spi.tax.client.ApiException;
import org.chargebee.spi.tax.client.Configuration;
import org.chargebee.spi.tax.client.auth.*;
import org.chargebee.spi.tax.client.models.*;
import org.chargebee.spi.tax.api.AddressApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://rest.taxes.provider.com/api/v1");
    
    // Configure API key authorization: Authorization
    ApiKeyAuth Authorization = (ApiKeyAuth) defaultClient.getAuthentication("Authorization");
    Authorization.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //Authorization.setApiKeyPrefix("Token");

    AddressApi apiInstance = new AddressApi(defaultClient);
    String merchantId = "merchantId_example"; // String | Merchant's domain name will be sent by Chargebee
    String traceId = "traceId_example"; // String | Unique id of the request will be sent by Chargebee
    AddressValidationRequest addressValidationRequest = new AddressValidationRequest(); // AddressValidationRequest | 
    try {
      AddressValidationResponse result = apiInstance.validateAddress(merchantId, traceId, addressValidationRequest);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling AddressApi#validateAddress");
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
| **addressValidationRequest** | [**AddressValidationRequest**](AddressValidationRequest.md)|  | [optional] |

### Return type

[**AddressValidationResponse**](AddressValidationResponse.md)

### Authorization

[Authorization](../README.md#Authorization)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Address is validated successfully |  -  |
| **400** | Bad request. |  -  |
| **401** | Unauthenticated request. |  -  |
| **403** | Unauthorized request. |  -  |
| **429** | Too many requests. |  -  |
| **500** | Unexpected error while processing request. |  -  |
| **503** | Service is unhealthy. |  -  |

