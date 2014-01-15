#!/usr/bin/ruby -w
# encoding: utf-8

# This script is used in converting a Pages '09 file that has footnotes to Markdown
# Pages file must first be exported to RTF, then to HTML (for example, using
# textutil)

# /\super 0E/       # If converting from RTF (0E is unicode for Shift Out)
# /\super \d+/      # this is how footnotes are represented (RTF exported from Pages)

ref_regex = /<sup><\/sup>/
note_regex = /<span class=".{0,4}"><sup>\d+<\/sup><\/span><span class=".{0,4}">\s*(.+?)<\/span>/

text = STDIN.read

count = 0;
text.scan(ref_regex) {
    count += 1
}
if count < 100        # could use log to calculate this, but it's not necessary
    digits = 2
elsif count < 1000
    digits = 3
else
    digits = 4
end

i = 1
text.gsub!(ref_regex) { |s|    # footnote references
    ref = %({^fn#{("%0" + digits.to_s + "d") % i}})
    i += 1
    next ref
}
i = 1
text.gsub!(note_regex) { |s|  # footnote text
    ref = %(</p><p>{^fn#{("%0" + digits.to_s + "d") % i}}: #{$1})
    i += 1
    next ref
}
puts text
