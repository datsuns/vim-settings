"source $VIMRUNTIME/syntax/ruby.vim

syn keyword rubyRspecKeyword    describe it its before subject context
syn keyword rubyRspecSpecialDefinition    share_examples_for it_should_behave_like

hi def link rubyRspecKeyword	rubyClass
hi def link rubyRspecSpecialDefinition	rubyConstant
