; Function definitions
(function_definition
  name: (identifier) @name) @item

; Variable declarations
(variable_declaration
  name: (identifier) @name) @item

; Class definitions
(class_definition
  name: (identifier) @name) @item

; Struct definitions
(struct_definition
  name: (identifier) @name) @item

; Enum definitions
(enum_definition
  name: (identifier) @name) @item

; Interface definitions
(interface_definition
  name: (identifier) @name) @item

; Type definitions
(type_definition
  name: (identifier) @name) @item

; Import statements
(import_statement
  module: (identifier) @name) @item

; Export statements
(export_statement
  name: (identifier) @name) @item

; Method definitions
(method_definition
  name: (identifier) @name) @item

; Property definitions
(property_definition
  name: (identifier) @name) @item

; Constant definitions
(constant_declaration
  name: (identifier) @name) @item

; SCL-specific constructs
(schedule_event
  event: (string_literal) @name) @item

(new_transaction
  type: (identifier) @name) @item

(set_parameter
  name: (string_literal) @name) @item

; Assignment statements for important variables
(assignment_expression
  left: (identifier) @name) @item

; If statements with conditions
(if_statement
  condition: (_) @name) @item

; While loops
(while_statement
  condition: (_) @name) @item

; For loops
(for_statement
  variable: (identifier) @name) @item

; Try-catch blocks
(try_statement) @item

; Match/switch statements
(match_statement
  expression: (_) @name) @item
