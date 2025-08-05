

# TaxEstimationRequest

Defines the parameters of a tax estimation request. This is sent to the Tax Service Adapter by Chargebee to estimate taxes for one or more line items.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**seller** | [**Seller**](Seller.md) |  |  |
|**customer** | [**Customer**](Customer.md) |  |  |
|**estimateDateTime** | **OffsetDateTime** | The time as of which the tax estimation is to be calculated. This can be a value in the past. For example, if the value is provided as 2022-10-28T15:36:28.129+05:30, then the tax rates applicable on October 28, 2022, at 15:36:28.129, with an offset of +05:30 ahead of UTC/GMT are used for calculations. In case of a merchant site located in UTC, these data types would send a timestamp in the format 2022-11-11T15:40:44.65Z. This timestamp represents November 11, 2022, at 15:40:44.65, with the &#39;Z&#39; indicating that the time is in UTC |  |
|**currency** | **String** | The [currency](https://en.wikipedia.org/wiki/Currency) in the [ISO-4217 format](https://www.iso.org/iso-4217-currency-codes.html). |  |
|**lineItems** | [**List&lt;TaxEstimationLineItemRequest&gt;**](TaxEstimationLineItemRequest.md) | Contains the details of each line item in the tax estimation request. |  |



