; Comments
(comment) @comment

; Document markers
(document_start) @punctuation.special
(document_end) @punctuation.special

; Keys in mappings - these are the main structural elements
(block_mapping_pair key: (identifier) @property)
(flow_mapping_pair key: (identifier) @property)
(block_mapping_pair key: (quoted_string) @property)
(flow_mapping_pair key: (quoted_string) @property)

; SCD-specific types - core type system
(scd_type) @type.builtin

; Basic scalar types
(boolean) @constant.builtin.boolean
(null) @constant.builtin
(integer) @constant.numeric.integer
(float) @constant.numeric.float

; Strings
(double_quoted_string) @string
(single_quoted_string) @string
(double_quoted_content) @string
(single_quoted_content) @string
(string) @string

; Escape sequences in strings
(escape_sequence) @constant.character.escape

; Identifiers
(identifier) @variable

; YAML anchors and aliases
(anchor "&" @punctuation.special)
(anchor_name) @label
(alias "*" @punctuation.special)
(alias_name) @label

; Punctuation
":" @punctuation.delimiter
"," @punctuation.delimiter
"-" @punctuation.delimiter

; Brackets for flow structures
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

; Known SCD section names - these are the main document structure
((identifier) @keyword.control
 (#match? @keyword.control "^(parameters|balances|events|id|type|tier|name|category|description|author|org_unit|timezone|version)$"))

; Known parameter and configuration properties
((identifier) @attribute
 (#match? @attribute "^(type|optional|group_name|group_order|description|default|enum_values|ledger|currency|precision|scale|min|max|pattern|format)$"))

; SCD-specific values that appear as plain scalars
((string) @type.builtin
 (#match? @type.builtin "^(decimal|ledger|currency|date_time|integer|transaction_type|posting_type|balance_id|dated_rate|enum|datetime|tiered_rate|json|string|boolean)$"))

; Transaction and posting types (common SCD values)
((string) @constant.builtin
 (#match? @constant.builtin "^(debit|credit|asset|liability|equity|income|expense)$"))

; Common boolean-like SCD values
((string) @constant.builtin.boolean
 (#match? @constant.builtin.boolean "^(required|optional|enabled|disabled)$"))

; ISO currency codes (common in SCD files)
((string) @constant.builtin
 (#match? @constant.builtin "^[A-Z]{3}$"))

; Date patterns (ISO format common in SCD)
((string) @constant.numeric
 (#match? @constant.numeric "^[0-9]{4}-[0-9]{2}-[0-9]{2}"))

; Error nodes for debugging
(ERROR) @error
