Begin["EvalContext`"]

nbFileName = FileNameJoin[{"/home/jnh201/GSR-y2175/HolderTest", "GSRHolder_PLATOv1.8.nb"}];

outputCellPattern = Cell[_, "Output", ___];

cellEval[Cell[b_BoxData, "Input", rest___]] :=
 Cell[
  CellGroupData[{
    Cell[b, "Input", rest],
    Cell[BoxData@ToBoxes@(ToExpression @@ b), "Output"]},
   Open]]

cellEval[x : (_CellGroupData | _Cell | _Notebook)] := cellEval /@ x

cellEval[l_List] := cellEval /@ Cases[l, Except@outputCellPattern, {1}]

cellEval[smthElse_] := smthElse

evaluateNotebook = Export[#, cellEval@Get@#] &;

End[]

EvalContext`evaluateNotebook@EvalContext`nbFileName
