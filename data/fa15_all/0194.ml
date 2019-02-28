
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match (e, x, y) with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> buildSine (eval e1)
  | Cosine e1 -> buildCosine (eval e1)
  | Average (e1,e2) -> buildAverage ((eval e1), (eval e2))
  | Times (e1,e2) -> buildTimes ((eval e1), (eval e2))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

*)

(* changed spans
(22,2)-(29,56)
match e with
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(Nothing,VarG)])

*)

(* changed exprs
Case (Just (11,23)-(11,61)) (Var (Just (11,29)-(11,30)) "e") [(ConPat (Just (11,38)-(11,42)) "VarX" Nothing,Nothing,Var (Just (11,47)-(11,48)) "x"),(ConPat (Just (11,51)-(11,55)) "VarY" Nothing,Nothing,Var (Just (11,60)-(11,61)) "y")]
*)

(* typed spans
(11,23)-(11,61)
*)

(* correct types
'a
*)

(* bad types
expr
*)
