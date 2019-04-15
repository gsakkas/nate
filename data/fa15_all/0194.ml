
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
(22,3)-(29,57)
match e with
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(21,4)-(29,59)
(21,15)-(29,57)
(22,3)-(29,57)
(22,9)-(22,18)
(25,26)-(25,35)
(25,27)-(25,31)
(25,32)-(25,34)
*)
