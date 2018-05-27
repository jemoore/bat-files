@echo off

IF "%~1"=="" GOTO usage
IF "%~2"=="" GOTO usage

set DIR-TO-ZIP=%1
set ZIP-FILE=%2

IF NOT exist %DIR-TO-ZIP% GOTO no-dir
IF exist %ZIP-FILE% GOTO file-exist

set SVNZIP="C:\Program Files\7-Zip\7z"

%SVNZIP% a %ZIP-FILE% %DIR-TO-ZIP%

GOTO done

:usage
	ECHO "usage: zipdir <dir-to-zip> <new-zip-file-name>"
	GOTO done
:no-dir
	ECHO "The source directory to zip does not exist: " %DIR-TO-ZIP%
	GOTO done
:file-exist
	ECHO "The zip file to create already exists: " %ZIP-FILE%
	GOTO done
:done