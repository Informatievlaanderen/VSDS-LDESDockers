
## DEMO'S

### ldes-client-persistence

(File)[e2e-test/demos/ldes-client-persistence/flows/nifi-workflow.json]

Processors in use:

org.apache.nifi.processors.standard.InvokeHTTP
be.vlaanderen.informatievlaanderen.ldes.processors.LdesClient

### rdf4j-repository-materialisation

(File)[e2e-test/demos/rdf4j-repository-materialisation/nifi-workflow.json]

Processor in use:

org.apache.nifi.processors.standard.InvokeHTTP
be.vlaanderen.informatievlaanderen.ldes.processors.LdesClient


## USE CASES

### gipod

#### 1.replicate-ldes

(File)[e2e-test/use-cases/gipod/1.replicate-ldes/nifi-workflow.json]

Processors in use:

org.apache.nifi.processors.standard.InvokeHTTP
be.vlaanderen.informatievlaanderen.ldes.processors.LdesClient

#### 2.ingest-ldes

(File)[e2e-test/use-cases/gipod/2.ingest-ldes/nifi-workflow.json]

Processors in use:

org.apache.nifi.processors.standard.InvokeHTTP
be.vlaanderen.informatievlaanderen.ldes.processors.LdesClient

#### 3.synchronize-ldes

(File)[e2e-test/use-cases/gipod/3.]


