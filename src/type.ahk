; Nexss PROGRAMMER 2.0.0 - Auto Hot Key
; Keyboard 
; SETUP
#NoEnv 
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include ../../3rdPartyLibraries/AutoHotkey-JSON/JSON.ahk
; STDIN
STDIN := FileOpen("*", "r")
NexssStdin := STDIN.Read()
NexssStdout := JSON.load(NexssStdin)

; Handling Keyboard
ParamType := NexssStdout.type

if(ParamType){
    ; Write type param out
    Send, %ParamType%
    Send, {Enter}
    Return
}


; Modify Data
; NexssStdout.ahkOutput := "Hello from AHK! " . A_AhkVersion
NexssStdout.Keyboard := "ok"

; STDOUT
NexssStdout := JSON.Dump(NexssStdout)
STDOUT := FileOpen("*", "w")
STDOUT.Write(NexssStdout)
