# useful-stuff

## Images to pdf
* Install image magick
* Convert all images into a single pdf
```bash
convert "*.jpg" -background white -page a4 -quality 100 output.pdf
```
* Check file size
```bash
ls -l --block-size=M
```
* Compress with ps2pdf
```bash
ps2pdf -dPDFSETTINGS=/ebook mietvertrag.pdf mietvertrag_compressed.pdf
```
