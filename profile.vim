let s:list = []
global/^SCRIPT/
\ call add(s:list, printf("%s\t%s",
\                         matchstr(getline(line('.')+2), '\d\+\.\d\+'),
\                         matchstr(getline('.'), 'SCRIPT\s*\zs.*$')))
new
put =reverse(sort(s:list))
1 delete _
