; Package definition
(package_definition
  id: (identifier) @name) @item

; Type definitions
(type_definition
  name: (identifier) @name) @item

; Parameter definitions
(parameter_definition
  name: (identifier) @name) @item

; Configuration sections
(parameters_section) @item

(constants_section) @item

(balances_section) @item

(interest_section) @item

(core_section) @item

; Individual parameters with their names
(parameter
  name: (identifier) @name) @item

; Nested parameter groups
(parameter_group
  name: (string_literal) @name) @item

; Balance definitions
(balance_definition
  name: (identifier) @name) @item

; Transaction type definitions
(transaction_type_definition
  name: (identifier) @name) @item

; Posting type definitions
(posting_type_definition
  name: (identifier) @name) @item

; Enum definitions
(enum_definition
  name: (identifier) @name) @item

; Configuration keys at top level
(config_entry
  key: (identifier) @name) @item

; Package metadata
(package_id
  value: (string_literal) @name) @item

(package_name
  value: (string_literal) @name) @item

(package_type
  value: (identifier) @name) @item

(package_category
  value: (identifier) @name) @item

; Author and organization
(author
  value: (string_literal) @name) @item

(org_unit
  value: (string_literal) @name) @item

; Rate definitions
(rate_definition
  name: (identifier) @name) @item

; Frequency definitions
(frequency_definition
  name: (identifier) @name) @item

; Date/time configurations
(datetime_config
  name: (identifier) @name) @item

; Currency configurations
(currency_config
  name: (identifier) @name) @item

; Ledger configurations
(ledger_config
  name: (identifier) @name) @item
