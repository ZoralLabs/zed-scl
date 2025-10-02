; Inject SQL in string literals that look like SQL queries
((string_literal) @injection.content
 (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)")
 (#set! injection.language "sql"))

; Inject JSON in string literals that look like JSON
((string_literal) @injection.content
 (#match? @injection.content "^\\s*[\\{\\[]")
 (#set! injection.language "json"))

; Inject regex in string literals used with regex functions
(function_call
  name: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#match? @function "(match|replace|test|search)")
  (#set! injection.language "regex"))

; Inject datetime format strings
(function_call
  name: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#match? @function "(format_date|parse_date|date_format)")
  (#set! injection.language "strftime"))

; Inject mathematical expressions in calculation contexts
(assignment_expression
  right: (string_literal) @injection.content
  (#match? @injection.content "^[0-9+\\-*/().\\s]+$")
  (#set! injection.language "math"))

; Inject SCL expressions in template strings
((template_string) @injection.content
 (#set! injection.language "scl"))

; Inject comments as documentation
((line_comment) @injection.content
 (#match? @injection.content "^//\\s*@(param|return|throws|example)")
 (#set! injection.language "markdown"))

((block_comment) @injection.content
 (#match? @injection.content "/\\*\\*")
 (#set! injection.language "markdown"))

; Inject XML/HTML in string literals that look like markup
((string_literal) @injection.content
 (#match? @injection.content "^\\s*<[a-zA-Z]")
 (#set! injection.language "html"))

; Inject YAML in multiline strings
((string_literal) @injection.content
 (#match? @injection.content "^\\s*[a-zA-Z_][a-zA-Z0-9_]*:\\s")
 (#set! injection.language "yaml"))
