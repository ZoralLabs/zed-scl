; Comments
(comment) @comment

; Document markers
(document_start) @punctuation.special
(document_end) @punctuation.special

; Keys in mappings
; Quoted keys - treat all quoted strings as user keys regardless of content
(block_mapping_pair key: (quoted_string) @string.special)
(flow_mapping_pair key: (quoted_string) @string.special)

; Generic keys - unquoted identifiers used as keys in mappings
(block_mapping_pair key: (identifier) @property)
(flow_mapping_pair key: (identifier) @property)

; SCD-specific types - core type system
;(scd_type) @type.builtin

; YAML anchors and aliases
;(anchor "&" @punctuation.special)
;(anchor_name) @label
;(alias "*" @punctuation.special)
;(alias_name) @label

; SCD-specific type values that appear as plain scalars
;((string) @type.builtin
; (#match? @type.builtin "^(decimal|ledger|currency|date_time|integer|transaction_type|posting_type|balance_id|dated_rate|enum|datetime|tiered_rate|json|string|boolean)$"))

; Basic scalar types
(null) @constant.builtin
(boolean) @constant.builtin.boolean
(integer) @constant.numeric.integer
(float) @constant.numeric.float

; Strings
(double_quoted_string) @string
(single_quoted_string) @string
(double_quoted_content) @string
(single_quoted_content) @string

; Escape sequences in strings
(escape_sequence) @constant.character.escape

; Identifiers (fallback for non-key identifiers like values)
(identifier) @variable

; Punctuation
":" @punctuation.delimiter
"," @punctuation.delimiter
"-" @punctuation.delimiter

; Brackets for flow structures
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

; Error nodes for debugging
(ERROR) @error
