" Vim syntax file
" Language:	SystemVerilog (superset extension of Verilog)
" Credits:
"   Pulled updates from https://github.com/nickjones/verilog_systemverilog.vim
"
"   Originally created by 
"     Maintainer:   Amit Sethi <amitrajsethi@yahoo.com>
"     Last Update:  Thu Jul 27 12:54:08 IST 2006
"     Version:      1.1

" Extends Verilog syntax
" Requires $VIMRUNTIME/syntax/verilog.vim to exist

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


if version < 600
   set iskeyword=@,48-57,_,192-255
else
  setlocal iskeyword=@,48-57,_,192-255
endif

 "##########################################################
 " SystemVerilog Keywords
 "##########################################################


syn keyword verilogStatement   always and assign automatic buf
syn keyword verilogStatement   bufif0 bufif1 cell cmos
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable edge endconfig
syn keyword verilogStatement   endfunction endgenerate endmodule
syn keyword verilogStatement   endprimitive endspecify endtable endtask
syn keyword verilogStatement   event force function
syn keyword verilogStatement   generate genvar highz0 highz1 ifnone
syn keyword verilogStatement   incdir include initial inout input
syn keyword verilogStatement   instance integer large liblist
syn keyword verilogStatement   library localparam macromodule medium
syn keyword verilogStatement   module nand negedge nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1 or
syn keyword verilogStatement   output parameter pmos posedge primitive
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   rcmos real realtime reg release
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled signed small
syn keyword verilogStatement   specify specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table task time tran
syn keyword verilogStatement   tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogStatement   trior trireg unsigned use vectored wait
syn keyword verilogStatement   wand weak0 weak1 wire wor xnor xor
syn keyword verilogLabel       begin end fork join
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,@Spell
syn match   verilogComment "//.*" contains=verilogTodo,@Spell

"syn match   verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match verilogGlobal "`celldefine"
syn match verilogGlobal "`default_nettype"
syn match verilogGlobal "`define"
syn match verilogGlobal "`else"
syn match verilogGlobal "`elsif"
syn match verilogGlobal "`endcelldefine"
syn match verilogGlobal "`endif"
syn match verilogGlobal "`ifdef"
syn match verilogGlobal "`ifndef"
syn match verilogGlobal "`include"
syn match verilogGlobal "`line"
syn match verilogGlobal "`nounconnected_drive"
syn match verilogGlobal "`resetall"
syn match verilogGlobal "`timescale"
syn match verilogGlobal "`unconnected_drive"
syn match verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
   if version < 508
      let did_verilog_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink verilogCharacter       Character
   HiLink verilogConditional     Conditional
   HiLink verilogRepeat		 Repeat
   HiLink verilogString		 String
   HiLink verilogTodo		 Todo
   HiLink verilogComment	 Comment
   HiLink verilogConstant	 Constant
   HiLink verilogLabel		 Label
   HiLink verilogNumber		 Number
   HiLink verilogOperator	 Special
   HiLink verilogStatement	 Statement
   HiLink verilogGlobal		 Define
   HiLink verilogDirective	 SpecialComment
   HiLink verilogEscape		 Special

   delcommand HiLink
endif



"##########################################################
"       SystemVerilog Syntax
"##########################################################

syn keyword verilogStatement   always_comb always_ff always_latch
syn keyword verilogStatement   class endclass
syn keyword verilogStatement   virtual local const protected
syn keyword verilogStatement   package endpackage
syn keyword verilogStatement   rand randc constraint randomize
syn keyword verilogStatement   with inside dist
syn keyword verilogStatement   randcase
syn keyword verilogStatement   sequence endsequence randsequence 
syn keyword verilogStatement   get_randstate set_randstate
syn keyword verilogStatement   srandom
syn keyword verilogStatement   logic bit byte time
syn keyword verilogStatement   int longint shortint
syn keyword verilogStatement   struct packed
syn keyword verilogStatement   final
syn keyword verilogStatement   import export
syn keyword verilogStatement   context pure 
syn keyword verilogStatement   void shortreal chandle string
syn keyword verilogStatement   clocking endclocking
syn keyword verilogStatement   interface endinterface modport
syn keyword verilogStatement   cover covergroup coverpoint endgroup
syn keyword verilogStatement   property endproperty
syn keyword verilogStatement   program endprogram
syn keyword verilogStatement   bins binsof illegal_bins ignore_bins
syn keyword verilogStatement   alias matches solve static assert
syn keyword verilogStatement   assume super before expect bind
syn keyword verilogStatement   extends null tagged extern this
syn keyword verilogStatement   first_match throughout timeprecision
syn keyword verilogStatement   timeunit priority type union unique
syn keyword verilogStatement   uwire var cross ref wait_order intersect
syn keyword verilogStatement   wildcard within
syn keyword verilogStatement   semaphore triggered
syn keyword verilogStatement   std
syn keyword verilogStatement   new

syn keyword verilogTypeDef     typedef enum

syn keyword verilogConditional iff

