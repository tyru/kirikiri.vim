
if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif



syn case match


syn match kirikiriLineComment ";.*"
syn match kirikiriLabel       "^\*\S\+"


syn match kirikiriCommandLine "^\t*\zs@.*$" contains=kirikiriCommandTagName,kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue
syn region kirikiriCommandTag        start="\[" end="\]" contains=kirikiriCommandTagName,kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue

" TODO: Use syn-keyword
" TODO: If installed syntax/tjs.vim, Use syn-include for "iscript".
" Or ignore it.
syn match kirikiriCommandTagName  "\%(@\|\[\)\zs\w\+" contained skipwhite nextgroup=kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue


syn match kirikiriCommandParametersKey "\w\+\ze=" contained skipwhite nextgroup=kirikiriCommandParametersEqual
syn match kirikiriCommandParametersEqual "=" contained nextgroup=kirikiriCommandParametersValue,kirikiriString,kirikiriBoolean
" FIXME: won't highlight
syn match kirikiriCommandParametersValue "=\zs\S\+" contained

syn region kirikiriString start=/"/ end=/"/
syn region kirikiriString start=/'/ end=/'/

syn keyword kirikiriBoolean true false




if v:version >= 508 || !exists("did_kirikiri_syn_inits")
    if v:version < 508
        let did_kirikiri_syn_inits = 1
        command -nargs=+ KirikiriHiLink hi link <args>
    else
        command -nargs=+ KirikiriHiLink hi def link <args>
    endif

    KirikiriHiLink kirikiriLineComment Comment
    KirikiriHiLink kirikiriLabel       Label

    KirikiriHiLink kirikiriCommandTag               Function
    KirikiriHiLink kirikiriCommandTagName           Statement
    KirikiriHiLink kirikiriCommandParametersKey     Type
    KirikiriHiLink kirikiriCommandParametersValue   String

    KirikiriHiLink kirikiriString    String
    KirikiriHiLink kirikiriBoolean   Boolean

    delcommand KirikiriHiLink
endif



let b:current_syntax = 'kirikiri'
