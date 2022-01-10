#!/usr/bin/env perl
## latex commands
$latex            = "platex -synctex=1 -halt-on-error";
$latex_silent     = "platex -synctex=1 -halt-on-error -interaction=batchmode";
$uplatex          = "uplatex -synctex=1 -halt-on-error";
$xelatex          = "xelatex -synctex=1 -halt-on-error";
$lualatex         = "lualatex -synctex=1 -halt-on-error";

$bibtex           = "pbibtex -kanji=utf8";
$dvipdf           = "dvipdfmx %O -o %D %S";
$makeindex        = "mendex %O -o %D %S";
$max_repeat       = 5;

## pdf mode
$pdf_mode         = 3;

## output directory
$aux_dir          = "build/";
$out_dir          = "build/";
