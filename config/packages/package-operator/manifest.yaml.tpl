apiVersion: manifests.package-operator.run/v1alpha1
kind: PackageManifest
metadata:
  creationTimestamp: null
  name: package-operator
spec:
  availabilityProbes:
  - probes:
    - condition:
        status: "True"
        type: Available
    - fieldsEqual:
        fieldA: .status.updatedReplicas
        fieldB: .status.replicas
    selector:
      kind:
        group: apps
        kind: Deployment
  - probes:
    - condition:
        status: "True"
        type: Established
    selector:
      kind:
        group: apiextensions.k8s.io
        kind: CustomResourceDefinition
  components: {}
  config:
    openAPIV3Schema:
      properties:
        packageHashModifier:
          description: A value that is used when creating the package hash.
            This parameter can be used to force the redeployment of all packages by
            modifying their calculated hash value.
          type: integer
          format: int32
        registryHostOverrides:
          type: string
        imagePrefixOverrides:
          type: string
        objectTemplateResourceRetryInterval:
          type: string
        logLevel:
          description: Log level. Default is -1 (warn). Higher numbers increase verbosity (e.g., 0 = info, 1 = debug)
          type: integer
        objectTemplateOptionalResourceRetryInterval:
          type: string
        namespace:
          description: Namespace to install package operator into.
          type: string
          default: package-operator-system
        affinity:
          description: Affinity is a group of affinity scheduling rules.
          properties:
            nodeAffinity:
              description: Describes node affinity scheduling rules for the pod.
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node matches
                    the corresponding matchExpressions; the node(s) with the highest
                    sum are the most preferred.
                  items:
                    description: An empty preferred scheduling term matches all objects
                      with implicit weight 0 (i.e. it's a no-op). A null preferred
                      scheduling term matches no objects (i.e. is also a no-op).
                    properties:
                      preference:
                        description: A node selector term, associated with the corresponding
                          weight.
                        properties:
                          matchExpressions:
                            description: A list of node selector requirements by node's
                              labels.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchFields:
                            description: A list of node selector requirements by node's
                              fields.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                        type: object
                        x-kubernetes-map-type: atomic
                      weight:
                        description: Weight associated with matching the corresponding
                          nodeSelectorTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - preference
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the affinity requirements specified by this field
                    are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the affinity requirements specified by this
                    field cease to be met at some point during pod execution (e.g.
                    due to an update), the system may or may not try to eventually
                    evict the pod from its node.
                  properties:
                    nodeSelectorTerms:
                      description: Required. A list of node selector terms. The terms
                        are ORed.
                      items:
                        description: A null or empty node selector term matches no
                          objects. The requirements of them are ANDed. The TopologySelectorTerm
                          type implements a subset of the NodeSelectorTerm.
                        properties:
                          matchExpressions:
                            description: A list of node selector requirements by node's
                              labels.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchFields:
                            description: A list of node selector requirements by node's
                              fields.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                        type: object
                        x-kubernetes-map-type: atomic
                      type: array
                  required:
                  - nodeSelectorTerms
                  type: object
                  x-kubernetes-map-type: atomic
              type: object
            podAffinity:
              description: Describes pod affinity scheduling rules (e.g. co-locate
                this pod in the same node, zone, etc. as some other pod(s)).
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node has pods
                    which matches the corresponding podAffinityTerm; the node(s) with
                    the highest sum are the most preferred.
                  items:
                    description: The weights of all of the matched WeightedPodAffinityTerm
                      fields are added per-node to find the most preferred node(s)
                    properties:
                      podAffinityTerm:
                        description: Required. A pod affinity term, associated with
                          the corresponding weight.
                        properties:
                          labelSelector:
                            description: A label query over a set of resources, in
                              this case pods.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaceSelector:
                            description: A label query over the set of namespaces
                              that the term applies to. The term is applied to the
                              union of the namespaces selected by this field and the
                              ones listed in the namespaces field. null selector and
                              null or empty namespaces list means "this pod's namespace".
                              An empty selector ({}) matches all namespaces.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaces:
                            description: namespaces specifies a static list of namespace
                              names that the term applies to. The term is applied
                              to the union of the namespaces listed in this field
                              and the ones selected by namespaceSelector. null or
                              empty namespaces list and null namespaceSelector means
                              "this pod's namespace".
                            items:
                              type: string
                            type: array
                          topologyKey:
                            description: This pod should be co-located (affinity)
                              or not co-located (anti-affinity) with the pods matching
                              the labelSelector in the specified namespaces, where
                              co-located is defined as running on a node whose value
                              of the label with key topologyKey matches that of any
                              node on which any of the selected pods is running. Empty
                              topologyKey is not allowed.
                            type: string
                        required:
                        - topologyKey
                        type: object
                      weight:
                        description: weight associated with matching the corresponding
                          podAffinityTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - podAffinityTerm
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the affinity requirements specified by this field
                    are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the affinity requirements specified by this
                    field cease to be met at some point during pod execution (e.g.
                    due to a pod label update), the system may or may not try to eventually
                    evict the pod from its node. When there are multiple elements,
                    the lists of nodes corresponding to each podAffinityTerm are intersected,
                    i.e. all terms must be satisfied.
                  items:
                    description: Defines a set of pods (namely those matching the
                      labelSelector relative to the given namespace(s)) that this
                      pod should be co-located (affinity) or not co-located (anti-affinity)
                      with, where co-located is defined as running on a node whose
                      value of the label with key <topologyKey> matches that of any
                      node on which a pod of the set of pods is running
                    properties:
                      labelSelector:
                        description: A label query over a set of resources, in this
                          case pods.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaceSelector:
                        description: A label query over the set of namespaces that
                          the term applies to. The term is applied to the union of
                          the namespaces selected by this field and the ones listed
                          in the namespaces field. null selector and null or empty
                          namespaces list means "this pod's namespace". An empty selector
                          ({}) matches all namespaces.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaces:
                        description: namespaces specifies a static list of namespace
                          names that the term applies to. The term is applied to the
                          union of the namespaces listed in this field and the ones
                          selected by namespaceSelector. null or empty namespaces
                          list and null namespaceSelector means "this pod's namespace".
                        items:
                          type: string
                        type: array
                      topologyKey:
                        description: This pod should be co-located (affinity) or not
                          co-located (anti-affinity) with the pods matching the labelSelector
                          in the specified namespaces, where co-located is defined
                          as running on a node whose value of the label with key topologyKey
                          matches that of any node on which any of the selected pods
                          is running. Empty topologyKey is not allowed.
                        type: string
                    required:
                    - topologyKey
                    type: object
                  type: array
              type: object
            podAntiAffinity:
              description: Describes pod anti-affinity scheduling rules (e.g. avoid
                putting this pod in the same node, zone, etc. as some other pod(s)).
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the anti-affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling anti-affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node has pods
                    which matches the corresponding podAffinityTerm; the node(s) with
                    the highest sum are the most preferred.
                  items:
                    description: The weights of all of the matched WeightedPodAffinityTerm
                      fields are added per-node to find the most preferred node(s)
                    properties:
                      podAffinityTerm:
                        description: Required. A pod affinity term, associated with
                          the corresponding weight.
                        properties:
                          labelSelector:
                            description: A label query over a set of resources, in
                              this case pods.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaceSelector:
                            description: A label query over the set of namespaces
                              that the term applies to. The term is applied to the
                              union of the namespaces selected by this field and the
                              ones listed in the namespaces field. null selector and
                              null or empty namespaces list means "this pod's namespace".
                              An empty selector ({}) matches all namespaces.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaces:
                            description: namespaces specifies a static list of namespace
                              names that the term applies to. The term is applied
                              to the union of the namespaces listed in this field
                              and the ones selected by namespaceSelector. null or
                              empty namespaces list and null namespaceSelector means
                              "this pod's namespace".
                            items:
                              type: string
                            type: array
                          topologyKey:
                            description: This pod should be co-located (affinity)
                              or not co-located (anti-affinity) with the pods matching
                              the labelSelector in the specified namespaces, where
                              co-located is defined as running on a node whose value
                              of the label with key topologyKey matches that of any
                              node on which any of the selected pods is running. Empty
                              topologyKey is not allowed.
                            type: string
                        required:
                        - topologyKey
                        type: object
                      weight:
                        description: weight associated with matching the corresponding
                          podAffinityTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - podAffinityTerm
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the anti-affinity requirements specified by this
                    field are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the anti-affinity requirements specified by
                    this field cease to be met at some point during pod execution
                    (e.g. due to a pod label update), the system may or may not try
                    to eventually evict the pod from its node. When there are multiple
                    elements, the lists of nodes corresponding to each podAffinityTerm
                    are intersected, i.e. all terms must be satisfied.
                  items:
                    description: Defines a set of pods (namely those matching the
                      labelSelector relative to the given namespace(s)) that this
                      pod should be co-located (affinity) or not co-located (anti-affinity)
                      with, where co-located is defined as running on a node whose
                      value of the label with key <topologyKey> matches that of any
                      node on which a pod of the set of pods is running
                    properties:
                      labelSelector:
                        description: A label query over a set of resources, in this
                          case pods.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaceSelector:
                        description: A label query over the set of namespaces that
                          the term applies to. The term is applied to the union of
                          the namespaces selected by this field and the ones listed
                          in the namespaces field. null selector and null or empty
                          namespaces list means "this pod's namespace". An empty selector
                          ({}) matches all namespaces.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaces:
                        description: namespaces specifies a static list of namespace
                          names that the term applies to. The term is applied to the
                          union of the namespaces listed in this field and the ones
                          selected by namespaceSelector. null or empty namespaces
                          list and null namespaceSelector means "this pod's namespace".
                        items:
                          type: string
                        type: array
                      topologyKey:
                        description: This pod should be co-located (affinity) or not
                          co-located (anti-affinity) with the pods matching the labelSelector
                          in the specified namespaces, where co-located is defined
                          as running on a node whose value of the label with key topologyKey
                          matches that of any node on which any of the selected pods
                          is running. Empty topologyKey is not allowed.
                        type: string
                    required:
                    - topologyKey
                    type: object
                  type: array
              type: object
          type: object
        subcomponentAffinity:
          description: SubcomponentAffinity is a group of affinity scheduling rules for the sub components of the package.
          properties:
            nodeAffinity:
              description: Describes node affinity scheduling rules for the pod.
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node matches
                    the corresponding matchExpressions; the node(s) with the highest
                    sum are the most preferred.
                  items:
                    description: An empty preferred scheduling term matches all objects
                      with implicit weight 0 (i.e. it's a no-op). A null preferred
                      scheduling term matches no objects (i.e. is also a no-op).
                    properties:
                      preference:
                        description: A node selector term, associated with the corresponding
                          weight.
                        properties:
                          matchExpressions:
                            description: A list of node selector requirements by node's
                              labels.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchFields:
                            description: A list of node selector requirements by node's
                              fields.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                        type: object
                        x-kubernetes-map-type: atomic
                      weight:
                        description: Weight associated with matching the corresponding
                          nodeSelectorTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - preference
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the affinity requirements specified by this field
                    are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the affinity requirements specified by this
                    field cease to be met at some point during pod execution (e.g.
                    due to an update), the system may or may not try to eventually
                    evict the pod from its node.
                  properties:
                    nodeSelectorTerms:
                      description: Required. A list of node selector terms. The terms
                        are ORed.
                      items:
                        description: A null or empty node selector term matches no
                          objects. The requirements of them are ANDed. The TopologySelectorTerm
                          type implements a subset of the NodeSelectorTerm.
                        properties:
                          matchExpressions:
                            description: A list of node selector requirements by node's
                              labels.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchFields:
                            description: A list of node selector requirements by node's
                              fields.
                            items:
                              description: A node selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: The label key that the selector applies
                                    to.
                                  type: string
                                operator:
                                  description: Represents a key's relationship to
                                    a set of values. Valid operators are In, NotIn,
                                    Exists, DoesNotExist. Gt, and Lt.
                                  type: string
                                values:
                                  description: An array of string values. If the operator
                                    is In or NotIn, the values array must be non-empty.
                                    If the operator is Exists or DoesNotExist, the
                                    values array must be empty. If the operator is
                                    Gt or Lt, the values array must have a single
                                    element, which will be interpreted as an integer.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                        type: object
                        x-kubernetes-map-type: atomic
                      type: array
                  required:
                  - nodeSelectorTerms
                  type: object
                  x-kubernetes-map-type: atomic
              type: object
            podAffinity:
              description: Describes pod affinity scheduling rules (e.g. co-locate
                this pod in the same node, zone, etc. as some other pod(s)).
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node has pods
                    which matches the corresponding podAffinityTerm; the node(s) with
                    the highest sum are the most preferred.
                  items:
                    description: The weights of all of the matched WeightedPodAffinityTerm
                      fields are added per-node to find the most preferred node(s)
                    properties:
                      podAffinityTerm:
                        description: Required. A pod affinity term, associated with
                          the corresponding weight.
                        properties:
                          labelSelector:
                            description: A label query over a set of resources, in
                              this case pods.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaceSelector:
                            description: A label query over the set of namespaces
                              that the term applies to. The term is applied to the
                              union of the namespaces selected by this field and the
                              ones listed in the namespaces field. null selector and
                              null or empty namespaces list means "this pod's namespace".
                              An empty selector ({}) matches all namespaces.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaces:
                            description: namespaces specifies a static list of namespace
                              names that the term applies to. The term is applied
                              to the union of the namespaces listed in this field
                              and the ones selected by namespaceSelector. null or
                              empty namespaces list and null namespaceSelector means
                              "this pod's namespace".
                            items:
                              type: string
                            type: array
                          topologyKey:
                            description: This pod should be co-located (affinity)
                              or not co-located (anti-affinity) with the pods matching
                              the labelSelector in the specified namespaces, where
                              co-located is defined as running on a node whose value
                              of the label with key topologyKey matches that of any
                              node on which any of the selected pods is running. Empty
                              topologyKey is not allowed.
                            type: string
                        required:
                        - topologyKey
                        type: object
                      weight:
                        description: weight associated with matching the corresponding
                          podAffinityTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - podAffinityTerm
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the affinity requirements specified by this field
                    are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the affinity requirements specified by this
                    field cease to be met at some point during pod execution (e.g.
                    due to a pod label update), the system may or may not try to eventually
                    evict the pod from its node. When there are multiple elements,
                    the lists of nodes corresponding to each podAffinityTerm are intersected,
                    i.e. all terms must be satisfied.
                  items:
                    description: Defines a set of pods (namely those matching the
                      labelSelector relative to the given namespace(s)) that this
                      pod should be co-located (affinity) or not co-located (anti-affinity)
                      with, where co-located is defined as running on a node whose
                      value of the label with key <topologyKey> matches that of any
                      node on which a pod of the set of pods is running
                    properties:
                      labelSelector:
                        description: A label query over a set of resources, in this
                          case pods.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaceSelector:
                        description: A label query over the set of namespaces that
                          the term applies to. The term is applied to the union of
                          the namespaces selected by this field and the ones listed
                          in the namespaces field. null selector and null or empty
                          namespaces list means "this pod's namespace". An empty selector
                          ({}) matches all namespaces.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaces:
                        description: namespaces specifies a static list of namespace
                          names that the term applies to. The term is applied to the
                          union of the namespaces listed in this field and the ones
                          selected by namespaceSelector. null or empty namespaces
                          list and null namespaceSelector means "this pod's namespace".
                        items:
                          type: string
                        type: array
                      topologyKey:
                        description: This pod should be co-located (affinity) or not
                          co-located (anti-affinity) with the pods matching the labelSelector
                          in the specified namespaces, where co-located is defined
                          as running on a node whose value of the label with key topologyKey
                          matches that of any node on which any of the selected pods
                          is running. Empty topologyKey is not allowed.
                        type: string
                    required:
                    - topologyKey
                    type: object
                  type: array
              type: object
            podAntiAffinity:
              description: Describes pod anti-affinity scheduling rules (e.g. avoid
                putting this pod in the same node, zone, etc. as some other pod(s)).
              properties:
                preferredDuringSchedulingIgnoredDuringExecution:
                  description: The scheduler will prefer to schedule pods to nodes
                    that satisfy the anti-affinity expressions specified by this field,
                    but it may choose a node that violates one or more of the expressions.
                    The node that is most preferred is the one with the greatest sum
                    of weights, i.e. for each node that meets all of the scheduling
                    requirements (resource request, requiredDuringScheduling anti-affinity
                    expressions, etc.), compute a sum by iterating through the elements
                    of this field and adding "weight" to the sum if the node has pods
                    which matches the corresponding podAffinityTerm; the node(s) with
                    the highest sum are the most preferred.
                  items:
                    description: The weights of all of the matched WeightedPodAffinityTerm
                      fields are added per-node to find the most preferred node(s)
                    properties:
                      podAffinityTerm:
                        description: Required. A pod affinity term, associated with
                          the corresponding weight.
                        properties:
                          labelSelector:
                            description: A label query over a set of resources, in
                              this case pods.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaceSelector:
                            description: A label query over the set of namespaces
                              that the term applies to. The term is applied to the
                              union of the namespaces selected by this field and the
                              ones listed in the namespaces field. null selector and
                              null or empty namespaces list means "this pod's namespace".
                              An empty selector ({}) matches all namespaces.
                            properties:
                              matchExpressions:
                                description: matchExpressions is a list of label selector
                                  requirements. The requirements are ANDed.
                                items:
                                  description: A label selector requirement is a selector
                                    that contains values, a key, and an operator that
                                    relates the key and values.
                                  properties:
                                    key:
                                      description: key is the label key that the selector
                                        applies to.
                                      type: string
                                    operator:
                                      description: operator represents a key's relationship
                                        to a set of values. Valid operators are In,
                                        NotIn, Exists and DoesNotExist.
                                      type: string
                                    values:
                                      description: values is an array of string values.
                                        If the operator is In or NotIn, the values
                                        array must be non-empty. If the operator is
                                        Exists or DoesNotExist, the values array must
                                        be empty. This array is replaced during a
                                        strategic merge patch.
                                      items:
                                        type: string
                                      type: array
                                  required:
                                  - key
                                  - operator
                                  type: object
                                type: array
                              matchLabels:
                                additionalProperties:
                                  type: string
                                description: matchLabels is a map of {key,value} pairs.
                                  A single {key,value} in the matchLabels map is equivalent
                                  to an element of matchExpressions, whose key field
                                  is "key", the operator is "In", and the values array
                                  contains only "value". The requirements are ANDed.
                                type: object
                            type: object
                            x-kubernetes-map-type: atomic
                          namespaces:
                            description: namespaces specifies a static list of namespace
                              names that the term applies to. The term is applied
                              to the union of the namespaces listed in this field
                              and the ones selected by namespaceSelector. null or
                              empty namespaces list and null namespaceSelector means
                              "this pod's namespace".
                            items:
                              type: string
                            type: array
                          topologyKey:
                            description: This pod should be co-located (affinity)
                              or not co-located (anti-affinity) with the pods matching
                              the labelSelector in the specified namespaces, where
                              co-located is defined as running on a node whose value
                              of the label with key topologyKey matches that of any
                              node on which any of the selected pods is running. Empty
                              topologyKey is not allowed.
                            type: string
                        required:
                        - topologyKey
                        type: object
                      weight:
                        description: weight associated with matching the corresponding
                          podAffinityTerm, in the range 1-100.
                        format: int32
                        type: integer
                    required:
                    - podAffinityTerm
                    - weight
                    type: object
                  type: array
                requiredDuringSchedulingIgnoredDuringExecution:
                  description: If the anti-affinity requirements specified by this
                    field are not met at scheduling time, the pod will not be scheduled
                    onto the node. If the anti-affinity requirements specified by
                    this field cease to be met at some point during pod execution
                    (e.g. due to a pod label update), the system may or may not try
                    to eventually evict the pod from its node. When there are multiple
                    elements, the lists of nodes corresponding to each podAffinityTerm
                    are intersected, i.e. all terms must be satisfied.
                  items:
                    description: Defines a set of pods (namely those matching the
                      labelSelector relative to the given namespace(s)) that this
                      pod should be co-located (affinity) or not co-located (anti-affinity)
                      with, where co-located is defined as running on a node whose
                      value of the label with key <topologyKey> matches that of any
                      node on which a pod of the set of pods is running
                    properties:
                      labelSelector:
                        description: A label query over a set of resources, in this
                          case pods.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaceSelector:
                        description: A label query over the set of namespaces that
                          the term applies to. The term is applied to the union of
                          the namespaces selected by this field and the ones listed
                          in the namespaces field. null selector and null or empty
                          namespaces list means "this pod's namespace". An empty selector
                          ({}) matches all namespaces.
                        properties:
                          matchExpressions:
                            description: matchExpressions is a list of label selector
                              requirements. The requirements are ANDed.
                            items:
                              description: A label selector requirement is a selector
                                that contains values, a key, and an operator that
                                relates the key and values.
                              properties:
                                key:
                                  description: key is the label key that the selector
                                    applies to.
                                  type: string
                                operator:
                                  description: operator represents a key's relationship
                                    to a set of values. Valid operators are In, NotIn,
                                    Exists and DoesNotExist.
                                  type: string
                                values:
                                  description: values is an array of string values.
                                    If the operator is In or NotIn, the values array
                                    must be non-empty. If the operator is Exists or
                                    DoesNotExist, the values array must be empty.
                                    This array is replaced during a strategic merge
                                    patch.
                                  items:
                                    type: string
                                  type: array
                              required:
                              - key
                              - operator
                              type: object
                            type: array
                          matchLabels:
                            additionalProperties:
                              type: string
                            description: matchLabels is a map of {key,value} pairs.
                              A single {key,value} in the matchLabels map is equivalent
                              to an element of matchExpressions, whose key field is
                              "key", the operator is "In", and the values array contains
                              only "value". The requirements are ANDed.
                            type: object
                        type: object
                        x-kubernetes-map-type: atomic
                      namespaces:
                        description: namespaces specifies a static list of namespace
                          names that the term applies to. The term is applied to the
                          union of the namespaces listed in this field and the ones
                          selected by namespaceSelector. null or empty namespaces
                          list and null namespaceSelector means "this pod's namespace".
                        items:
                          type: string
                        type: array
                      topologyKey:
                        description: This pod should be co-located (affinity) or not
                          co-located (anti-affinity) with the pods matching the labelSelector
                          in the specified namespaces, where co-located is defined
                          as running on a node whose value of the label with key topologyKey
                          matches that of any node on which any of the selected pods
                          is running. Empty topologyKey is not allowed.
                        type: string
                    required:
                    - topologyKey
                    type: object
                  type: array
              type: object
          type: object
        resources:
          description: ResourceRequirements describes the compute resource requirements.
          properties:
            claims:
              description: "Claims lists the names of resources, defined in spec.resourceClaims,
                that are used by this container. \n This is an alpha field and requires
                enabling the DynamicResourceAllocation feature gate. \n This field
                is immutable."
              items:
                description: ResourceClaim references one entry in PodSpec.ResourceClaims.
                properties:
                  name:
                    description: Name must match the name of one entry in pod.spec.resourceClaims
                      of the Pod where this field is used. It makes that resource
                      available inside a container.
                    type: string
                required:
                - name
                type: object
              type: array
              x-kubernetes-list-map-keys:
              - name
              x-kubernetes-list-type: map
            limits:
              additionalProperties:
                anyOf:
                - type: integer
                - type: string
                pattern: ^(\+|-)?(([0-9]+(\.[0-9]*)?)|(\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\+|-)?(([0-9]+(\.[0-9]*)?)|(\.[0-9]+))))?$
                x-kubernetes-int-or-string: true
              description: 'Limits describes the maximum amount of compute resources
                allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/'
              type: object
            requests:
              additionalProperties:
                anyOf:
                - type: integer
                - type: string
                pattern: ^(\+|-)?(([0-9]+(\.[0-9]*)?)|(\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\+|-)?(([0-9]+(\.[0-9]*)?)|(\.[0-9]+))))?$
                x-kubernetes-int-or-string: true
              description: 'Requests describes the minimum amount of compute resources
                required. If Requests is omitted for a container, it defaults to Limits
                if that is explicitly specified, otherwise to an implementation-defined
                value. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/'
              type: object
          type: object
        subcomponentTolerations:
          description: SubcomponentTolerations allow the scheduler to schedule Package Operator subcomponents
            on nodes with matching taints.
          items:
            description: The pod this Toleration is attached to tolerates any taint
              that matches the triple <key,value,effect> using the matching operator
              <operator>.
            properties:
              effect:
                description: Effect indicates the taint effect to match. Empty means
                  match all taint effects. When specified, allowed values are NoSchedule,
                  PreferNoSchedule and NoExecute.
                type: string
              key:
                description: Key is the taint key that the toleration applies to.
                  Empty means match all taint keys. If the key is empty, operator
                  must be Exists; this combination means to match all values and all
                  keys.
                type: string
              operator:
                description: Operator represents a key's relationship to the value.
                  Valid operators are Exists and Equal. Defaults to Equal. Exists
                  is equivalent to wildcard for value, so that a pod can tolerate
                  all taints of a particular category.
                type: string
              tolerationSeconds:
                description: TolerationSeconds represents the period of time the toleration
                  (which must be of effect NoExecute, otherwise this field is ignored)
                  tolerates the taint. By default, it is not set, which means tolerate
                  the taint forever (do not evict). Zero and negative values will
                  be treated as 0 (evict immediately) by the system.
                format: int64
                type: integer
              value:
                description: Value is the taint value the toleration matches to. If
                  the operator is Exists, the value should be empty, otherwise just
                  a regular string.
                type: string
            type: object
          type: array
        tolerations:
          description: Tolerations allow the scheduler to schedule Package Operator
            on nodes with matching taints.
          items:
            description: The pod this Toleration is attached to tolerates any taint
              that matches the triple <key,value,effect> using the matching operator
              <operator>.
            properties:
              effect:
                description: Effect indicates the taint effect to match. Empty means
                  match all taint effects. When specified, allowed values are NoSchedule,
                  PreferNoSchedule and NoExecute.
                type: string
              key:
                description: Key is the taint key that the toleration applies to.
                  Empty means match all taint keys. If the key is empty, operator
                  must be Exists; this combination means to match all values and all
                  keys.
                type: string
              operator:
                description: Operator represents a key's relationship to the value.
                  Valid operators are Exists and Equal. Defaults to Equal. Exists
                  is equivalent to wildcard for value, so that a pod can tolerate
                  all taints of a particular category.
                type: string
              tolerationSeconds:
                description: TolerationSeconds represents the period of time the toleration
                  (which must be of effect NoExecute, otherwise this field is ignored)
                  tolerates the taint. By default, it is not set, which means tolerate
                  the taint forever (do not evict). Zero and negative values will
                  be treated as 0 (evict immediately) by the system.
                format: int64
                type: integer
              value:
                description: Value is the taint value the toleration matches to. If
                  the operator is Exists, the value should be empty, otherwise just
                  a regular string.
                type: string
            type: object
          type: array

      type: object
  phases:
  - name: crds
  - name: namespace
  - name: rbac
  - name: deploy
  scopes:
  - Cluster
test:
  kubeconform:
    kubernetesVersion: v1.28.2
  template:
  - context:
      package:
        image: registry.package-operator.run/static-image
        metadata:
          annotations: null
          labels: null
          name: test
          namespace: ""
    name: no-config
  - context:
      package:
        image: registry.package-operator.run/static-image
        metadata:
          annotations: null
          labels: null
          name: test
          namespace: ""
      config:
        resources:
          limits:
            cpu: 10m
            memory: 13Mi
          requests:
            cpu: 10m
            memory: 12Mi
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: node-role.kubernetes.io/infra
                  operator: Exists
        tolerations:
        - effect: NoSchedule
          key: node-role.kubernetes.io/infra
    name: root-affinity-tolerations-resources
  - context:
      package:
        image: registry.package-operator.run/static-image
        metadata:
          annotations: null
          labels: null
          name: test
          namespace: ""
      environment:
        openShift:
          version: "xxx"
        proxy:
          httpProxy: http
          httpsProxy: https
          noProxy: no...
    name: openshift-with-proxy
