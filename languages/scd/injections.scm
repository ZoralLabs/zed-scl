; Minimal working injections for SCD files
; Simple and safe injection patterns

; JSON injection for obvious JSON structures
((string_literal) @injection.content
 (#match? @injection.content "^\\s*[{\\[].*[}\\]]\\s*$")
 (#set! injection.language "json"))

; Simple email detection
((string_literal) @injection.content
 (#match? @injection.content "@")
 (#set! injection.language "text"))

; URL detection
((string_literal) @injection.content
 (#match? @injection.content "^https?://")
 (#set! injection.language "text"))

; Simple date patterns
((string_literal) @injection.content
 (#match? @injection.content "\\d{4}-\\d{2}-\\d{2}")
 (#set! injection.language "text"))
