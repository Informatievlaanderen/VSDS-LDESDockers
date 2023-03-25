FLOWFILE STRUCTURE

flowContents
  identifier
  instanceIdentifier
  name
  comments
  position
    x
    y
  processGroups -
  remoteProcessGroups -
  processors [

  ]
  connections [

  ]
  labels
  funnels
  controllerServices
  variables
  defaultFlowFileExpiration: "0 sec",
  defaultBackPressureObjectThreshold: 10000,
  defaultBackPressureDataSizeThreshold: "1 GB",
  componentType: "PROCESS_GROUP",
  flowFileConcurrency: "UNBOUNDED",
  flowFileOutboundPolicy: "STREAM_WHEN_AVAILABLE"

PROCESSOR STRUCTURE

identifier
instanceIdentifier
name
comments
position
  x
  y
type (e.g. org.apache.nifi.processors.standard.InvokeHTTP)
bundle
  group (e.g. org.apache.nifi)
  artifact (e.g. nifi-standard.nar)
  version (e.g. 1.17.0)
  properties
    <processor/case dependent>
  propertyDescriptors
    <processor/case dependent>
