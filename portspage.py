#!/usr/bin/env python3


from cruxpy.portspage import page
import shutil

style="black"

p = page(style=style)
p.read_repo()
p.write()
p.write_style()
