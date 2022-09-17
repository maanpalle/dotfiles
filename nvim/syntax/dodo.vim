" Vim syntax file
" Language: Dodo

if exists("b:current syntax")
	finish
endif

syn keyword dodoKeywords return fn if else while let struct noreturn as const extern defer
syn keyword dodoTypes void bool i8 i16 i32 i64 u8 u16 u32 u64 
syn match dodoComment "//.*$"

syn match dodoDecNumber display   "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syn match dodoHexNumber display "\v<0x\x%(_?\x)*%(\.\.@!)?%(\x%(_?\x)*)?%([pP][+-]?\d%(_?\d)*)?"
syn match dodoOctNumber display "\v<0o\o%(_?\o)*"
syn match dodoBinNumber display "\v<0b[01]%(_?[01])*"

syn match dodoAnnotation display "@[a-zA-Z]*\(*\)" "@[a-zA-Z]"

syn region dodoString start='"' end='"'

syn match dodoChar '\'.\''
syn match dodoChar '\'\\n\''

syn keyword dodoConstants true false

let b:current_syntax = "dodo"

hi def link dodoKeywords Statement
hi def link dodoTypes Type
hi def link dodoComment Comment
hi def link dodoDecNumber Constant
hi def link dodoBinNumber Constant
hi def link dodoOctNumber Constant
hi def link dodoHexNumber Constant
hi def link dodoString Constant
hi def link dodoChar Constant
hi def link dodoConstants Constant
hi def link dodoAttrib Function
hi def link dodoAnnotation PreProc
