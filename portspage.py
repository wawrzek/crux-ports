#!/usr/bin/env python3


from cruxpy.portspage import page
import shutil

style="black"

page = page(style=style)
page.write()
shutil.copy(f"../cruxpy/files/{style}.css", "./")
