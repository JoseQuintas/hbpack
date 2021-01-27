@echo off

:Main

   call :update deleted_hb    deleted_hb
   call :update harbour_32    harbour_32     https://github.com/harbour/core
   call :update harbour_34    harbour_34     https://github.com/vszakats/hb
   call :update hmg           hmg
   call :update hmge          hmge
   call :update hwgui         hwgui
   call :update oohg_core     oohg           https://github.com/oohg/core
   call :update oohg_distros  oohg_distros   https://github.com/oohg/distros
   call :update oohg_doc      oohg_doc       https://github.com/oohg/doc
   call :update oohg_fmt      oohg_fmt       https://github.com/oohg/fmt
   call :update oohg_ide      oohg_ide       https://github.com/oohg/ide
   call :update oohg_samples  oohg_samples   https://github.com/oohg/samples
   call :update sefazclass    sefazclass
   call :update wvgtst        wvgtst
   call :update xharbour      xharbour
   call :hwgui_sourceforge
   call :xharbour_sourceforge
   goto :exit

:hwgui_sourceforge

   echo -------------------------------------
   echo hwgui from sourceforge
   echo.
   cd \github\hwgui
   git svn init https://svn.code.sf.net/p/hwgui/code/trunk/hwgui
   git svn fetch -r2950:HEAD
   git push
   goto :exit

:xharbour_sourceforge
   echo -------------------------------------
   echo xharbour from sourceforge
   echo.
   cd \github\xharbour
   git svn init https://svn.code.sf.net/p/xharbour/code/trunk/xharbour
   git svn fetch -r10260:HEAD
   git push
   goto :exit

:update

   echo -------------------------------------
   echo %1
   echo.
   if not exist \github\%2\*.* echo create %2
   if not exist \github\%2\*.* git clone https://github.com/JoseQuintas/%1 \github\%2 --depth 100
   if not "%3" == "" echo updating %2 from %3
   if not "%3" == "" pause
   cd \github\%2
   if not "%3" == "" git pull %3
   git push

:exit
   cd \github\hbpack
