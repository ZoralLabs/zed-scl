; SCD document outline - shows hierarchical structure of SCD files
; Targets actual grammar nodes from tree-sitter-scd

; Top-level document sections - these are the main structural elements
(block_mapping_pair
  key: (identifier) @name
  (#match? @name "^(id|name|description|author|org_unit|version|timezone)$")) @item

; Core SCD sections that define the contract structure
(block_mapping_pair
  key: (identifier) @name
  (#match? @name "^(parameters|balances|events|type|tier|category)$")) @item

; Parameter definitions within the parameters section
(block_mapping_pair
  key: (identifier) @name
  value: (block_mapping)) @item
  (#ancestor? @item (block_mapping_pair key: (identifier) (#eq? @name "parameters")))

; Balance definitions within the balances section
(block_mapping_pair
  key: (identifier) @name
  value: (block_mapping)) @item
  (#ancestor? @item (block_mapping_pair key: (identifier) (#eq? @name "balances")))

; Event definitions within the events section
(block_mapping_pair
  key: (identifier) @name
  value: (block_mapping)) @item
  (#ancestor? @item (block_mapping_pair key: (identifier) (#eq? @name "events")))

; Configuration sections and important properties
(block_mapping_pair
  key: (identifier) @name
  (#match? @name "^(group_name|ledger|currency|enum_values)$")) @item

; YAML anchors - these can be referenced elsewhere in the document
(anchor
  name: (anchor_name) @name) @item

; Block sequences that might represent lists of items
(block_mapping_pair
  key: (identifier) @name
  value: (block_sequence)) @item

; Quoted string keys (sometimes used for special identifiers)
(block_mapping_pair
  key: (quoted_string) @name) @item

; Type definitions (when type appears as a key with a mapping value)
(block_mapping_pair
  key: (identifier) @name
  (#eq? @name "type")
  value: (block_mapping)) @item
