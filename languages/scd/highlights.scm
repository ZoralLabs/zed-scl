; Minimal working highlights for SCD files
; Basic syntax elements that should work with most tree-sitter grammars

; Comments
(comment) @comment
(line_comment) @comment

; String literals
(string) @string
(string_literal) @string

; Numbers
(number) @number
(integer) @number
(decimal) @number

; Identifiers
(identifier) @variable

; Boolean literals
(true) @constant.builtin.boolean
(false) @constant.builtin.boolean

; Basic punctuation
":" @punctuation.delimiter
"," @punctuation.delimiter
";" @punctuation.delimiter
"=" @operator

; Brackets
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"(" @punctuation.bracket
")" @punctuation.bracket

; Common SCD keywords as literal strings
"id" @keyword
"name" @keyword
"type" @keyword
"description" @keyword
"author" @keyword
"parameters" @keyword
"default" @keyword
"optional" @keyword

; Data types
"string" @type.builtin
"integer" @type.builtin
"decimal" @type.builtin
"boolean" @type.builtin
"date" @type.builtin
"currency" @type.builtin

; Error nodes for debugging
(ERROR) @error
