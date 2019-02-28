
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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) + (eval (expr2, x, y))) /. 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;


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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(20,6)-(20,51)
eval (expr1 , x , y) +. eval (expr2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,55)-(20,56)
2.0
LitG

*)

(* changed exprs
Bop (Just (20,6)-(20,52)) FPlus (App (Just (20,7)-(20,27)) (Var (Just (20,8)-(20,12)) "eval") [Tuple (Just (20,13)-(20,26)) [Var (Just (20,14)-(20,19)) "expr1",Var (Just (20,21)-(20,22)) "x",Var (Just (20,24)-(20,25)) "y"]]) (App (Just (20,31)-(20,51)) (Var (Just (20,32)-(20,36)) "eval") [Tuple (Just (20,37)-(20,50)) [Var (Just (20,38)-(20,43)) "expr2",Var (Just (20,45)-(20,46)) "x",Var (Just (20,48)-(20,49)) "y"]])
Lit (Just (20,56)-(20,59)) (LD 2.0)
*)

(* typed spans
(20,6)-(20,52)
(20,56)-(20,59)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
