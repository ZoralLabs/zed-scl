; Comments
(comment) @comment

; Punctuation
[":"
 ","
 "."] @punctuation.delimiter

; Brackets
["["
 "]"
 "("
 ")"] @punctuation.bracket

; Operators
["="
 "=="
 "!"
 "!="
 "+"
 "++"
 "-"
 "--"
 "*"
 "/"
 "%"
 "^"
 "&"
 "&&"
 "|"
 "||"
 "<"
 "<="
 "<<"
 ">"
 ">="
 ">>"
 "&^"] @operator

; Generic variable
(identifier) @variable

; Booleans
(boolean_literal) @boolean

; Numbers
(number_literal) @number
(integer_literal) @number
(float_literal) @number.float

; Keywords
(keyword) @keyword
(as_clause) @keyword

; Function calls
(function_call
  function: (identifier) @function)

; Builtin functions
(function_call function: (identifier) @function.builtin
    (#match? @function.builtin "^(accnum|file)$"))

; Builtin type functions
(function_call function: (identifier) @type
    (#match? @type "^(string|decimal|bool|time|duration|seconds|minutes|hours|days)$"))

; Generic selector
(member_access
  property: (identifier) @property)

; Strings
(string_literal) @string

; Assignment targets
(assignment
  (identifier) @variable)
