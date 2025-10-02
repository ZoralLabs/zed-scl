; Increase indent after opening braces
(block_statement "{" @indent)
(object_literal "{" @indent)
(array_literal "[" @indent)
(function_definition "{" @indent)
(class_definition "{" @indent)
(struct_definition "{" @indent)
(if_statement "{" @indent)
(else_clause "{" @indent)
(while_statement "{" @indent)
(for_statement "{" @indent)
(try_statement "{" @indent)
(catch_clause "{" @indent)
(match_statement "{" @indent)
(case_clause "{" @indent)

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

(while_statement
  condition: (_) @indent.align)

(for_statement
  initializer: (_) @indent.align)

; Indent continuation lines
(binary_expression
  right: (_) @indent.begin)

(assignment_expression
  right: (_) @indent.begin)

; Indent function call arguments when split across lines
(function_call
  arguments: (argument_list) @indent.begin)

; Indent method chaining
(method_call
  "." @indent.begin)

; Indent array elements when split across lines
(array_literal
  (array_element) @indent.begin)

; Indent object properties when split across lines
(object_literal
  (object_property) @indent.begin)

; Special handling for SCL constructs
(schedule_event
  "(" @indent)

(new_transaction
  "(" @indent)

(new_posting
  "(" @indent)

; Indent import statements with multiple imports
(import_statement
  "(" @indent)

; Handle multiline string literals
(string_literal @indent.begin
  (#match? @indent.begin "\n"))

; Indent comments that continue previous lines
(line_comment @indent.begin
  (#match? @indent.begin "^\\s*//\\s*[^/]"))
