

# TaxEstimationLineItemRequest

Represents the details of a line item in a tax estimation request.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**number** | **Integer** | Index or serial number of the line item. |  |
|**itemCode** | **String** | The unique identifier (in Chargebee) of the product corresponding to the line item. If the line item corresponds to a one-off charge, then this identifier is not provided. If entity_type is &#x60;adhoc&#x60;, the &#x60;itemCode&#x60; parameter will be set to &#x60;adhoc_charge&#x60;. |  [optional] |
|**description** | **String** | The description of the line item. |  [optional] |
|**quantity** | **Double** | The quantity associated with this line item. |  [optional] |
|**unitPrice** | **Double** | The unit price for this line item. In case of [tiered pricing](https://www.chargebee.com/docs/1.0/plans.html#tiered-pricing) where the unit price varies for each quantity tier, this is the average unit price. |  [optional] |
|**amount** | **Double** | The amount for this line item. This is &#x60;unitPrice&#x60; × &#x60;quantity&#x60;. |  |
|**discountAmount** | **Double** | The discount applied to this line item. |  [optional] |
|**isTaxInclusive** | **Boolean** | Indicates whether (&#x60;amount&#x60; - &#x60;discountAmount&#x60;)  is inclusive of taxes. |  |
|**taxIdentifiers** | [**List&lt;FieldItem&gt;**](FieldItem.md) | The tax code fields of the product used for tax calculation. |  [optional] |



