; Minimal working outline for SCD files
; Basic outline patterns that should work with most tree-sitter grammars

; Basic structural elements
(object @item)
(array @item)
(block @item)
(section @item)

; Parameter structures
(parameters @item)
(parameter @item)

; Key-value pairs
(pair @item)

; Configuration entries
(config @item)

; Comments that might serve as headers
(comment @item)

; Identifiers that might be important
(identifier @item)

; String literals that might be names
(string @item)
(string_literal @item)

; Package and module definitions (if they exist)
(package @item)
(module @item)

; Type definitions (if they exist)
(type @item)

; Function definitions (if they exist)
(function @item)

; Variable definitions (if they exist)
(variable @item)

; Constants (if they exist)
(constant @item)
