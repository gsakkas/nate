
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
  | VarX  -> 0
  | VarY  -> 1
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2;;


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
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(12,2)-(17,67)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> (exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ ("+" ^ exprToString e2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(19,73)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "e1")),Nothing,App (Just (15,15)-(15,30)) (Var (Just (15,15)-(15,27)) "exprToString") [Var (Just (15,28)-(15,30)) "e1"]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "e1")),Nothing,App (Just (16,17)-(16,32)) (Var (Just (16,17)-(16,29)) "exprToString") [Var (Just (16,30)-(16,32)) "e1"]),(ConPat (Just (17,4)-(17,18)) "Average" (Just (TuplePat (Just (17,13)-(17,18)) [VarPat (Just (17,13)-(17,15)) "e1",VarPat (Just (17,16)-(17,18)) "e2"])),Nothing,App (Just (17,23)-(17,77)) (Var (Just (17,71)-(17,72)) "^") [App (Just (17,23)-(17,70)) (Var (Just (17,42)-(17,43)) "^") [App (Just (17,24)-(17,41)) (Var (Just (17,25)-(17,37)) "exprToString") [Var (Just (17,38)-(17,40)) "e1"],App (Just (17,44)-(17,69)) (Var (Just (17,49)-(17,50)) "^") [Lit (Just (17,45)-(17,48)) (LS "+"),App (Just (17,51)-(17,68)) (Var (Just (17,52)-(17,64)) "exprToString") [Var (Just (17,65)-(17,67)) "e2"]]],Lit (Just (17,73)-(17,77)) (LS "/2")]),(ConPat (Just (18,4)-(18,16)) "Times" (Just (TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "e1",VarPat (Just (18,14)-(18,16)) "e2"])),Nothing,App (Just (18,21)-(18,66)) (Var (Just (18,39)-(18,40)) "^") [App (Just (18,21)-(18,38)) (Var (Just (18,22)-(18,34)) "exprToString") [Var (Just (18,35)-(18,37)) "e1"],App (Just (18,41)-(18,66)) (Var (Just (18,46)-(18,47)) "^") [Lit (Just (18,42)-(18,45)) (LS "*"),App (Just (18,48)-(18,65)) (Var (Just (18,49)-(18,61)) "exprToString") [Var (Just (18,62)-(18,64)) "e2"]]]),(ConPat (Just (19,4)-(19,23)) "Thresh" (Just (TuplePat (Just (19,12)-(19,23)) [VarPat (Just (19,12)-(19,14)) "e1",VarPat (Just (19,15)-(19,17)) "e2",VarPat (Just (19,18)-(19,20)) "e3",VarPat (Just (19,21)-(19,23)) "e4"])),Nothing,App (Just (19,28)-(19,73)) (Var (Just (19,46)-(19,47)) "^") [App (Just (19,28)-(19,45)) (Var (Just (19,29)-(19,41)) "exprToString") [Var (Just (19,42)-(19,44)) "e1"],App (Just (19,48)-(19,73)) (Var (Just (19,53)-(19,54)) "^") [Lit (Just (19,49)-(19,52)) (LS "+"),App (Just (19,55)-(19,72)) (Var (Just (19,56)-(19,68)) "exprToString") [Var (Just (19,69)-(19,71)) "e2"]]])]
*)

(* typed spans
(12,2)-(19,73)
*)

(* correct types
string
*)

(* bad types
int
*)
