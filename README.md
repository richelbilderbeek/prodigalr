# prodigalr

Branch   |[![Travis CI logo](man/figures/TravisCI.png)](https://travis-ci.org)                                                                    |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|----------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |[![Build Status](https://travis-ci.org/richelbilderbeek/prodigalr.svg?branch=master)](https://travis-ci.org/richelbilderbeek/prodigalr) |[![codecov.io](https://codecov.io/github/richelbilderbeek/prodigalr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/prodigalr/branch/master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/prodigalr.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/prodigalr)|[![codecov.io](https://codecov.io/github/richelbilderbeek/prodigalr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/prodigalr/branch/develop)

[Prodigal](https://github.com/hyattpd/Prodigal) for R,
for gene prediction.

## Prodigal help

```
-------------------------------------
PRODIGAL v2.6.3 [February, 2016]         
Univ of Tenn / Oak Ridge National Lab
Doug Hyatt, Loren Hauser, et al.     
-------------------------------------

Usage:  prodigal [-a trans_file] [-c] [-d nuc_file] [-f output_type]
                 [-g tr_table] [-h] [-i input_file] [-m] [-n] [-o output_file]
                 [-p mode] [-q] [-s start_file] [-t training_file] [-v]

         -a:  Write protein translations to the selected file.
         -c:  Closed ends.  Do not allow genes to run off edges.
         -d:  Write nucleotide sequences of genes to the selected file.
         -f:  Select output format (gbk, gff, or sco).  Default is gbk.
         -g:  Specify a translation table to use (default 11).
         -h:  Print help menu and exit.
         -i:  Specify FASTA/Genbank input file (default reads from stdin).
         -m:  Treat runs of N as masked sequence; don't build genes across them.
         -n:  Bypass Shine-Dalgarno trainer and force a full motif scan.
         -o:  Specify output file (default writes to stdout).
         -p:  Select procedure (single or meta).  Default is single.
         -q:  Run quietly (suppress normal stderr output).
         -s:  Write all potential genes (with scores) to the selected file.
         -t:  Write a training file (if none exists); otherwise, read and use
              the specified training file.
         -v:  Print version number and exit.
```

## Links

 * [Prodigal homepage](https://github.com/hyattpd/Prodigal)
