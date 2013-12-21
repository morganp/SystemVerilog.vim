" Vim filetype plugin file
" Language:	SystemVerilog (superset extension of Verilog)
" Credits:
"   Originally created by 
"     Maintainer:  Amit Sethi <amitrajsethi@yahoo.com>
"     Last Change: Tue Jun 26 08:56:34 IST 2006
"     Version:     1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif


autocmd BufNewFile,BufRead *.v,*.vh    set ft=systemverilog
autocmd BufNewFile,BufRead *.f,*.v.*   set ft=systemverilog
autocmd BufNewFile,BufRead *.sv        set ft=systemverilog

