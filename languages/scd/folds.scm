; Fold parameter blocks
(parameters
  (parameter_block) @fold)

; Fold nested parameter definitions
(parameter_definition
  (parameter_body) @fold)

; Fold object-like structures
(object_literal) @fold

; Fold array definitions
(array_literal) @fold

; Fold nested configuration blocks
(config_block) @fold

; Fold parameter groups
(parameter_group) @fold

; Fold enum value lists
(enum_values
  (enum_list) @fold)

; Fold multi-line parameter definitions
(parameter
  (parameter_options) @fold)

; Fold nested structures in SCD files
(nested_object) @fold

; Fold configuration sections
(configuration_section) @fold

; Fold balance definitions
(balance_definition) @fold

; Fold interest configuration
(interest_config) @fold

; Fold constants section
(constants_section) @fold

; Fold core parameters section
(core_section) @fold

; Fold large parameter blocks with multiple properties
(parameter_with_properties) @fold
