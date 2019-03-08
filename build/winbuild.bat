make -f Make_ming.mak ^
  GUI=yes ^
  TERMINAL=yes ^
  DIRECTX=yes ^
  ARCH=x86-64 ^
  FEATURES=HUGE ^
  PYTHON=C:\python27 ^
  DYNAMIC_PYTHON=yes ^
  PYTHON3=C:\python36 ^
  DYNAMIC_PYTHON3=yes ^
  %1

make -f Make_ming.mak ^
  GUI=no ^
  TERMINAL=yes ^
  DIRECTX=yes ^
  ARCH=x86-64 ^
  FEATURES=HUGE ^
  PYTHON=C:\python27 ^
  DYNAMIC_PYTHON=yes ^
  PYTHON3=C:\python36 ^
  DYNAMIC_PYTHON3=yes ^
  %1

rem  LUA=C:\PROGRA~1\Lua\5.3 ^
rem  DYNAMIC_PYTHON=no ^
rem  DYNAMIC_PYTHON3=no ^
rem  PYTHON3=C:\\python36 ^
rem  PYTHON3_HOME=C:\\\\python36 ^
rem  DYNAMIC_PYTHON3=no ^
rem  DYNAMIC_PYTHON3_DLL=C:\\python36\\python36.dll ^
rem  LFLAGS=-Wl,-rpath=C:\\python36
