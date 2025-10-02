use std::env;
use std::fs;
use std::path::Path;

fn main() {
    println!("cargo:rerun-if-changed=extension.toml");
    println!("cargo:rerun-if-changed=languages/");
    println!("cargo:rerun-if-changed=src/");

    // Ensure languages directory structure exists
    let out_dir = env::var("OUT_DIR").unwrap();
    let languages_dir = Path::new(&out_dir).join("languages");

    if !languages_dir.exists() {
        fs::create_dir_all(&languages_dir).unwrap();
    }

    // Copy language files to output directory
    copy_dir_all("languages", &languages_dir).unwrap();

    // Copy extension.toml to output directory
    let manifest_src = "extension.toml";
    let manifest_dst = Path::new(&out_dir).join("extension.toml");

    if Path::new(manifest_src).exists() {
        fs::copy(manifest_src, manifest_dst).unwrap();
    }

    println!("cargo:rustc-env=EXTENSION_DIR={}", out_dir);
}

fn copy_dir_all(src: impl AsRef<Path>, dst: impl AsRef<Path>) -> std::io::Result<()> {
    let src = src.as_ref();
    let dst = dst.as_ref();

    if !src.exists() {
        return Ok(());
    }

    fs::create_dir_all(dst)?;

    for entry in fs::read_dir(src)? {
        let entry = entry?;
        let ty = entry.file_type()?;
        let src_path = entry.path();
        let dst_path = dst.join(entry.file_name());

        if ty.is_dir() {
            copy_dir_all(&src_path, &dst_path)?;
        } else {
            fs::copy(&src_path, &dst_path)?;
        }
    }

    Ok(())
}
