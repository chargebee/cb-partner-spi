

# InvoiceLineItem

The details of a line item.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**number** | **Integer** | Index or serial number of the line item. |  |
|**itemCode** | **String** | The unique identifier (in Chargebee) of the product corresponding to the line item. If the line item corresponds to a one-off charge, then this identifier is not present. If entity_type is &#x60;adhoc&#x60;, the &#x60;itemCode&#x60; parameter will be set to &#x60;adhoc_charge&#x60;. |  [optional] |
|**description** | **String** | The description of the line item. |  [optional] |
|**quantity** | **Double** | The quantity associated with this line item. |  [optional] |
|**unitPrice** | **Double** | The unit price for this line item. In case of [tiered pricing](https://www.chargebee.com/docs/1.0/plans.html#tiered-pricing) where the unit price varies for each quantity tier, this is the average unit price. |  [optional] |
|**amount** | **Double** | The amount for this line item. This is &#x60;unitPrice&#x60; × &#x60;quantity&#x60;. |  |
|**subtotal** | **Double** | The amount after discounts for this line item. This is &#x60;amount&#x60; - &#x60;discountAmount&#x60;. |  |
|**isTaxInclusive** | **Boolean** | Indicates whether the &#x60;subtotal&#x60; for this line item is inclusive of taxes. |  |
|**isTaxable** | **Boolean** | Indicates whether this line item is taxable. |  |
|**taxIdentifiers** | [**List&lt;FieldItem&gt;**](FieldItem.md) | The tax code fields of the product used for tax calculation. |  [optional] |
|**taxExemptType** | **TaxExemptType** |  |  [optional] |
|**taxExemptReason** | **String** | The reason due to which a line item is exempted from tax. This is a mandatory parameter while applying tax exemption on any line-item. |  [optional] |
|**exemptAmount** | **Double** | The part of this line item&#39;s &#x60;subtotal&#x60; that is exempted from tax. |  |
|**discountAmount** | **Double** | The discount applied to this line item. |  |
|**taxableAmount** | **Double** | The part of this line item&#39;s &#x60;subtotal&#x60; that is taxable. |  |
|**taxAmount** | **Double** | The tax payable for this line item. This is the sum of all &#x60;taxes.taxAmount&#x60; for this line item. |  |
|**total** | **Double** | The total for this line item after discounts and taxes. This is the same as &#x60;subtotal&#x60; if it is tax inclusive; otherwise it is &#x60;subtotal&#x60; + &#x60;taxAmount&#x60;. &#x60;total&#x60; can also be expressed as &#x60;exemptAmount&#x60; + &#x60;taxableAmount&#x60; + &#x60;taxAmount&#x60;. |  |
|**isPartialTax** | **Boolean** | Indicates if taxes were applied only partially for this line item. |  [optional] |
|**taxes** | [**List&lt;TaxLineItem&gt;**](TaxLineItem.md) | List of taxes applied for this line item under each jurisdiction. |  |



