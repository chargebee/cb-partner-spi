

# TaxEstimationResponse

The response sent by the Tax Service Adapter to Chargebee for a tax estimation request.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**seller** | [**Seller**](Seller.md) |  |  |
|**customer** | [**Customer**](Customer.md) |  |  |
|**estimateDateTime** | **OffsetDateTime** | The time as of which the tax estimation is to be calculated. This can be a value in the past. For example, if the value is provided as 2022-10-28T15:36:28.129+05:30, then the tax rates applicable on October 28, 2022, at 15:36:28.129, with an offset of +05:30 ahead of UTC/GMT are used for calculations. In case of a merchant site located in UTC, these data types would send a timestamp in the format 2022-11-11T15:40:44.65Z. This timestamp represents November 11, 2022, at 15:40:44.65, with the &#39;Z&#39; indicating that the time is in UTC |  |
|**currency** | **String** | The [currency](https://en.wikipedia.org/wiki/Currency) in the [ISO-4217 format](https://www.iso.org/iso-4217-currency-codes.html). |  |
|**subtotal** | **Double** | The amount after discounts. This is the sum of all &#x60;lineItems.subtotal&#x60;. |  |
|**exemptAmount** | **Double** | The part of the &#x60;subtotal&#x60; that is exempted from tax. |  |
|**discountAmount** | **Double** | The total discount applied. This is the sum of all &#x60;lineItems.discount&#x60;. |  |
|**taxableAmount** | **Double** | The part of the &#x60;subtotal&#x60; that is taxable. |  |
|**taxAmount** | **Double** | The total tax payable. This is the sum of all &#x60;lineItems.taxAmount&#x60;. |  |
|**total** | **Double** | The total after discounts and taxes. This is the same as &#x60;subtotal&#x60; if it is tax inclusive; otherwise it is &#x60;subtotal&#x60; + &#x60;taxAmount&#x60;. &#x60;total&#x60; can also be expressed as &#x60;exemptAmount&#x60; + &#x60;taxableAmount&#x60; + &#x60;taxAmount&#x60;. |  |
|**lineItems** | [**List&lt;InvoiceLineItem&gt;**](InvoiceLineItem.md) | List of line item details for the tax estimation response. |  |



