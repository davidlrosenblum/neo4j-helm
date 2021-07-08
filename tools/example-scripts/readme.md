# Neo4j-Helm Example Scripts

This directory has sample scripts that are based on the External Exposure chapter in the docs

[Full Documentation can be found here](https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/)

## Quick Start

Check the [releases page](https://github.com/neo4j-contrib/neo4j-helm/releases) and copy the URL of the tgz package.   Make sure to note the correct version of Neo4j.

### Standalone (single server)

```bash
$ helm install mygraph RELEASE_URL --set core.standalone=true --set acceptLicenseAgreement=yes --set neo4jPassword=mySecretPassword
```
