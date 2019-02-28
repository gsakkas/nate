
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> VarX
  | VarY  -> VarY
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3) ->
      (exprToString e1) ^ ((exprToString e2) ^ (exprToString e3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> ""
  | VarY  -> ""
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ((exprToString e2) ^ ((exprToString e3) ^ (exprToString e4)));;

*)

(* changed spans
(12,2)-(20,65)
match e with
| VarX -> ""
| VarY -> ""
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> exprToString e1 ^ exprToString e2
| Times (e1 , e2) -> exprToString e1 ^ exprToString e2
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ (exprToString e2 ^ (exprToString e3 ^ exprToString e4))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(21,69)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,15)) (LS "")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,15)) (LS "")),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "e1")),Nothing,App (Just (15,15)-(15,30)) (Var (Just (15,15)-(15,27)) "exprToString") [Var (Just (15,28)-(15,30)) "e1"]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "e1")),Nothing,App (Just (16,17)-(16,32)) (Var (Just (16,17)-(16,29)) "exprToString") [Var (Just (16,30)-(16,32)) "e1"]),(ConPat (Just (17,4)-(17,18)) "Average" (Just (TuplePat (Just (17,13)-(17,18)) [VarPat (Just (17,13)-(17,15)) "e1",VarPat (Just (17,16)-(17,18)) "e2"])),Nothing,App (Just (17,23)-(17,60)) (Var (Just (17,41)-(17,42)) "^") [App (Just (17,23)-(17,40)) (Var (Just (17,24)-(17,36)) "exprToString") [Var (Just (17,37)-(17,39)) "e1"],App (Just (17,43)-(17,60)) (Var (Just (17,44)-(17,56)) "exprToString") [Var (Just (17,57)-(17,59)) "e2"]]),(ConPat (Just (18,4)-(18,16)) "Times" (Just (TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "e1",VarPat (Just (18,14)-(18,16)) "e2"])),Nothing,App (Just (18,21)-(18,58)) (Var (Just (18,39)-(18,40)) "^") [App (Just (18,21)-(18,38)) (Var (Just (18,22)-(18,34)) "exprToString") [Var (Just (18,35)-(18,37)) "e1"],App (Just (18,41)-(18,58)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,57)) "e2"]]),(ConPat (Just (19,4)-(19,23)) "Thresh" (Just (TuplePat (Just (19,12)-(19,23)) [VarPat (Just (19,12)-(19,14)) "e1",VarPat (Just (19,15)-(19,17)) "e2",VarPat (Just (19,18)-(19,20)) "e3",VarPat (Just (19,21)-(19,23)) "e4"])),Nothing,App (Just (20,6)-(21,69)) (Var (Just (20,24)-(20,25)) "^") [App (Just (20,6)-(20,23)) (Var (Just (20,7)-(20,19)) "exprToString") [Var (Just (20,20)-(20,22)) "e1"],App (Just (21,8)-(21,69)) (Var (Just (21,27)-(21,28)) "^") [App (Just (21,9)-(21,26)) (Var (Just (21,10)-(21,22)) "exprToString") [Var (Just (21,23)-(21,25)) "e2"],App (Just (21,29)-(21,68)) (Var (Just (21,48)-(21,49)) "^") [App (Just (21,30)-(21,47)) (Var (Just (21,31)-(21,43)) "exprToString") [Var (Just (21,44)-(21,46)) "e3"],App (Just (21,50)-(21,67)) (Var (Just (21,51)-(21,63)) "exprToString") [Var (Just (21,64)-(21,66)) "e4"]]]])]
*)

(* typed spans
(12,2)-(21,69)
*)

(* correct types
string
*)

(* bad types
expr
*)
