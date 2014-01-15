#!/bin/bash

# Dependencies: textutil, pandoc 1.10 or later
# Before using, modify the paths

# Convenience script. Takes RTF files as command-line arguments and:
# 1. Converts them to HTML (using textutil)
# 2. Runs HTML through post_html.rb
# 3. Converts them to Markdown
# 4. Runs Markdown through post_md.rb
# 5. Saves files with extension .md

for f in "$@"
do
	filename_noext=${f%.rtf}
	textutil "$f" -convert html -stdout | ~/scripts/text-processing/rtf2md/post_html.rb | /usr/local/bin/pandoc --no-wrap -f html -t markdown_strict | ~/scripts/text-processing/rtf2md/post_md.rb > "${filename_noext}".md
done
