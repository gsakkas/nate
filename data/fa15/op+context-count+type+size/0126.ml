
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) = buildTimes x y;;


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
(11,17)-(11,39)
(11,26)-(11,39)
(11,33)-(11,35)
(11,37)-(11,39)
(13,24)-(13,38)
*)

(* type error slice
(11,4)-(11,42)
(11,17)-(11,39)
(11,26)-(11,39)
(13,24)-(13,34)
(13,24)-(13,38)
*)