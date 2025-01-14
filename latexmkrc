
$pdf_mode = 5; # xelatex

$xelatex = "xelatex -file-line-error -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -E -o %D %O %S";

$recorder = 1;

$bibtex_use = 1.5; # tex -> pdf

$clean_ext = "loc soc synctex.gz synctex";

# JL <yhlaozero2@163.com>