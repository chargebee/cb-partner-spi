## Steps to follow release(Chargebee owned)
1. Assume release is 0.0.9. (find release from git page release section)
2. Update the `build_version` in gradle.properties to 0.0.9. 
3. Build the jar by following the steps [here](./add-update-spi.md).
4. Publish the jar by running the below command:
   ```bash
   ./gradlew publish
   ```