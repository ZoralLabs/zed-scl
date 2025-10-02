# SCL/SCD Language Support for Zed

This extension adds comprehensive support for SCL (Smart Contract Language) and SCD (Smart Contract Definition) languages to the [Zed editor](https://zed.dev/).

## Features

- **Syntax Highlighting**: Full syntax highlighting for both SCL and SCD files
- **Language Server Integration**: Support for `scl-lsp` language server providing:
    - Code completion
    - Error diagnostics
    - Go to definition
    - Hover information
    - Symbol search
- **Code Folding**: Intelligent folding for functions, blocks, and configuration sections
- **Auto-completion**: Smart bracket matching and auto-closing pairs
- **Code Navigation**: Outline view and symbol navigation
- **Comments**: Support for line comments (`//` in SCL, `#` in SCD) and block comments (`/* */` in SCL)

## File Types

This extension supports two related but distinct languages:

### SCL Files (`.scl`)

Smart Contract Logic files containing executable code with:

- Function definitions
- Control flow statements (if/else, while, for)
- Variable declarations and assignments
- Built-in functions for financial operations
- Import statements

### SCD Files (`.scd`)

Smart Contract Definition files containing configuration and metadata:

- Package definitions (`package.scd`)
- Parameter declarations with types and constraints
- Configuration sections (core, constants, balances, interest)
- Metadata (id, name, description, author, etc.)

## Configuration

The extension works out of the box with default settings. You can customize behavior in Zed's settings:

```json
{
    "languages": {
        "SCL": {
            "tab_size": 4,
            "hard_tabs": false,
            "format_on_save": true
        },
        "SCD": {
            "tab_size": 4,
            "hard_tabs": false,
            "format_on_save": true
        }
    },
    "lsp": {
        "scl-lsp": {
            "settings": {
                "validate": true,
                "completion": true
            }
        }
    }
}
```

## Tree-sitter Grammars

This extension uses official tree-sitter grammars:

- **SCL Grammar**: [tree-sitter-scl](https://github.com/ZoralLabs/tree-sitter-scl)
- **SCD Grammar**: [tree-sitter-scd](https://github.com/ZoralLabs/tree-sitter-scd)

## License

This extension is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for details.
