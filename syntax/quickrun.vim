
syntax keyword quickrunGtestRun  RUN

syntax keyword quickrunGtestPassed  PASSED OK

syntax keyword quickrunGtestFailed  FAILED
syntax keyword quickrunRspecFailed  Failed failures
syntax keyword quickrunUnityFailed  FAIL


highlight def link quickrunGtestRun ToDo

highlight def link quickrunGtestPassed Comment

highlight def link quickrunGtestFailed Error
highlight def link quickrunRspecFailed Error
highlight def link quickrunUnityFailed Error
