mkdir pdfs/
for file in *.md; do
    output_file="pdfs/$(basename $file .md).pdf"
    pandoc --biblatex --filter pandoc-citeproc --output=$output_file --bibliography=sources.bib $file
done
