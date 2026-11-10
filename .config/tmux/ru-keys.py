#!/usr/bin/env python3
# Mirrors tmux bindings onto the same physical keys of the "Russian - PC" layout.
# Only non-ASCII targets: ASCII ones (; , . from shifted keys) would clobber latin bindings.
import re
import subprocess

LAT = "qwertyuiop[]asdfghjkl;'zxcvbnm,.`QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>~#"
RUS = "йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ№"
MAP = dict(zip(LAT, RUS))
TABLES = ["prefix", "copy-mode-vi", "copy-obj-i", "copy-obj-a"]
LINE = re.compile(r"^bind-key\s+((?:-\S+\s+)*?)-T\s+(\S+)\s+(\S+)\s+(.*)$")
KEY = re.compile(r"^((?:[CMS]-)*)(\\?)(.)$")

out = []
for table in TABLES:
    listing = subprocess.run(["tmux", "list-keys", "-T", table], capture_output=True, text=True).stdout
    for line in listing.splitlines():
        m = LINE.match(line)
        k = m and KEY.match(m.group(3))
        if k and k.group(3) in MAP:
            out.append(f"bind-key {m.group(1)}-T {m.group(2)} {k.group(1)}{MAP[k.group(3)]} {m.group(4)}")

subprocess.run(["tmux", "source-file", "-"], input="\n".join(out) + "\n", text=True, check=True)
