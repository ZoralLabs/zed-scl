; Use INDENT/DEDENT tokens for indentation control
(INDENT) @indent
(DEDENT) @outdent

; Increase indent after block statements (statements ending with colon)
(block_statement
  ":" @indent)

; Increase indent inside blocks
(block) @indent

; Increase indent inside parenthesized expressions
(parenthesized_expression
  "(" @indent
  ")" @outdent)

; Increase indent inside array literals
(array_literal
  "[" @indent
  "]" @outdent)

; Increase indent inside function calls with arguments
(function_call
  (argument_list) @indent)

; Fold regions between INDENT and DEDENT tokens
((INDENT) @fold.start
 (DEDENT) @fold.end)
