
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) * (eval (b, x, y))) / 2
  | Cosine a -> int_of_float cos (pi * (float_of_int (eval (a, x, y))))
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(16,19)-(16,54)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,21)-(17,58)
(eval (a , x , y) *. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,22)-(17,38)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(18,16)-(18,28)
2.0
LitG

(18,29)-(18,32)
cos (pi ** eval (a , x , y))
AppG [AppG [EmptyG,EmptyG]]

(18,33)-(18,71)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(18,34)-(18,36)
(**)
VarG

(19,18)-(19,41)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(19,19)-(19,21)
(**)
VarG

*)