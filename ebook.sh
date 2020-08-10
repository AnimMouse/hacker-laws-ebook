#!/usr/bin/env bash
# commit abd0df9699e8ac17441ae00559c25b8f7fd50dc8
# This script is taken from the asset folder of hacker-laws

# Create the frontmatter.
cat << EOF > frontmatter.md
---
title: "Hacker Laws"
author: "Dave Kerr, github.com/dwmkerr/hacker-laws"
subtitle: "Laws, Theories, Principles and Patterns that developers will find useful."
---
EOF

# Combine the frontmatter and the laws.
cat frontmatter.md README.md >> hacker-laws.md

# Remove the title - we have it in the front-matter of the doc, so it will
# automatically be added to the PDF.
sed -i '/💻📖.*/d' hacker-laws.md

# We can't have emojis in the final content with the PDF generator we're using.
sed -i 's/❗/Warning/' hacker-laws.md

# Now rip out the translations line.
sed -i '/^\[Translations.*/d' hacker-laws.md

# # Now rip out any table of contents items.
sed -i '/\*.*/d' hacker-laws.md
sed -i '/    \*.*/d' hacker-laws.md

# Delete everything from 'Translations' onwards (we don't need the translations
# lists, related projects, etc).
sed -i '/## Translations/,$d' hacker-laws.md