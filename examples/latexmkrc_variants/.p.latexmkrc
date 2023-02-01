#!/usr/bin/env perl

$latex = 'platex %O -synctex=1 -interaction=nonstopmode %S';

$bibtex = 'bibtex %O %B';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$makeindex = 'upmendex %O -o %D %S';

$pdf_mode = 3;

$aux_dir = "build/";
$out_dir = "build/";
