" Vim syntax file
" Language: Mojom

if exists('b:current_syntax')
  finish
endif

syntax case match

syntax region mojomFold start="{" end="}" transparent fold

" Keywords
syntax keyword mojomType        bool string int8 int16 int32 int64 uint8 uint16
syntax keyword mojomType        uint32 uint64 float double array
syntax keyword mojomType        handle message_pipe shared_buffer data_pipe_consumer data_pipe_producer
syntax match mojomImport        "^\(import\)\s"
syntax keyword mojomKeyword     const module interface enum struct union associated
syntax match mojomOperator      /=>/
syntax match mojomOperator      /@/
syntax match mojomOperator      /?/

" Comments
syntax keyword mojomTodo           contained TODO FIXME XXX
syntax region  mojomDocLink        contained start="\[" end="\]"
syntax region  mojomComment        start="/\*"  end="\*/" contains=mojomTodo,mojomDocLink,@Spell
syntax match   mojomLineComment    "//.*" contains=mojomTodo,mojomDocLink,@Spell

" Literals
syntax match mojomBoolean       /true\|false/
syntax match mojomInteger       /\v<(0|[1-9][0-9]*)>/
syntax match mojomInteger       /\v<0[xX][0-9a-fA-F]*>/
syntax match mojomFloat         /[0-9]\+\.[0-9]*\|[0-9]*\.[0-9]\+/
syntax region mojomString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

" Attributes
syntax match mojomAttribute  /\[[^\]]*\]/

" The default highlighting.
highlight default link mojomTodo            Todo
highlight default link mojomComment         Comment
highlight default link mojomLineComment     Comment
highlight default link mojomDocLink         SpecialComment
highlight default link mojomType            Type
highlight default link mojomImport          Include
highlight default link mojomKeyword         Keyword
highlight default link mojomOperator        Operator
highlight default link mojomString          String
highlight default link mojomInteger         Number
highlight default link mojomBoolean         Boolean
highlight default link mojomFloat           Float
highlight default link mojomAttribute       Label

let b:current_syntax = 'mojom'
let b:spell_options = 'contained'

syntax sync minlines=500
