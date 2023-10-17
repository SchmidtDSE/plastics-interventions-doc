mkdir pdfs/
for file in *.md; do
    output_file="pdfs/$(basename $file .md).pdf"
    docker run --volume $PWD:/data pandoc/latex:2.9 --output=/data/$output_file /data/$file
done