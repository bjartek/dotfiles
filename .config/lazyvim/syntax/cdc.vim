" Vim syntax file
" Language: Cadence
" Maintainer: Cian911
" Latest Revision: 22 August 2021

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword celBlockCmd         access all import contract return init size event interface struct pub priv
syn keyword celBlockSelf        self
syn keyword celBlockVar         let var nextgroup=celVarStr skipwhite
syn keyword celBlockFun         fun
syn keyword celBlockVariables   true false nil
syn keyword celBlockCmd         for emit execute resource create do while if do destroy pre post prepare transaction from

" Types
syn keyword celBlockInt         Int Int8 Int16 Int32 Int64 Int128 Int256
syn keyword celBlockUInt        UInt UInt8 UInt16 UInt32 UInt64 UInt128 UInt256
syn keyword celBlockWord        Word Word8 Word16 Word32 Word64
syn keyword celBlockString      String
syn keyword celBlockBool        Bool
syn keyword celBlockCharacter   Character
syn keyword celBlockFixedPoint  Fix64 UFix64
syn keyword celBlockAddresse    Address
syn keyword celBlockStruct      AnyStruct
syn keyword celBlockResource    AnyResource
syn keyword celBlockNever       Never
syn keyword celBlockVoid        Void
syn keyword celBlockVault       Vault

" Comments
syn match celComment    "//.*$"
syn match multiComment  "\*.*?\*" contained

" Numbers
syn match celNumber "\v0[x\da-fA-FA-Z]+" display
syn match celNumber "<=>\|<=\|<-\|<\|>\|>=\|[-=]\@1<!>" display
syn match celNumber "\%(\w\|[^\x00-\x7F]\)\@1<!?\|:" display
syn match celNumber "[~^|]\|&\.\@!\|<<\|>>" display
syn match celNumber "\%(\w\|[^\x00-\x7F]\)\@1<!!\|&&\|||" display
syn match celNumber "=>\@!\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|||=\||=\|%=\|+=\|>>=\|<<=\|\^=" display
syn match celNumber "\%(\%(\w\|[^\x00-\x7F]\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*r\=i\=\>"							       display
syn match celNumber "\%(\%(\w\|[^\x00-\x7F]\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)r\=i\=\>"	 display
syn match celNumber "\%(\%(\w\|[^\x00-\x7F]\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*r\=i\=\>"							     display
syn match celNumber "\%(\%(\w\|[^\x00-\x7F]\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*r\=i\=\>"

" Brackets
syn match celOpenFunctionBrace  "\v\(" display
syn match celCloseFunctionBrace "\v\)" display

" Operators
syn match celDot          "[.]" display
syn match celColon        "[:]" display
syn match celExclamation  "[!]" display

" Strings
syn match celVarStr "\S+" 
syn match celVar    "\s\S+[a-zA-Z]" 

" Regions
syn region celString start='"' end='"' contained
syn region celMultiLineComment start="\/\*" end="\*\/" contains=multiComment
syn region celDesc start='"' end='"'

let b:current_syntax = "cel"

" Keywords
hi def link celBlockCmd         Statement
hi def link celBlockSelf        Type
hi def link celBlockVar         Type
hi def link celBlockFun         Type
hi def link celBlockVariables   Type
" Types
hi def link celString           Special
hi def link celBlockInt         Special
hi def link celBlockUInt        Special
hi def link celBlockWord        Special
hi def link celBlockString      Special
hi def link celBlockBool        Special
hi def link celBlockCharacter   Special
hi def link celBlockFixedPoint  Special
hi def link celBlockAddresse    Special
hi def link celBlockStruct      Special
hi def link celBlockResource    Special
hi def link celBlockNever       Special
hi def link celBlockVoid        Special

" Comments
hi def link celComment Comment
hi def link celMultiLineComment Comment

" Numbers
hi def link celNumber Number

" Brackets
hi def link celOpenFunctionBrace Statement
hi def link celCloseFunctionBrace Statement

" Operators
hi def link celDot Type
hi def link celColon Type
hi def link celExclamation Constant

" Strings
hi def link celDesc PreProc
