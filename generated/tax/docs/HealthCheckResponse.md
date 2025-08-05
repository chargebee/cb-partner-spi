

# HealthCheckResponse


## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**version** | **String** |  |  [optional] |
|**description** | **String** | The description of the health status returned by the Service Adapter. |  [optional] |
|**status** | **HealthStatus** |  |  |
|**components** | [**List&lt;HealthCheckComponent&gt;**](HealthCheckComponent.md) | List of health status details for each component reported by the Service Adapter. |  |
|**time** | **OffsetDateTime** | The timestamp of the health status reported by the Service Adapter. |  |



