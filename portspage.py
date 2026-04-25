#!/usr/bin/env python3


from cruxpy.portspage import page
import shutil

style="black"

page = page(style=style)
page.write()
page.write_style(style, "./")
