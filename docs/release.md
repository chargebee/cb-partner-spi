## Steps to follow release (Chargebee owned)

### Partner artifact (Java 17 → Maven Central)

1. Assume release is `0.0.14` (find release from the GitHub releases section).
2. Update `build_version` in [`gradle.properties`](../gradle.properties).
3. Build the jar (default Java 17) by following [add-update-spi.md](./add-update-spi.md).
4. Publish to Maven Central:
   ```bash
   ./gradlew publish
   ```

### Core / chargebee-app artifact (Java 8 → CodeArtifact)

Prefer the GitHub Action [`.github/workflows/publish-java8.yml`](../.github/workflows/publish-java8.yml):

| Trigger | CodeArtifact target |
|---|---|
| Merge to `dev` | `cb-private-dev` / `cb-build-dev` |
| Tag `release/<version>` or `workflow_dispatch` | `cb-private-prod` / `cb-build-prod` |

Manual local publish (requires CodeArtifact credentials):

```bash
export CODEARTIFACT_USER=aws
export CODEARTIFACT_AUTH_TOKEN=...   # from aws codeartifact get-authorization-token

./gradlew validateSpec generateSpec build publish \
  -Pjava8=true \
  -Penv=ci \
  -Pbuild_version=0.0.14 \
  -Partifactory_build_url=https://cb-artifactory-606027973764.d.codeartifact.us-east-1.amazonaws.com/maven/cb-build-prod/ \
  -Partifactory_publish_url=https://cb-artifactory-606027973764.d.codeartifact.us-east-1.amazonaws.com/maven/cb-private-prod/ \
  -x test
```

Artifact coordinates for chargebee-app:

```text
com.chargebee:cb-partner-spi-java8:<version>
```

After a prod publish, bump that version in chargebee-app `build.gradle` + `gradle/dependency-locks/depLib.lockfile` (or let the workflow open the PR when `CB_APP_BUMP_PAT` is configured).
