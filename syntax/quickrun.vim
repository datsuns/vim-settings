
syntax keyword quickrunGtestPassed  PASSED OK
syntax keyword quickrunGtestFailed  FAILED
syntax keyword quickrunRspecFailed  Failed failures

highlight def link quickrunGtestPassed Comment
highlight def link quickrunGtestFailed Error
highlight def link quickrunRspecFailed Error