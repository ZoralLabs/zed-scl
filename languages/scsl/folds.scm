; Block statements (statements that end with colon and have indented content)
(block_statement) @fold

; Blocks themselves (indented sections)
(block) @fold

; Function calls with arguments
(function_call
  (argument_list) @fold)

; Parenthesized expressions that span multiple lines
(parenthesized_expression) @fold

; Array literals
(array_literal) @fold

; Comments that are part of a sequence (multiple consecutive comments)
((comment) @fold
 (#set! fold.type "comment"))

; String literals that might span multiple lines
(string_literal) @fold
