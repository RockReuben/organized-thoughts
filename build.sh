#!/bin/sh
# blogs/*.md -> blogs/*.html, then list every post in posts.txt (newest first)
for f in blogs/*.md; do
  [ -e "$f" ] && pandoc -s -M document-css=false --css=../style.css -B nav.html \
    --metadata pagetitle="$(basename "$f" .md | tr '_-' '  ')" "$f" -o "${f%.md}.html"
done
ls -r blogs | grep '\.html$' > posts.txt
