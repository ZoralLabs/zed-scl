; Use INDENT/DEDENT tokens for indentation control
(INDENT) @indent
(DEDENT) @outdent

; Increase indent inside flow mappings
(flow_mapping
  (flow_mapping_content) @indent)

; Increase indent inside flow sequences
(flow_sequence
  (flow_sequence_content) @indent)

; Dedent closing brackets for flow structures
("}" @outdent)
("]" @outdent)

; Zero indent for document markers
(document_start) @outdent
(document_end) @outdent

; Indent after colons in block mappings (for inline values)
(block_mapping_pair
  ":"
  value: (_) @indent)

; Indent after dashes in block sequences (for inline values)
(block_sequence_item
  "-"
  (_) @indent)
