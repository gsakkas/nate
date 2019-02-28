
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | MultDiv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Divide (e1,e2) -> (eval (e1, x, y)) /. (eval (e2, x, y))
  | MultDiv (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) / (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | MultDiv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Divide (e1,e2) -> (eval (e1, x, y)) /. (eval (e2, x, y))
  | MultDiv (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) /. (eval (e3, x, y));;

*)

(* changed spans
(28,6)-(28,66)
(eval (e1 , x , y) *. eval (e2 , x , y)) /. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (28,6)-(28,67)) FDiv (Bop (Just (28,6)-(28,46)) FTimes (App (Just (28,7)-(28,24)) (Var (Just (28,8)-(28,12)) "eval") [Tuple (Just (28,13)-(28,23)) [Var (Just (28,14)-(28,16)) "e1",Var (Just (28,18)-(28,19)) "x",Var (Just (28,21)-(28,22)) "y"]]) (App (Just (28,28)-(28,45)) (Var (Just (28,29)-(28,33)) "eval") [Tuple (Just (28,34)-(28,44)) [Var (Just (28,35)-(28,37)) "e2",Var (Just (28,39)-(28,40)) "x",Var (Just (28,42)-(28,43)) "y"]])) (App (Just (28,50)-(28,67)) (Var (Just (28,51)-(28,55)) "eval") [Tuple (Just (28,56)-(28,66)) [Var (Just (28,57)-(28,59)) "e3",Var (Just (28,61)-(28,62)) "x",Var (Just (28,64)-(28,65)) "y"]])
*)

(* typed spans
(28,6)-(28,67)
*)

(* correct types
float
*)

(* bad types
int
*)
