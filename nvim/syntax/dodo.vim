" Vim syntax file
" Language: Dodo

if exists("b:current syntax")
	finish
endif

syn keyword dynoKeywords return fn if else while let struct noreturn
syn keyword dynoTypes void bool i8 i16 i32 i64 u8 u16 u32 u64 
syn match dynoComment "//.*$"

syn match dynoDecimalInt "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
syn match dynoHexadecimalInt "\<-\=0[xX]_\?\(\x\+_\?\)\+\>"

syn region dynoString start='"' end='"'

syn match dynoChar '\'.\''
syn match dynoChar '\'\\n\''

syn keyword dynoConstants true false

let b:current_syntax = "dyno"

hi def link dynoKeywords Statement
hi def link dynoTypes Type
hi def link dynoComment Comment
hi def link dynoDecimalInt Constant
hi def link dynoHexadecimalInt Constant
hi def link dynoString Constant
hi def link dynoChar Constant
hi def link dynoConstants Constant
hi def link dynoMeta Function
hi def link dynoMetaFunc Function
hi def link dynoAttrib Function
