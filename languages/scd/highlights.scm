; Comments
(comment) @comment

; Document markers
(document_start) @punctuation.special
(document_end) @punctuation.special

; Punctuation
[":"
 ","
 "-"] @punctuation.delimiter

; Brackets
["{"
 "}"
 "["
 "]"] @punctuation.bracket

; Null as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (null) @constant.builtin)))
(flow_mapping_pair value: (scalar (plain_scalar (null) @constant.builtin)))
(flow_sequence_content (scalar (plain_scalar (null) @constant.builtin)))
(block_sequence_item (scalar (plain_scalar (null) @constant.builtin)))

; Booleans as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (boolean) @boolean)))
(flow_mapping_pair value: (scalar (plain_scalar (boolean) @boolean)))
(flow_sequence_content (scalar (plain_scalar (boolean) @boolean)))
(block_sequence_item (scalar (plain_scalar (boolean) @boolean)))

; Integers as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (integer) @number)))
(flow_mapping_pair value: (scalar (plain_scalar (integer) @number)))
(flow_sequence_content (scalar (plain_scalar (integer) @number)))
(block_sequence_item (scalar (plain_scalar (integer) @number)))

; Floats as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (float) @number)))
(flow_mapping_pair value: (scalar (plain_scalar (float) @number)))
(flow_sequence_content (scalar (plain_scalar (float) @number)))
(block_sequence_item (scalar (plain_scalar (float) @number)))

; SCD types as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (scd_type) @type)))
(flow_mapping_pair value: (scalar (plain_scalar (scd_type) @type)))
(flow_sequence_content (scalar (plain_scalar (scd_type) @type)))
(block_sequence_item (scalar (plain_scalar (scd_type) @type)))

; SCD keywords as values in mappings or as elements in sequences
(block_mapping_pair value: (scalar (plain_scalar (scd_keyword) @type)))
(flow_mapping_pair value: (scalar (plain_scalar (scd_keyword) @type)))
(flow_sequence_content (scalar (plain_scalar (scd_keyword) @type)))
(block_sequence_item (scalar (plain_scalar (scd_keyword) @type)))

; Strings
(quoted_string) @string

; SCL scripts
((string) @module (#match? @module "^[a-zA-Z0-9_\\-.]+\\.scl$"))

; Escape sequences
(escape_sequence) @string.escape

; Generic keys in mappings
(block_mapping_pair key: (scalar) @property)
(flow_mapping_pair key: (scalar) @property)

; Quoted keys in mappings
(block_mapping_pair key: (quoted_string) @string)
(flow_mapping_pair key: (quoted_string) @string)

; Top-level SCD keywords as direct block mapping pairs in document
(document
  (block_mapping_pair
    key: (scalar) @property.builtin
      (#match? @property.builtin "^(id|type|name|category|description|schema|org_unit|author|timezone|parameters|snapshots|modules|events|balances|tier)$")))

; Also highlight SCD keywords in nested block mappings
(block_mapping
  (block_mapping_pair
    key: (scalar) @property.builtin
      (#match? @property.builtin "^(id|type|name|category|description|schema|org_unit|author|timezone|parameters|snapshots|modules|events|balances|tier)$")))
