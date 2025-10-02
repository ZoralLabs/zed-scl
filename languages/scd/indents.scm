; Minimal working indents for SCD files
; Basic indentation rules that should work with most tree-sitter grammars

; Basic bracket-based indentation
("{" @indent)
("}" @outdent)
("[" @indent)
("]" @outdent)
("(" @indent)
(")" @outdent)

; Colon-based indentation for key-value pairs
(":" @indent)

; Basic structural elements
(object @indent)
(array @indent)
(block @indent)

; Parameter structures (if they exist)
(parameters @indent)
(parameter @indent)

; Configuration sections
(section @indent)

; Key-value pairs
(pair @indent)

; Multi-line strings
(string_literal @indent)

; Comments preserve existing indentation
(comment @indent)
