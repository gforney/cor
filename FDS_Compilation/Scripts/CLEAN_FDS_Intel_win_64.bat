@echo off
Title Cleaning FDS for 64 bit Windows 

Rem Batch file used to clean 32 and 64 bit FDS build directories

set envfile="%homedrive%\%homepath%"\fds_smv_env.bat
IF EXIST %envfile% GOTO endif_envexist
echo ***Fatal error.  The environment setup file %envfile% does not exist. 
echo Create a file named %envfile% and use SMV_5/scripts/fds_smv_env_template.bat
echo as an example.
echo.
echo Aborting now...
pause>NUL
goto:eof

:endif_envexist

Rem location of batch files used to set up Intel compilation environment
set intelbin=c:\bin

call %envfile%

%svn_drive%
echo.
cd %svn_root%\FDS_Compilation\Intel_Win_64
echo Cleaning intel_win_64
make -f ..\makefile clean

echo.
cd %svn_root%\FDS_Compilation\mpi_intel_win_64
echo Cleaning mpi_intel_win_64
make -f ..\makefile clean

pause