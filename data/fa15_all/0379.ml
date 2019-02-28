
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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. t)
  | Cosine t -> cos (pi *. t)
  | Average (t,s) -> (t +. s) /. 2;;


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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0;;

*)

(* changed spans
(17,25)-(17,26)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,16)-(18,29)
y
VarG

(18,27)-(18,28)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,21)-(19,34)
y
VarG

(19,22)-(19,23)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,27)-(19,28)
eval (s , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,33)-(19,34)
x
VarG

*)

(* typed spans
float
float
float
float
float
float
float
*)
