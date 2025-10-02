; Increase indent after opening braces
(block "{" @indent)
(map_literal "{" @indent)
(array_literal "[" @indent)
(function_literal "{" @indent)
(if_statement "{" @indent)
(for_statement "{" @indent)
(for_in_statement "{" @indent)

; Decrease indent before closing braces
("}" @outdent)
("]" @outdent)

; Increase indent for function parameters spanning multiple lines
(parameter_list
  "(" @indent)

; Decrease indent after parameter list closing
(")" @outdent)

; Special indentation for control flow
(if_statement
  condition: (_) @indent.align)

(for_statement
  condition: (_) @indent.align)

(for_in_statement
  iterable: (_) @indent.align)

; Indent continuation lines
(binary_expression
  right: (_) @indent.begin)

(assignment_statement
  right: (_) @indent.begin)

(variable_declaration
  value: (_) @indent.begin)

; Indent function call arguments when split across lines
(function_call
  arguments: (argument_list) @indent.begin)

; Indent method chaining
(selector_expression
  "." @indent.begin)

; Indent array elements when split across lines
(array_literal
  (_) @indent.begin)

; Indent map properties when split across lines
(map_literal
  (map_pair) @indent.begin)

; Special handling for SCL built-in function calls
(function_call
  function: (identifier)
  arguments: (argument_list) @indent.begin
  (#match? @function "(reject|set_parameter|schedule_event|new_transaction|new_posting|deactivate)"))

; Indent ternary expressions
(ternary_expression
  "?" @indent.begin
  ":" @indent.begin)

; Handle multiline string literals
(string_literal @indent.begin
  (#match? @indent.begin "\n"))

(raw_string_literal @indent.begin
  (#match? @indent.begin "\n"))

; Indent comments that continue previous lines
(comment @indent.begin
  (#match? @indent.begin "^\\s*//\\s*[^/]"))
