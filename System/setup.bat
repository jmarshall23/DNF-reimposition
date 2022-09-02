mkdir Temp
mpkgx MegaPackage.dat Temp
del Temp\System\Engine.u
del Temp\System\Editor.u
xcopy Temp\* ..\ /s /y
rmdir Temp /s /q