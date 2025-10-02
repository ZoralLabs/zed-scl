; YAML-aware indentation for SCD files
; Based on actual tree-sitter-scd grammar nodes

; YAML block mapping indentation
; When we see a mapping pair with a value, indent the value
(block_mapping_pair
  ":" @indent
  (#set! "scope" "all"))

; Block sequence items - indent content after the dash
(block_sequence_item
  "-" @indent
  (#set! "scope" "all"))

; Flow structures use brackets - standard bracket indentation
(flow_mapping
  "{" @indent
  "}" @outdent)

(flow_sequence
  "[" @indent
  "]" @outdent)

; Nested block structures
(block_mapping_pair
  value: (block_mapping) @indent)

(block_mapping_pair
  value: (block_sequence) @indent)

(block_sequence_item
  (block_mapping) @indent)

(block_sequence_item
  (block_sequence) @indent)

; Multi-line strings preserve their internal structure
; but should align with their container
(double_quoted_string) @indent.always
(single_quoted_string) @indent.always

; YAML anchors - indent the anchored content
(anchor @indent
  (#set! "scope" "all"))

; Document markers don't affect indentation
(document_start) @indent.zero
(document_end) @indent.zero

; Comments should preserve existing indentation context
; This ensures comments align with their surrounding content
(comment) @indent.auto
