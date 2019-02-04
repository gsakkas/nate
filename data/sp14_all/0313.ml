
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
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e1, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
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

(19,23)-(19,62)
EMPTY
EmptyG

(19,23)-(19,66)
EMPTY
EmptyG

(19,24)-(19,41)
EMPTY
EmptyG

(19,25)-(19,29)
EMPTY
EmptyG

(19,30)-(19,40)
EMPTY
EmptyG

(19,31)-(19,33)
EMPTY
EmptyG

(19,35)-(19,36)
EMPTY
EmptyG

(19,38)-(19,39)
(eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,44)-(19,61)
eval (e1 , x , y) +. eval (e1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,65)-(19,66)
EMPTY
EmptyG

(20,21)-(20,58)
EMPTY
EmptyG

(20,41)-(20,58)
EMPTY
EmptyG

(20,42)-(20,46)
EMPTY
EmptyG

(20,47)-(20,57)
EMPTY
EmptyG

(20,48)-(20,50)
EMPTY
EmptyG

(20,52)-(20,53)
EMPTY
EmptyG

(20,55)-(20,56)
EMPTY
EmptyG

(22,6)-(22,67)
EMPTY
EmptyG

(22,9)-(22,26)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,9)-(22,46)
2.0
LitG

*)
