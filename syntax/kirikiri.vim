
if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif


if v:version < 508
    command -nargs=+ KirikiriHiLink hi link <args>
else
    command -nargs=+ KirikiriHiLink hi def link <args>
endif


syn case ignore


syn match kirikiriLineComment ";.*"
syn match kirikiriLabel       "^\*\S\+"


syn match kirikiriCommandLine "^\t*\zs@.*$" contains=kirikiriCommandTagName,kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue
syn region kirikiriCommandTag        start="\[" end="\]" contains=kirikiriCommandTagName,kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue



syn keyword kirikiriCommandParametersKey contained skipwhite nextgroup=kirikiriCommandParametersEqual accel align alt angle ask audiostreamnum autohide autoreturn backlay bceil bfloor bgamma bgcolor bgm bold buf call canskip ch channel char children click clickse clicksebuf clipheight clipleft cliptop clipwidth color countpage default delay destlayer destpage draggable dx dy edge edgecolor enabled end enterse entersebuf eol exp expand face fix fliplr flipud for frame framekey from func gceil gfloor ggamma graphic graphickey grayscale gvolume height hint hmax index italic jump kag key layer layers leavese leavesebuf left length line linekey linesize linespacing loop mapaction mapimage marginb marginl marginr margint maxchars mcolor messages method mode module mopacity name onenter onleave onskip opacity output overlap page pagekey pan path pausevideo pitch place playrate pointed pos position prompt rceil recthit repage restore rfloor rgamma rubyoffset rubysize rule se sebuf seg sh shadow shadowcolor size slot speed spline srclayer srcpage start stay storage store sw sx sy target text time timemode title to top vague vertical videoevent videosegloop visible vmax volume width withback x y
syn match kirikiriCommandParametersEqual "=" contained nextgroup=kirikiriCommandParametersValue,kirikiriString,kirikiriBoolean
" FIXME: won't highlight
syn match kirikiriCommandParametersValue "=\zs\S\+" contained




if globpath(&rtp, 'syntax/tjs.vim') != ''
    " FIXME: "[iscript]" won't highlight
    syn include @tjs syntax/tjs.vim
    syn region kirikiriIscript start="\[\s*iscript\s*\]\|^@\s*iscript" end="\[\s*endscript\s*\]\|^@\s*endscript"me=s-1 keepend contains=@tjs
endif

syn keyword kirikiriCommandTagName contained skipwhite nextgroup=kirikiriCommandParametersKey,kirikiriCommandParametersEqual,kirikiriCommandParametersValue animstart animstop autowc backlay bgmopt button call cancelautomode cancelskip cancelvideoevent cancelvideosegloop cclick ch checkbox clearbgmlabel clearbgmstop clearsysvar clearvar clearvideolayer click clickskip close cm commit copybookmark copylay ct ctimeout current cursor cwheel deffont defstyle delay disablestore edit else elsif emb endhact endif endignore endindent endlink endmacro endnowait endscript er erasebookmark erasemacro eval fadebgm fadeinbgm fadeinse fadeoutbgm fadeoutse fadepausebgm fadese font freeimage glyph goback gotostart graph hact hch hidemessage history hr if ignore image indent input iscript jump l laycount layopt link load loadplugin locate locklink locksnapshot macro mapaction mapdisable mapimage mappfont move nextskip nowait openvideo p pausebgm pausevideo pimage playbgm playse playvideo position preparevideo ptext quake r rclick record resetfont resetstyle resetwait resumebgm resumevideo return rewindvideo ruby s save seopt setbgmlabel setbgmstop showhistory startanchor stopbgm stopmove stopquake stopse stoptrans stopvideo store style tempload tempsave timeout title trace trans unlocklink unlocksnapshot video videoevent videolayer videosegloop wa wait waitclick waittrig wb wc wf wheel wl wm wp wq ws wt wv xchgbgm



syn region kirikiriString start=/"/ end=/"/
syn region kirikiriString start=/'/ end=/'/

syn keyword kirikiriBoolean true false




if v:version >= 508 || !exists("did_kirikiri_syn_inits")
    if v:version < 508
        let did_kirikiri_syn_inits = 1
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
