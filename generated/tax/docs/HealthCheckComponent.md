

# HealthCheckComponent

The health status details of a specific component reported by the Service Adapter.

## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**id** | **String** | The id of the component. |  |
|**name** | **String** | The name of the component. |  |
|**type** | [**TypeEnum**](#TypeEnum) | The type of component affected when &#x60;status&#x60; is &#x60;WARN&#x60; or &#x60;DOWN&#x60;. The possible values are: - &#x60;ADAPTER&#x60;: The reported status is for the Service Adapter. - &#x60;API&#x60;: The reported status is for the Service Provider. - &#x60;DATABASE&#x60;: The reported status is for a database dependency of the Service Provider. - &#x60;SYSTEM&#x60;: The reported status is for any other known system component such as cache or gateway. - &#x60;OTHER&#x60;: The reported status is either for a component that does not belong to the types described above or the source of the issue is unknown.  |  |
|**description** | **String** | The detailed status of the component. |  [optional] |
|**status** | **HealthStatus** |  |  |
|**endpoints** | **List&lt;String&gt;** | When the &#x60;status&#x60; of the component is not &#x60;UP&#x60;, then the list of endpoints affected. |  [optional] |



## Enum: TypeEnum

| Name | Value |
|---- | -----|
| OTHER | &quot;OTHER&quot; |
| SYSTEM | &quot;SYSTEM&quot; |
| API | &quot;API&quot; |
| ADAPTER | &quot;ADAPTER&quot; |
| DATABASE | &quot;DATABASE&quot; |



