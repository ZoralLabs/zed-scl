; SCD-specific content injections
; Detects and highlights embedded content types within SCD files

; JSON content in string values (common for complex parameter configurations)
((string) @injection.content
 (#match? @injection.content "^\\s*[{\\[].*[}\\]]\\s*$")
 (#set! injection.language "json"))

((double_quoted_string) @injection.content
 (#match? @injection.content "^\"\\s*[{\\[].*[}\\]]\\s*\"$")
 (#set! injection.language "json"))

; SQL queries (sometimes embedded in SCD for ledger operations)
((string) @injection.content
 (#match? @injection.content "(?i)^\\s*(select|insert|update|delete|with)\\b.*")
 (#set! injection.language "sql"))

((double_quoted_string) @injection.content
 (#match? @injection.content "\"\\s*(?i)(select|insert|update|delete|with)\\b.*\"")
 (#set! injection.language "sql"))

; Regular expressions (used in validation patterns)
((string) @injection.content
 (#match? @injection.content "^\\^.*\\$$")
 (#set! injection.language "regex"))

((string) @injection.content
 (#match? @injection.content "^/.*/$")
 (#set! injection.language "regex"))

; Email addresses (common in author fields)
((string) @injection.content
 (#match? @injection.content "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")
 (#set! injection.language "text"))

; URLs (documentation links, API endpoints)
((string) @injection.content
 (#match? @injection.content "^https?://")
 (#set! injection.language "text"))

; ISO dates (date_time fields)
((string) @injection.content
 (#match? @injection.content "^\\d{4}-\\d{2}-\\d{2}(T\\d{2}:\\d{2}:\\d{2}(\\.\\d{3})?Z?)?$")
 (#set! injection.language "text"))

; Currency codes (ISO 4217)
((string) @injection.content
 (#match? @injection.content "^[A-Z]{3}$")
 (#set! injection.language "text"))

; Mathematical expressions (for calculation formulas)
((string) @injection.content
 (#match? @injection.content ".*[+\\-*/()=].*\\d+.*")
 (#set! injection.language "text"))

; Version numbers (semantic versioning)
((string) @injection.content
 (#match? @injection.content "^\\d+\\.\\d+\\.\\d+")
 (#set! injection.language "text"))

; YAML front matter or embedded YAML (rare but possible)
((string) @injection.content
 (#match? @injection.content "^---\\n.*\\n---$")
 (#set! injection.language "yaml"))
