; Keywords
[
  "id"
  "type"
  "tier"
  "name"
  "category"
  "description"
  "author"
  "org_unit"
  "timezone"
  "parameters"
  "default"
  "optional"
  "group_name"
  "group_order"
  "enum_values"
  "true"
  "false"
] @keyword

; Data types
[
  "product_contract"
  "decimal"
  "integer"
  "string"
  "date_time"
  "date"
  "time"
  "currency"
  "ledger"
  "balance_id"
  "transaction_type"
  "posting_type"
  "enum"
  "dated_rate"
  "datetime"
  "bool"
  "boolean"
] @type.builtin

; Field names (keys in key-value pairs)
(field_name) @property

; String values
(string_literal) @string
(quoted_string) @string

; Numbers
(integer_literal) @number
(decimal_literal) @number
(float_literal) @number

; Boolean values
(boolean_literal) @constant.builtin

; Comments
(comment) @comment
(line_comment) @comment

; Identifiers
(identifier) @variable

; Special values
[
  "UTC"
  "general"
  "system"
  "internal"
  "interest"
  "fee"
  "demand"
  "system_recovery"
  "manual_recovery"
  "debit_interest"
  "actual"
  "daily"
  "weekly"
  "monthly"
  "friday"
  "sunday"
  "monday"
  "tuesday"
  "wednesday"
  "thursday"
  "saturday"
] @constant.builtin.boolean

; Email addresses
(email) @string.special

; Operators and punctuation
[
  ":"
  ","
] @punctuation.delimiter

[
  "{"
  "}"
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

; Special SCD structure keywords
[
  "parameters"
  "group_name"
  "group_order"
  "enum_values"
  "optional"
  "default"
] @keyword.control

; Configuration sections
(section_header) @title

; Values in arrays
(array_element) @string

; Nested object keys
(nested_key) @property

; Special patterns for SCD configuration
(config_key) @property
(config_value) @string

; Time-related values
[
  "1W"
  "1M"
  "3M"
  "1Y"
  "360"
  "365"
] @string.special

; Balance and account identifiers
(balance_identifier) @variable.builtin
(account_identifier) @variable.builtin

; Error highlighting for malformed syntax
(ERROR) @error
