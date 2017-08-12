:: Make variable changes local to script
@echo off
setlocal

:: Configure VIM features
set FEATURES=BIG
set GUI=yes
set NETBEANS=no
set MBYTE=yes
set DYNAMIC_PYTHON3=yes
set PYTHON3=C:/Users/Anand/Miniconda3/envs/vim_python
set PYTHON3_VER=36

set SRC=c:\Users\Anand\Documents\Projects\vim
set DEST=c:\Users\Anand\Documents\Tools\vim80

:: Compile VIM
pushd %SRC%\src
git clean -dfx
git pull
nmake /f Make_mvc.mak

xcopy %SRC%\runtime %DEST% /D /S /H /I /Y
xcopy %SRC%\src\xxd\xxd.exe %DEST% /D /Y
xcopy %SRC%\src\GvimExt\gvimext.dll %DEST% /D /Y
xcopy %SRC%\src\*.exe %DEST% /D /Y

popd
:: Add App Paths registration to registry
reg import app_paths.reg
