use zed::lsp::CompletionKind;
use zed::{CodeLabel, CodeLabelSpan, LanguageServerId};
use zed_extension_api::{self as zed, Result};

struct SclExtension {
    cached_binary_path: Option<String>,
}

impl zed::Extension for SclExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let binary_path = if let Some(path) = &self.cached_binary_path {
            path.clone()
        } else if let Some(path) = worktree.which("scl-lsp") {
            self.cached_binary_path = Some(path.clone());
            path
        } else {
            return Err("scl-lsp must be installed and available in your PATH. Please install scl-lsp language server.".to_string());
        };

        Ok(zed::Command {
            command: binary_path,
            args: vec![],
            env: Default::default(),
        })
    }

    fn label_for_completion(
        &self,
        _language_server_id: &LanguageServerId,
        completion: zed::lsp::Completion,
    ) -> Option<zed::CodeLabel> {
        match completion.kind? {
            CompletionKind::Function | CompletionKind::Method => {
                let highlight_name = match completion.kind? {
                    CompletionKind::Function => "function",
                    CompletionKind::Method => "method",
                    _ => return None,
                };

                let len = completion.label.len();
                let name_span = CodeLabelSpan::literal(
                    completion.label.clone(),
                    Some(highlight_name.to_string()),
                );

                Some(CodeLabel {
                    code: completion.label,
                    spans: vec![name_span],
                    filter_range: (0..len).into(),
                })
            }
            CompletionKind::Variable => {
                let len = completion.label.len();
                let name_span =
                    CodeLabelSpan::literal(completion.label.clone(), Some("variable".to_string()));

                Some(CodeLabel {
                    code: completion.label,
                    spans: vec![name_span],
                    filter_range: (0..len).into(),
                })
            }
            CompletionKind::Keyword => {
                let len = completion.label.len();
                let name_span =
                    CodeLabelSpan::literal(completion.label.clone(), Some("keyword".to_string()));

                Some(CodeLabel {
                    code: completion.label,
                    spans: vec![name_span],
                    filter_range: (0..len).into(),
                })
            }
            _ => None,
        }
    }
}

zed::register_extension!(SclExtension);
