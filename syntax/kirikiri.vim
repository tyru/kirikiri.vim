
if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif



syn case match


syn match kirikiriScenarioLineComment ";.*"
syn match kirikiriScenarioLabel       "^\*\S\+"


syn match kirikiriScenarioCommandLine "^\t*\zs@.*$" contains=kirikiriScenarioCommandTagName,kirikiriScenarioCommandParametersKey,kirikiriScenarioCommandParametersEqual,kirikiriScenarioCommandParametersValue
syn region kirikiriScenarioCommandTag        start="\[" end="\]" contains=kirikiriScenarioCommandTagName,kirikiriScenarioCommandParametersKey,kirikiriScenarioCommandParametersEqual,kirikiriScenarioCommandParametersValue

" TODO: Use syn-keyword
" TODO: If installed syntax/tjs.vim, Use syn-include for "iscript".
" Or ignore it.
syn match kirikiriScenarioCommandTagName  "\%(@\|\[\)\zs\w\+" contained skipwhite nextgroup=kirikiriScenarioCommandParametersKey,kirikiriScenarioCommandParametersEqual,kirikiriScenarioCommandParametersValue


syn match kirikiriScenarioCommandParametersKey "\w\+\ze=" contained skipwhite nextgroup=kirikiriScenarioCommandParametersEqual
syn match kirikiriScenarioCommandParametersEqual "=" contained nextgroup=kirikiriScenarioCommandParametersValue,kirikiriScenarioString,kirikiriScenarioBoolean
" FIXME: won't highlight
syn match kirikiriScenarioCommandParametersValue "=\zs\S\+" contained

syn region kirikiriScenarioString start=/"/ end=/"/
syn region kirikiriScenarioString start=/'/ end=/'/

syn keyword kirikiriScenarioBoolean true false




if v:version >= 508 || !exists("did_kirikiriscenario_syn_inits")
    if v:version < 508
        let did_kirikiriscenario_syn_inits = 1
        command -nargs=+ KirikiriHiLink hi link <args>
    else
        command -nargs=+ KirikiriHiLink hi def link <args>
    endif

    KirikiriHiLink kirikiriScenarioLineComment Comment
    KirikiriHiLink kirikiriScenarioLabel       Label

    KirikiriHiLink kirikiriScenarioCommandTag               Function
    KirikiriHiLink kirikiriScenarioCommandTagName           Statement
    KirikiriHiLink kirikiriScenarioCommandParametersKey     Type
    KirikiriHiLink kirikiriScenarioCommandParametersValue   String

    KirikiriHiLink kirikiriScenarioString    String
    KirikiriHiLink kirikiriScenarioBoolean   Boolean

    delcommand KirikiriHiLink
endif



let b:current_syntax = 'kirikiri'
