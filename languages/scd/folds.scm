; YAML-based folding for SCD files
; Targets actual grammar nodes from tree-sitter-scd

; YAML block structures - main folding targets
(block_mapping) @fold
(block_sequence) @fold

; Flow structures (inline YAML)
(flow_mapping) @fold
(flow_sequence) @fold

; Multi-line strings
(double_quoted_string) @fold
(single_quoted_string) @fold

; Comments (for multi-line comment blocks)
(comment) @fold

; Document sections (if they span multiple lines)
(document) @fold

; Block mapping pairs that contain nested structures
(block_mapping_pair
  value: (block_mapping)) @fold

(block_mapping_pair
  value: (block_sequence)) @fold

; Block sequence items that contain nested structures
(block_sequence_item
  (block_mapping)) @fold

(block_sequence_item
  (block_sequence)) @fold

; Anchored values (YAML anchors with content)
(anchor) @fold
