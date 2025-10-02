; Minimal working folds for SCD files
; Basic folding patterns that should work with most tree-sitter grammars

; Object and array structures
(object) @fold
(array) @fold

; Block structures
(block) @fold

; Parameter sections (if they exist in the grammar)
(parameters) @fold
(parameter) @fold

; Configuration sections
(section) @fold

; Multi-line comments
(comment) @fold

; Multi-line strings
(string_literal) @fold

; Key-value pairs that might be multi-line
(pair) @fold

; Any nested structure with braces
(_ "{" "}" @fold)

; Any nested structure with brackets
(_ "[" "]" @fold)
