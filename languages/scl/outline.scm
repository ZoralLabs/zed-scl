; Function literals
(function_literal) @item

; Variable declarations
(variable_declaration
  name: (identifier) @name) @item

; Import statements
(import_expression
  source: (string_literal) @name) @item

; Export statements
(export_statement) @item

; Assignment statements for important variables
(assignment_statement
  left: (identifier) @name) @item

; If statements with conditions
(if_statement) @item

; For statements
(for_statement) @item

; For-in statements
(for_in_statement
  value: (identifier) @name) @item

; SCL-specific function calls that define structure
(function_call
  function: (identifier) @name
  (#match? @name "(reject|set_parameter|schedule_event|new_transaction|new_posting|deactivate)")) @item

; Map literals (significant data structures)
(map_literal) @item

; Array literals (significant data structures)
(array_literal) @item

; Function calls to built-in mathematical functions
(function_call
  function: (identifier) @name
  (#match? @name "(min|max)")) @item

; Return statements
(return_statement) @item
