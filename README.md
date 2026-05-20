## What is Partner SPI?
Chargebee supports a wide range of third-party integrations to deliver enhanced functionalities to its customers. To facilitate this, Chargebee provides Service Provider Interfaces (SPI), defined in the OpenAPI specification, for various capabilities.

Chargebee Partners can leverage this SPI to develop apps that seamlessly integrate with Chargebee, extending its core capabilities to meet diverse business needs.


## What are the available Chargebee Partner SPI? 
Currently, Chargebee offer SPI for the following capabilities:

- [Tax](https://spidocs.chargebee.com/api-reference/partner-spi/overview)
- [Tax Registration Number Validation](https://spidocs.chargebee.com/api-reference/partner-spi/overview)

SPI allow partners to build custom apps by implementing the SPI-defined endpoints. The detailed OpenAPI specifications for this SPI can be found in the spec/spi folder of the repository:

- [Tax SPI](./spec/spi/openapi_tax.yml) 
- [Tax Registration Number Validation SPI](./spec/spi/openapi_trn.yml)

## Integrate your App with Chargebee

After building your app you can integrate it with Chargebee by following the App Onboarding process from [here](https://spidocs.chargebee.com/app-onboarding/guide).

## Getting Started

### Requirement

- Java 17
  
If you are building your application with java, you can use any active library version as dependency in your Maven or Gradle project.

### Maven

```maven
<dependency>
    <groupId>com.chargebee</groupId>
    <artifactId>cb-partner-spi</artifactId>
    <version>${version}</version>
</dependency>
```

### Gradle

```gradle
implementation 'com.chargebee:cb-partner-spi:${version}'
```

Following sample Java code demonstrates how to use the APIs and models from this project:

```java

/// Import classes:
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

    // Configure API key authorization: apiKey
    ApiKeyAuth apiKey = (ApiKeyAuth) defaultClient.getAuthentication("apiKey");
    apiKey.setApiKey("YOUR API KEY");
    // Uncomment the following line to set a prefix for the API key, e.g. "Token" (defaults to null)
    //apiKey.setApiKeyPrefix("Token");

    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    AddressApi apiInstance = new AddressApi(defaultClient);
    CheckAddressTaxabilityRequest checkAddressTaxabilityRequest = new CheckAddressTaxabilityRequest(); // CheckAddressTaxabilityRequest | 
    try {
      CheckAddressTaxabilityResponse result = apiInstance.checkAddressTaxability(checkAddressTaxabilityRequest);
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

## JSON Schema validation
The capabilities of the built apps will be validated against a constantly updating JSON Schema, to validate the correctness and completeness of configurations. JSON Schema can be referenced [here](spec/capabilities/tax-provider.schema.json).


Run the below script to perform json schema validation:
```shell
  sh json_schema_validation.sh <path to json file>
```
Example:
```shell
  sh json_schema_validation.sh spec/capabilities/tax-provider.file.json
```

## Chargebee Developer Docs

- [Local Setup](docs/local-setup.md)
- [Add or Update a SPI](docs/add-update-spi.md)
- [Update Mintlify Files](docs/mintlify-files.md)
- [Postman Collection](docs/postman-collection.md)
- [Release](docs/release.md)
- [Guidelines](docs/guidelines.md)