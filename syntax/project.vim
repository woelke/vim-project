if exists("b:current_syntax")
  finish
endif

let s:sep = project#config#get_sep()

syntax  match  ProjectSection  /\%9c{\S\+}/
syntax  match  ProjectTitle    /\%9c\S\+/ contains=ProjectSection
syntax  match  ProjectSpecial  /\V<empty buffer>\|<quit>/
syntax  match  ProjectBracket  /\[\|\]/
syntax  match  ProjectNumber   /\v\[[eq[:digit:]]+\]/hs=s+1,he=e-1 contains=ProjectBracket
syntax  match  ProjectFile     /.*/ contains=ProjectBracket,ProjectNumber,ProjectTitle,ProjectPath,ProjectSpecial,ProjectUnit
syntax  match  ProjectUnit     /.:/

execute 'syntax match ProjectSlash /\'. s:sep .'/'
execute 'syntax match ProjectPath /\'. s:sep . '.*\' . s:sep .'/ contains=ProjectSlash'

highlight projectPath ctermfg=11 ctermbg=8 guifg=#586e75
highlight link ProjectFile    String
highlight link ProjectBracket Normal
highlight link ProjectNumber  Directory
highlight link ProjectPath    projectPath
highlight link ProjectUnit    projectPath
highlight link ProjectTitle   Statement
highlight link ProjectSection Comment
highlight link ProjectSpecial String


let b:current_syntax = 'project'

" vim: et sw=2 sts=2
