; Inject email format in string literals that look like email addresses
((string_literal) @injection.content
 (#match? @injection.content "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
 (#set! injection.language "email"))

; Inject JSON in configuration values that look like JSON objects
((config_value) @injection.content
 (#match? @injection.content "^\\s*[\\{\\[]")
 (#set! injection.language "json"))

; Inject regex patterns in enum values or validation rules
((enum_value) @injection.content
 (#match? @injection.content "^\\^.*\\$$")
 (#set! injection.language "regex"))

; Inject datetime format strings
((string_literal) @injection.content
 (#match? @injection.content "(YYYY|MM|DD|HH|mm|ss|ISO|UTC)")
 (#set! injection.language "strftime"))

; Inject SQL-like query patterns in description fields
((description) @injection.content
 (#match? @injection.content "(SELECT|WHERE|FROM|GROUP BY|ORDER BY)")
 (#set! injection.language "sql"))

; Inject YAML-like structure in multiline parameter descriptions
((parameter_description) @injection.content
 (#match? @injection.content "^\\s*[a-zA-Z_][a-zA-Z0-9_]*:\\s")
 (#set! injection.language "yaml"))

; Inject currency codes (ISO 4217)
((string_literal) @injection.content
 (#match? @injection.content "^[A-Z]{3}$")
 (#set! injection.language "currency"))

; Inject timezone identifiers
((string_literal) @injection.content
 (#match? @injection.content "^[A-Z]{3,4}$|^[A-Za-z]+/[A-Za-z_]+$")
 (#set! injection.language "timezone"))

; Inject mathematical expressions in default values
((default_value) @injection.content
 (#match? @injection.content "^[0-9+\\-*/().\\s]+$")
 (#set! injection.language "math"))

; Inject frequency patterns (1W, 1M, 3M, etc.)
((string_literal) @injection.content
 (#match? @injection.content "^[0-9]+[DWMY]$")
 (#set! injection.language "frequency"))

; Inject percentage values
((string_literal) @injection.content
 (#match? @injection.content "^[0-9]+\\.?[0-9]*%$")
 (#set! injection.language "percentage"))

; Inject comments as markdown documentation
((comment) @injection.content
 (#match? @injection.content "^#\\s*(TODO|FIXME|NOTE|WARNING)")
 (#set! injection.language "markdown"))

; Inject URL patterns in string literals
((string_literal) @injection.content
 (#match? @injection.content "^https?://")
 (#set! injection.language "url"))

; Inject balance sheet account patterns
((identifier) @injection.content
 (#match? @injection.content "^[0-9]{4,6}_[a-zA-Z_]+$")
 (#set! injection.language "account"))

; Inject configuration paths
((string_literal) @injection.content
 (#match? @injection.content "^[a-zA-Z_][a-zA-Z0-9_.]*\\.[a-zA-Z_][a-zA-Z0-9_]*$")
 (#set! injection.language "config_path"))
