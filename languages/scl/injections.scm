; Inject SQL in string literals that look like SQL queries
((string_literal) @injection.content
 (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)")
 (#set! injection.language "sql"))

; Inject JSON in string literals that look like JSON
((string_literal) @injection.content
 (#match? @injection.content "^\\s*[\\{\\[]")
 (#set! injection.language "json"))

; Inject regex in string literals used with regex-like functions
(function_call
  function: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#match? @function "(match|replace|test|search|find)")
  (#set! injection.language "regex"))

; Inject datetime format strings for SCL time functions
(function_call
  function: (selector_expression
    object: (identifier) @module
    property: (identifier) @function)
  arguments: (argument_list
    (string_literal) @injection.content)
  (#eq? @module "times")
  (#match? @function "(format|parse|next_scheduled_time)")
  (#set! injection.language "strftime"))

; Inject SCL parameter names in set_parameter calls
(function_call
  function: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#eq? @function "set_parameter")
  (#set! injection.language "scl"))

; Inject event names in schedule_event calls
(function_call
  function: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#eq? @function "schedule_event")
  (#set! injection.language "scl"))

; Inject transaction type strings
(function_call
  function: (identifier) @function
  arguments: (argument_list
    (string_literal) @injection.content)
  (#eq? @function "new_transaction")
  (#set! injection.language "scl"))

; Inject mathematical expressions in raw string literals
((raw_string_literal) @injection.content
 (#match? @injection.content "^[0-9+\\-*/().\\s]+$")
 (#set! injection.language "math"))

; Inject XML/HTML in string literals that look like markup
((string_literal) @injection.content
 (#match? @injection.content "^\\s*<[a-zA-Z]")
 (#set! injection.language "html"))

; Inject YAML in multiline string literals
((string_literal) @injection.content
 (#match? @injection.content "^\\s*[a-zA-Z_][a-zA-Z0-9_]*:\\s")
 (#set! injection.language "yaml"))

; Inject comments as documentation for SCL functions
((comment) @injection.content
 (#match? @injection.content "^//\\s*@(param|return|throws|example)")
 (#set! injection.language "markdown"))

; Inject block comments as documentation
((comment) @injection.content
 (#match? @injection.content "/\\*\\*")
 (#set! injection.language "markdown"))

; Inject SCL module names in import expressions
(import_expression
  source: (string_literal) @injection.content
  (#set! injection.language "scl"))

; Inject balance ID patterns
(function_call
  function: (identifier) @function
  arguments: (argument_list
    (parameter_variable) @injection.content)
  (#match? @function "(new_posting)")
  (#match? @injection.content "\\$.*balance.*")
  (#set! injection.language "scl"))
