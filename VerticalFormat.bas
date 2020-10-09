Attribute VB_Name = "Module1"
Sub FormatMessage()
Attribute FormatMessage.VB_ProcData.VB_Invoke_Func = "M\n14"
'
' FormatMessage Macro
'
' Keyboard Shortcut: Ctrl+Shift+M
'
    Range("F1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = _
        "=TRIM(SUBSTITUTE(SUBSTITUTE(RC[-1],CHAR(13),""""),CHAR(10),""~""))"
    Range("F1").Select
    Selection.Copy
    Range(Selection, ActiveCell.SpecialCells(xlLastCell)).Select
    ActiveSheet.Paste
    Columns("F:F").Select
    Application.CutCopyMode = False
    Selection.Copy
    Columns("G:G").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Application.CutCopyMode = False
    Selection.TextToColumns Destination:=Range("G1"), DataType:=xlDelimited, _
        TextQualifier:=xlNone, ConsecutiveDelimiter:=False, Tab:=False, _
        Semicolon:=False, Comma:=False, Space:=False, Other:=True, OtherChar _
        :="~", FieldInfo:=Array(Array(1, 1), Array(2, 1), Array(3, 1), Array(4, 1), Array(5, _
        1), Array(6, 1), Array(7, 1), Array(8, 1), Array(9, 1)), TrailingMinusNumbers:=True
    Columns("E:F").Select
    Range("F1").Activate
    Selection.Delete Shift:=xlToLeft
    Cells.Select
    Cells.EntireColumn.AutoFit
    Range("A1").Select
End Sub
