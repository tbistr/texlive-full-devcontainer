#!/usr/bin/env perl

$latex = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';

$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex %O %B';
$makeindex = 'mendex %O -o %D %S';
$max_repeat = 5;

$pdf_mode = 4;

$aux_dir = 'build/';
$out_dir = 'build/';