syn keyword verilogRepeat      return break continue
syn keyword verilogRepeat      do while foreach

syn keyword verilogLabel       join_any join_none forkjoin

syn match   verilogGlobal      "`begin_\w\+"
syn match   verilogGlobal      "`end_\w\+"
syn match   verilogGlobal      "`remove_\w\+"
syn match   verilogGlobal      "`restore_\w\+"

syn match   verilogGlobal      "`[a-zA-Z0-9_]\+\>"

syn match   verilogNumber      "\<[0-9][0-9_\.]\=\([fpnum]\|\)s\>"
syn match   verilogNumber      "\<[0-9][0-9_\.]\=step\>"

syn match  verilogMethod       "\.atobin"
syn match  verilogMethod       "\.atohex\>"
syn match  verilogMethod       "\.atoi\>"
syn match  verilogMethod       "\.atooct\>"
syn match  verilogMethod       "\.atoreal\>"
syn match  verilogMethod       "\.bintoa\>"
syn match  verilogMethod       "\.hextoa\>"
syn match  verilogMethod       "\.itoa\>"
syn match  verilogMethod       "\.octtoa\>"
syn match  verilogMethod       "\.realtoa\>"
syn match  verilogMethod       "\.len\>"
syn match  verilogMethod       "\.getc\>"
syn match  verilogMethod       "\.putc\>"
syn match  verilogMethod       "\.toupper\>"
syn match  verilogMethod       "\.tolower\>"
syn match  verilogMethod       "\.compare\>"
syn match  verilogMethod       "\.icompare\>"
syn match  verilogMethod       "\.substr\>"
syn match  verilogMethod       "\.num\>"
syn match  verilogMethod       "\.exists\>"
syn match  verilogMethod       "\.first\>"
syn match  verilogMethod       "\.last\>"
syn match  verilogMethod       "\.name\>"
syn match  verilogMethod       "\.index\>"
syn match  verilogMethod       "\.find\>"
syn match  verilogMethod       "\.find_first\>"
syn match  verilogMethod       "\.find_last\>"
syn match  verilogMethod       "\.find_index\>"
syn match  verilogMethod       "\.find_first_index\>"
syn match  verilogMethod       "\.find_last_index\>"
syn match  verilogMethod       "\.min\>"
syn match  verilogMethod       "\.max\>"
syn match  verilogMethod       "\.unique\>"
syn match  verilogMethod       "\.unique_index\>"
syn match  verilogMethod       "\.sort\>"
syn match  verilogMethod       "\.rsort\>"
syn match  verilogMethod       "\.shuffle\>"
syn match  verilogMethod       "\.reverse\>"
syn match  verilogMethod       "\.sum\>"
syn match  verilogMethod       "\.product\>"
syn match  verilogMethod       "\.xor\>"
syn match  verilogMethod       "\.status\>"
syn match  verilogMethod       "\.kill\>"
syn match  verilogMethod       "\.self\>"
syn match  verilogMethod       "\.await\>"
syn match  verilogMethod       "\.suspend\>"
syn match  verilogMethod       "\.resume\>"
syn match  verilogMethod       "\.get\>"
syn match  verilogMethod       "\.put\>"
syn match  verilogMethod       "\.peek\>"
syn match  verilogMethod       "\.try_get\>"
syn match  verilogMethod       "\.try_peek\>"
syn match  verilogMethod       "\.try_put\>"
syn match  verilogMethod       "\.data\>"
syn match  verilogMethod       "\.eq\>"
syn match  verilogMethod       "\.neq\>"
syn match  verilogMethod       "\.next\>"
syn match  verilogMethod       "\.prev\>"
syn match  verilogMethod       "\.new\>"
syn match  verilogMethod       "\.size\>"
syn match  verilogMethod       "\.delete\>"
syn match  verilogMethod       "\.empty\>"
syn match  verilogMethod       "\.pop_front\>"
syn match  verilogMethod       "\.pop_back\>"
syn match  verilogMethod       "\.push_front\>"
syn match  verilogMethod       "\.push_back\>"
syn match  verilogMethod       "\.front\>"
syn match  verilogMethod       "\.back\>"
syn match  verilogMethod       "\.insert\>"
syn match  verilogMethod       "\.insert_range\>"
syn match  verilogMethod       "\.erase\>"
syn match  verilogMethod       "\.erase_range\>"
syn match  verilogMethod       "\.set\>"
syn match  verilogMethod       "\.swap\>"
syn match  verilogMethod       "\.clear\>"
syn match  verilogMethod       "\.purge\>"
syn match  verilogMethod       "\.start\>"
syn match  verilogMethod       "\.finish\>"

syn match   verilogAssertion   "\<\w\+\>\s*:\s*\<assert\>\_.\{-});"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
  if version < 508
    let did_verilog_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlighting.
  HiLink verilogMethod          Function
  HiLink verilogTypeDef         TypeDef
  HiLink verilogAssertion       Include

  delcommand HiLink
endif

let b:current_syntax = "verilog_systemverilog"

" vim: ts=8
