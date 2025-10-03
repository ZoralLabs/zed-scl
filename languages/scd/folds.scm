; Block mappings (YAML-style key-value pairs)
(block_mapping) @fold

; Block sequences (YAML-style lists)
(block_sequence) @fold

; Flow mappings (JSON-style objects)
(flow_mapping) @fold

; Flow sequences (JSON-style arrays)
(flow_sequence) @fold

; SCD-specific top-level sections that should be foldable
((block_mapping_pair
  key: (scalar) @key
  value: (block_mapping) @fold)
 (#match? @key "^(parameters|balances|events|modules|snapshots)$"))

; Individual event definitions within events section
(block_mapping_pair
  key: (scalar) @events_key
  value: (block_mapping
    (block_mapping_pair
      value: (block_mapping) @fold))
 (#eq? @events_key "events"))

; Fold regions between INDENT and DEDENT tokens
((INDENT) @fold.start
 (DEDENT) @fold.end)

; Quoted strings that span multiple lines
(double_quoted_string) @fold
(single_quoted_string) @fold

; Comments that are part of a sequence (multiple consecutive comments)
((comment) @fold
 (#set! fold.type "comment"))
