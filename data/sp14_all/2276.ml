
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | Thresh (a,b,c,d) -> exprToString a b c d;;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")");;

*)

(* changed spans
(12,2)-(12,57)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> "sin (pi*" ^ (exprToString e ^ ")")
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(15,51)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,10)) "Sine" (Just (VarPat (Just (15,9)-(15,10)) "e")),Nothing,App (Just (15,14)-(15,51)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,14)-(15,24)) (LS "sin (pi*"),App (Just (15,27)-(15,51)) (Var (Just (15,45)-(15,46)) "^") [App (Just (15,28)-(15,44)) (Var (Just (15,29)-(15,41)) "exprToString") [Var (Just (15,42)-(15,43)) "e"],Lit (Just (15,47)-(15,50)) (LS ")")]])]
*)

(* typed spans
(12,2)-(15,51)
*)

(* correct types
string
*)

(* bad types
'a
*)
