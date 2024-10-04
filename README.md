## Chargebee's Open API Spec
Service Provider Interfaces for Chargebee's capabilities
- [Open api tax_spec](spec/spi/openapi_tax.yml)
- [Open api trn_validation_spec](spec/spi/openapi_trn.yml)
- To view open api spec visit https://editor.swagger.io/ and place generated yaml content

## Add new open api spec
- Add **openapi.yml** file under `spec/spi/` folder, like spec/spi/**abc**
- Add config details in [spec.config](spec.config) file
- Command to validate open api spec `sh gradlew validateSpec_abc --warning-mode all --stacktrace`
- Command to generate open api spec `sh gradlew generateSpec_abc --warning-mode all --stacktrace`
- Java models, clients and doc will be generated under `generated/abc` folder
- 

## Commands
- Validate the open api spec `sh gradlew validateSpec --warning-mode all --stacktrace`
- Generate models, api client, docs etc `sh gradlew generateSpec --warning-mode all --stacktrace`
    - New folder `generated` will be created which will have all models, clients, docs etc
- Build `sh gradlew build` spi jar will be generated to ./build/libs/cb-provider-spi.jar
- Publish jar to local maven repo `sh gradlew build publishToMavenLocal`

## Working on Service Adapter SPI for first time

Follow the below steps for generating jar

Clone repository in local
```shell
  git clone git@github.com:chargebee/cb-provider-spi.git
```

Validate open api specs using below command
```shell
sh gradlew validateSpec  --warning-mode all --stacktrace
```

Validate specific open api spec using below command
```shell
 sh gradlew validateSpec_tax  --warning-mode all --stacktrace
```

Generate models of all open api specs using below command
```shell
sh gradlew generateSpec  --warning-mode all --stacktrace
```

Generate models specific open api spec using below command
```shell
sh gradlew generateSpec_tax  --warning-mode all --stacktrace
```

When models are generated successfully, generate jar using below command
```shell
sh gradlew clean build
```
If no build issue, and if jar is successfully created, go to **./build/libs/cb-provider-spi.jar**


## Getting Started

Please follow the installation instruction of generated readme to generate the jar of this project. Currently, this jar is used as a dependency in chargebee-app too to use APIs as well as models.

Add dependency
```maven
<dependency>
    <groupId>org.chargebee.spi</groupId>
    <artifactId>cb-provider-spi</artifactId>
    <version>${version}</version>
</dependency>
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
Tax provider capabilities for new tax providers will be validated against a constantly updating JSON Schema, to validate the correctness and completeness of configurations. JSON Schema can be referenced below.
- [TaxProviderCapabilities JSONSchema](spec/capabilities/tax-provider.schema.json)

## Steps to follow release


1. Assume release is 0.0.9. (find release from git page release section)
2. create a new branch called release/<release> so this would be release/0.0.9
3. create new branch for ticket feat/<ticket-number>
4. commit to  feat/<ticket-number>
5. Raise PR from feat/<ticket-number> to release/0.0.9
6. After PR is approved and merged
7. Raise PR from release/0.0.9 to dev. Once PR is merged it will auto release the 0.0.9 version of SPI for dev code base
8. After that raise PR from release/0.0.9 to main. Once PR is merged it will auto release the 0.0.9 version of SPI for prod codebase


## Steps to generate a spring boot project for given spec using gradle

1. Clone repository in local
```shell
  git clone git@github.com:chargebee/cb-provider-spi.git
```

2. Navigate to the repository
```shell
  cd cb-provider-spi
```

3. Add meta-generator.gradle file
```groovy

buildscript {
  repositories {
    mavenCentral()
  }
  dependencies {
    classpath 'org.yaml:snakeyaml:1.30'
  }
}

import org.yaml.snakeyaml.Yaml

def configFile = file('generator.config')
def config = new Yaml().load(configFile.text)

// Define command-line options
def cliOptions = [
        'springBootVersion',
        'springDependencyManagementVersion',
        'openApiGeneratorVersion',
        'javaVersion',
        'groupId',
        'version',
        'basePackage',
        'outputDir'
]

// Override config with command-line arguments if provided
cliOptions.each { option ->
  if (project.hasProperty(option)) {
    config[option] = project.property(option)
  }
}

def outputDir = file(config.outputDir ?: '../generated-project')

task generateGradleProject {
  doLast {
    // Create build.gradle
    def buildGradleFile = new File(outputDir, 'build.gradle')
    buildGradleFile.text = """
plugins {
    id 'org.springframework.boot' version '${config.springBootVersion}'
    id 'io.spring.dependency-management' version '${config.springDependencyManagementVersion}'
    id 'java'
    id 'org.openapi.generator' version '${config.openApiGeneratorVersion}'
}

group = '${config.groupId}'
version = '${config.version}'
sourceCompatibility = '${config.javaVersion}'

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

def specDir = '${projectDir}/../cb-provider-spi/spec/spi'
def specs = ${config.specs.inspect()}

specs.each { spec ->
    def taskName = "openApiGenerate_\${spec.replace('.yml', '')}"
    tasks.register(taskName, org.openapitools.generator.gradle.plugin.tasks.GenerateTask) {
        generatorName = 'spring'
        inputSpec = "\$specDir/\$spec"
        outputDir = "\$projectDir/build/generated-\${spec.replace('.yml', '')}"
        apiPackage = "${config.basePackage}.api.\${spec.replace('.yml', '').replace('_', '')}"
        modelPackage = "${config.basePackage}.model.\${spec.replace('.yml', '').replace('_', '')}"
        configOptions = [
            dateLibrary: 'java8',
            interfaceOnly: 'true',
            useSpringBoot3: 'true'
        ]
    }
}

tasks.named('openApiGenerate').configure {
    enabled = false
}

tasks.register('openApiGenerateAll') {
    dependsOn tasks.withType(org.openapitools.generator.gradle.plugin.tasks.GenerateTask)
    .matching { it.name != 'openApiGenerate' }
}

sourceSets {
    main {
        java {
            srcDir "src/main/java"
            ${config.specs.collect { spec ->
      "srcDir \"\$projectDir/build/generated-${spec.replace('.yml', '')}/src/main/java\""
    }.join('\n            ')}
        }
    }
}

compileJava.dependsOn tasks.openApiGenerateAll
"""

    // Create settings.gradle
    def settingsGradleFile = new File(outputDir, 'settings.gradle')
    settingsGradleFile.text = """
rootProject.name = '${config.groupId.tokenize('.').last()}'
"""

    // Create gradle.properties
    def gradlePropertiesFile = new File(outputDir, 'gradle.properties')
    gradlePropertiesFile.text = """
org.gradle.parallel=true
org.gradle.caching=true
"""

    // Create main application class
    def mainClassDir = new File(outputDir, "src/main/java/${config.basePackage.replace('.', '/')}")
    mainClassDir.mkdirs()
    def mainClassFile = new File(mainClassDir, "Application.java")
    mainClassFile.text = """
package ${config.basePackage};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
"""

    // Create src directory structure
    new File(outputDir, 'src/main/resources').mkdirs()
    new File(outputDir, 'src/test/java').mkdirs()
    new File(outputDir, 'src/test/resources').mkdirs()

    println "Generated Gradle project structure at ${outputDir.absolutePath}"
  }
}

```

4. Add generator.config file

```yaml
outputDir: ../generated-project
springBootVersion: 2.7.0
springDependencyManagementVersion: 1.0.11.RELEASE
openApiGeneratorVersion: 7.0.1
javaVersion: 11
groupId: com.example
version: 0.0.1-SNAPSHOT
basePackage: com.example.generated
specs:
  - openapi_location_validation.yml
  - openapi_tax.yml
  - openapi_trn.yml

```

5. To generate the complete Gradle project structure with default values from generator.config, run:
```shell
  gradle -b meta-generator.gradle generateGradleProject
```

6. To override versions or other properties, you can pass them as command-line arguments. For example:
```shell
  gradle -b meta-generator.gradle generateGradleProject \
  -PspringBootVersion=2.7.1 \
  -PopenApiGeneratorVersion=7.0.1 \
  -PjavaVersion=11 \
  -PgroupId=com.mycompany \
  -Pversion=1.0.0-SNAPSHOT \
  -PbasePackage=com.mycompany.api \
  -PoutputDir=../my-custom-project
```

7. After generating the Gradle project, you can navigate to the output directory and run:
```shell
  cd ../generated-project
  gradle openApiGenerateAll
```
