
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
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then eval (e3, x, y);;


(* fix

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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y);;

*)

(* changed spans
(17,19)-(17,43)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,45)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,67)-(19,68)
2.0
LitG

(22,6)-(22,67)
EMPTY
EmptyG

(22,9)-(22,46)
EMPTY
EmptyG

(22,16)-(22,18)
EMPTY
EmptyG

(22,20)-(22,21)
EMPTY
EmptyG

(22,23)-(22,24)
EMPTY
EmptyG

(22,29)-(22,46)
EMPTY
EmptyG

(22,30)-(22,34)
EMPTY
EmptyG

(22,35)-(22,45)
EMPTY
EmptyG

(22,36)-(22,38)
EMPTY
EmptyG

(22,40)-(22,41)
EMPTY
EmptyG

(22,43)-(22,44)
EMPTY
EmptyG

(22,52)-(22,56)
EMPTY
EmptyG

(22,52)-(22,67)
EMPTY
EmptyG

(22,57)-(22,67)
EMPTY
EmptyG

*)
