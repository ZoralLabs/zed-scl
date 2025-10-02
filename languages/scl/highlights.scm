; Keywords
[
  "if"
  "else"
  "while"
  "for"
  "return"
  "break"
  "continue"
  "import"
  "export"
  "let"
  "const"
  "var"
  "function"
  "class"
  "struct"
  "enum"
  "interface"
  "type"
  "new"
  "delete"
  "try"
  "catch"
  "finally"
  "throw"
  "true"
  "false"
  "null"
  "undefined"
  "void"
] @keyword

; Control flow
[
  "if"
  "else"
  "while"
  "for"
  "return"
  "break"
  "continue"
  "match"
  "case"
  "default"
] @keyword.control

; Import/export
[
  "import"
  "export"
  "from"
  "as"
] @keyword.import

; Storage modifiers
[
  "let"
  "const"
  "var"
  "static"
  "final"
  "readonly"
] @keyword.storage

; Types
[
  "bool"
  "int"
  "float"
  "string"
  "char"
  "decimal"
  "date"
  "datetime"
  "time"
  "currency"
  "ledger"
  "balance_id"
  "transaction_type"
  "posting_type"
  "enum"
  "dated_rate"
  "integer"
] @type.builtin

; Functions
(function_definition
  name: (identifier) @function)

(function_call
  name: (identifier) @function)

; Variables and identifiers
(identifier) @variable

; Parameters
(parameter
  name: (identifier) @variable.parameter)

; Constants
(boolean_literal) @constant.builtin
(null_literal) @constant.builtin

; Numbers
(integer_literal) @number
(float_literal) @number
(decimal_literal) @number

; Strings
(string_literal) @string
(string_interpolation) @string.special

; Comments
(line_comment) @comment
(block_comment) @comment

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "&"
  "|"
  "^"
  "<<"
  ">>"
  "+="
  "-="
  "*="
  "/="
  "%="
] @operator

; Punctuation
[
  ";"
  ":"
  ","
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Special SCL constructs
(schedule_event) @function.builtin
(new_transaction) @function.builtin
(new_posting) @function.builtin
(set_parameter) @function.builtin
(reject) @function.builtin
(deactivate) @function.builtin

; Field access
(field_expression
  field: (identifier) @property)

; Method calls
(method_call
  method: (identifier) @method)

; Attributes/annotations
(attribute) @attribute

; Error handling
(error_literal) @constant.builtin

; Special variables (SCL specific)
[
  "$effective_time"
  "$term_type"
  "$installment_demand_date"
  "$installment_demand_day"
  "$interest_book_frequency"
  "$interest_book_date"
  "$interest_book_day"
  "$debit_interest_accrual_balance"
  "$interest_transaction_type"
  "$interest_receivable_balance_id"
  "$interest_earned_balance_id"
  "$interest_posting_type"
  "$debit_interest_booked_balance_id"
  "$primary_is_zero"
  "$arrears_principle_is_zero"
  "$arrears_interest_is_zero"
  "$debit_interest_booked_is_zero"
  "$penal_interest_accrual_is_zero"
  "$ledger"
  "$currency_code"
  "$loan_amount"
  "$loan_period"
] @variable.builtin

; Built-in functions
[
  "min"
  "max"
  "abs"
  "round"
  "floor"
  "ceil"
  "date_str"
  "times"
] @function.builtin
