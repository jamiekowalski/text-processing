#!/usr/bin/ruby -w
# encoding: utf-8

# This script is used in converting a Pages file that has footnotes to Markdown
# Pages file must first be exported to RTF, then to HTML (for example, using
# textutil), then processed with post_html.rb, then converted to Markdown using
# pandoc or similar

puts STDIN.read.gsub(/\{\\?(\^fn\d+)}/, '[\1]').
    gsub(/\n +\n/, "\n\n").            # remove returns + spaces generated by pandoc
    gsub(/\n\n+/, "\n\n")              # reduce multiple line returns
