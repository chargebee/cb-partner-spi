

# Customer

The details of the Customer.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**name** | **String** | The name of the Customer in Chargebee. |  [optional] |
|**customerCode** | **String** | The unique identifier for the Customer in Chargebee. |  |
|**company** | **String** | The company name of the customer |  [optional] |
|**address** | [**Address**](Address.md) |  |  |
|**taxRegistrationNumber** | **String** | The tax registration number of a business in a country. For example, this is the GSTIN for India or the VAT number for EU or Australia. |  [optional] |
|**taxIdentifiers** | [**List&lt;FieldItem&gt;**](FieldItem.md) | It represents the information related to the customer&#39;s tax identifiers. This includes details such as exemption status etc. |  [optional] |
|**hasNexus** | **Boolean** | Determines whether a tax nexus exists between the Seller and the tax authority at the address provided. |  [optional] |
|**locationEvidence** | [**CustomerLocationEvidence**](CustomerLocationEvidence.md) |  |  [optional] |



