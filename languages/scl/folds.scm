; Fold function definitions
(function_definition
  body: (block) @fold)

; Fold if statements
(if_statement
  consequence: (block) @fold)

(if_statement
  alternative: (block) @fold)

; Fold while loops
(while_statement
  body: (block) @fold)

; Fold for loops
(for_statement
  body: (block) @fold)

; Fold try-catch blocks
(try_statement
  body: (block) @fold)

(catch_clause
  body: (block) @fold)

; Fold class/struct definitions
(class_definition
  body: (class_body) @fold)

(struct_definition
  body: (struct_body) @fold)

; Fold object literals
(object_literal) @fold

; Fold array literals
(array_literal) @fold

; Fold block statements
(block_statement) @fold

; Fold multi-line comments
(block_comment) @fold

; Fold import groups
(import_statement) @fold
