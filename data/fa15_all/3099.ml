
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr ->
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2
  | Power (expr1,expr2,expr3) ->
      (eval expr1) ** (abs ((eval (expr1, x, y)) +. (eval (expr2, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SumInts of expr
  | Power of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y))
  | Thresh (expr1,expr2,expr3,expr4) ->
      if (eval (expr1, x, y)) < (eval (expr2, x, y))
      then eval (expr3, x, y)
      else eval (expr4, x, y)
  | SumInts expr ->
      ((eval (expr, x, y)) *. ((eval (expr, x, y)) +. 1.0)) /. 2.0
  | Power (expr1,expr2,expr3) ->
      (eval (expr1, x, y)) **
        (abs_float ((eval (expr2, x, y)) +. (eval (expr3, x, y))));;

*)

(* changed spans
(29,63)-(29,64)
2.0
LitG

(31,12)-(31,17)
(expr1 , x , y)
TupleG (fromList [VarG])

(31,22)-(31,74)
x
VarG

(31,22)-(31,74)
y
VarG

(31,23)-(31,26)
abs_float
VarG

(31,35)-(31,40)
expr2
VarG

(31,59)-(31,64)
expr3
VarG

*)

(* changed exprs
Lit (Just (29,63)-(29,66)) (LD 2.0)
Tuple (Just (31,12)-(31,25)) [Var (Just (31,13)-(31,18)) "expr1",Var (Just (31,20)-(31,21)) "x",Var (Just (31,23)-(31,24)) "y"]
Var (Just (31,20)-(31,21)) "x"
Var (Just (31,23)-(31,24)) "y"
Var (Just (32,9)-(32,18)) "abs_float"
Var (Just (32,27)-(32,32)) "expr2"
Var (Just (32,51)-(32,56)) "expr3"
*)

(* typed spans
(29,63)-(29,66)
(31,12)-(31,25)
(31,20)-(31,21)
(31,23)-(31,24)
(32,9)-(32,18)
(32,27)-(32,32)
(32,51)-(32,56)
*)

(* correct types
float
(expr * float * float)
float
float
float -> float
expr
expr
*)

(* bad types
int
expr
float
float
int -> int
expr
expr
*)
