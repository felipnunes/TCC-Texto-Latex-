@echo off
rem Compila o TCC localmente com MiKTeX: pdflatex -> bibtex -> pdflatex x2
cd /d "%~dp0"
set "TEX=F:\MiKTeX\miktex\bin\x64"
"%TEX%\pdflatex.exe" -interaction=nonstopmode -file-line-error CorpoTexto.tex >nul
"%TEX%\bibtex.exe" CorpoTexto
"%TEX%\pdflatex.exe" -interaction=nonstopmode -file-line-error CorpoTexto.tex >nul
"%TEX%\pdflatex.exe" -interaction=nonstopmode -file-line-error CorpoTexto.tex >nul
findstr /b /c:"!" CorpoTexto.log && (echo. & echo ERROS acima. Veja CorpoTexto.log) || echo OK: CorpoTexto.pdf gerado.
findstr /c:"undefined" CorpoTexto.log
