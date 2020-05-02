use std::env;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();
    Command::new(&args[1])
        .current_dir("/tmp")
        .args(&["-c", "printf '\\n%s\\n' \"$PWD\"; pwd; ls"])
        .spawn().ok();
}
