; Increase indent after opening braces and colons
("{" @indent)
("[" @indent)
(":" @indent)

; Decrease indent before closing braces
("}" @outdent)
("]" @outdent)

; Indent parameter definitions
(parameters
  (parameter_definition) @indent.begin)

; Indent nested parameter properties
(parameter_definition
  (parameter_body) @indent.begin)

; Indent configuration blocks
(config_block @indent.begin)

; Indent parameter groups
(parameter_group
  (parameter_list) @indent.begin)

; Indent enum value lists
(enum_values
  (enum_list) @indent.begin)

; Indent nested objects and arrays
(object_literal
  (object_property) @indent.begin)

(array_literal
  (array_element) @indent.begin)

; Indent multiline parameter definitions
(parameter
  (parameter_options) @indent.begin)

; Special handling for SCD sections
(parameters_section
  (parameter_block) @indent.begin)

(constants_section
  (constants_block) @indent.begin)

(balances_section
  (balances_block) @indent.begin)

(interest_section
  (interest_block) @indent.begin)

(core_section
  (core_block) @indent.begin)

; Indent continuation lines for complex parameter definitions
(parameter_definition
  type: (_) @indent.begin
  (#match? @indent.begin "\n"))

(parameter_definition
  default: (_) @indent.begin
  (#match? @indent.begin "\n"))

(parameter_definition
  description: (_) @indent.begin
  (#match? @indent.begin "\n"))

; Indent nested configuration values
(config_entry
  value: (_) @indent.begin
  (#match? @indent.begin "^\\s*{"))

; Indent multiline string values
(string_literal @indent.begin
  (#match? @indent.begin "\n"))

; Indent comments that continue previous lines
(comment @indent.begin
  (#match? @indent.begin "^\\s*#\\s*[^#]"))

; Handle indentation for parameter properties
(parameter_property @indent.begin)

; Indent balance definitions
(balance_definition
  (balance_properties) @indent.begin)

; Indent transaction type definitions
(transaction_type_definition
  (transaction_properties) @indent.begin)

; Indent posting type definitions
(posting_type_definition
  (posting_properties) @indent.begin)

; Indent rate definitions
(rate_definition
  (rate_properties) @indent.begin)

; Indent frequency definitions
(frequency_definition
  (frequency_properties) @indent.begin)
