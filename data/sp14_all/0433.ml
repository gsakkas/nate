
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi * (eval (e1, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(11,9)-(11,12)
EMPTY
EmptyG

(11,9)-(11,26)
EMPTY
EmptyG

(11,16)-(11,26)
EMPTY
EmptyG

(11,17)-(11,21)
EMPTY
EmptyG

(11,22)-(11,25)
EMPTY
EmptyG

(17,19)-(17,43)
EMPTY
EmptyG

(17,20)-(17,22)
EMPTY
EmptyG

*)
