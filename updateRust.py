#!/usr/bin/python
import os
output = os.popen('curl -s https://static.rust-lang.org/dist/channel-rust-nightly.toml | grep rls').read()
if output:
    os.system('rustup update')
    # run only once to install rls
    # os.system('rustup component add rls-preview --toolchain nightly')
    