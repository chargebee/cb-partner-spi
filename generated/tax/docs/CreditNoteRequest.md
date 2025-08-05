

# CreditNoteRequest

The details of a credit note sent to the Tax Service Adapter by Chargebee. A credit note is used to reduce the amount due on an invoice. If the credit note is issued after payments have been made for the invoice, refunds can be issued to the Customer.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**creditNoteCode** | **String** | The unique identifier of the credit note in Chargebee. |  |
|**invoiceCode** | **String** | The unique identifier of the invoice in Chargebee to which this credit note belongs. |  [optional] |
|**invoiceId** | **String** | The unique identifier of the invoice in the Tax Service Adapter or the Tax Service Provider. |  [optional] |
|**creditNoteType** | **CreditNoteType** |  |  |
|**documentDateTime** | **OffsetDateTime** | The date and time at which the credit note was created in Chargebee. For example, if the value is 2022-10-28T15:36:28.129+05:30, then the timestamp represents October 28, 2022, at 15:36:28.129, with an offset of +05:30. This means that the time represented is 5 hours and 30 minutes ahead of UTC/GMT. In the case of a merchant site located in UTC, these data types would send a timestamp in the format 2022-11-11T15:40:44.65Z. This timestamp represents November 11, 2022, at 15:40:44.65, with the &#39;Z&#39; indicating that the time is in UTC. |  |
|**taxDateTime** | **OffsetDateTime** | The date and time at which the tax was applicable in Chargebee. For example, if the value is 2022-10-28T15:36:28.129+05:30, then the timestamp represents October 28, 2022, at 15:36:28.129, with an offset of +05:30. This means that the time represented is 5 hours and 30 minutes ahead of UTC/GMT.In the case of a merchant site located in UTC, these data types would send a timestamp in the format 2022-11-11T15:40:44.65Z. This timestamp represents November 11, 2022, at 15:40:44.65, with the &#39;Z&#39; indicating that the time is in UTC. |  [optional] |
|**currency** | **String** | The [currency](https://en.wikipedia.org/wiki/Currency) in the [ISO-4217 format](https://www.iso.org/iso-4217-currency-codes.html). |  |
|**seller** | [**Seller**](Seller.md) |  |  |
|**customer** | [**Customer**](Customer.md) |  |  |
|**total** | **Double** | The total amount of the credit note. &#x60;total&#x60; can be expressed as &#x60;exemptAmount&#x60; + &#x60;taxableAmount&#x60; + &#x60;taxAmount&#x60;. |  |
|**exemptAmount** | **Double** | The amount exempted from tax. |  |
|**discountAmount** | **Double** | The total discount applied. This is the sum of all &#x60;lineItems.discount&#x60;. |  |
|**taxableAmount** | **Double** | The amount upon which the tax is calculated. |  |
|**taxAmount** | **Double** | The total tax payable. This is the sum of all &#x60;lineItems.taxAmount&#x60;. |  |
|**roundingAmount** | **Double** | The rounding amount added to the total amount to account for fractional correction. |  [optional] |
|**lineItems** | [**List&lt;InvoiceLineItem&gt;**](InvoiceLineItem.md) |  |  [optional] |



