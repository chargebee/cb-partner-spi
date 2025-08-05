

# TaxLineItem

The details of tax applied under a specific jurisdiction.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**number** | **Integer** | Index or serial number of this tax line item. |  |
|**jurisdiction** | [**TaxJurisdiction**](TaxJurisdiction.md) |  |  |
|**name** | **String** | The name of the tax applied. |  |
|**rate** | **Double** | The tax rate expressed in percentage. |  |
|**taxableAmount** | **Double** | The part of the line item&#39;s &#x60;subtotal&#x60; that is taxable under this jurisdiction. |  |
|**taxAmount** | **Double** | The tax payable for the line item under this jurisdiction. |  |



