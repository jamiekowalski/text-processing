# rtf2md

Worried by the direction Apple's Pages is taking? Have Pages files that you'd like to convert to Markdown for safe-keeping? Do those files contain footnotes?

A collection of three scripts that help convert a Pages '09 file to Markdown (once the Pages file has been exported to RTF), adding support for footnotes.

Dependencies: `textutil` (built into Mac OS X), [pandoc](http://johnmacfarlane.net/pandoc/) (1.10 or later).

The bash script runs the RTF file through `textutil` (to get HTML), a Ruby script (`post_html.rb`) to modify the footnotes as represented in the HTML file, `pandoc` to get Markdown, and another Ruby script (`post_md.rb`) to correctly format the footnotes.

Note that lists are not converted correctly by pandoc.

Before using the bash script, modify the paths to point to the locations of the Ruby scripts.
