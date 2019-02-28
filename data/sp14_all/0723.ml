
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
  | Average (expr,expr1) -> ((eval (expr, x, y)) +. (eval (expr1, x, y))) / 2
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;


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
  | Average (expr,expr1) ->
      ((eval (expr, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(19,28)-(19,77)
(eval (expr , x , y) +. eval (expr1 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (20,6)-(20,57)) FDiv (Bop (Just (20,6)-(20,51)) FPlus (App (Just (20,7)-(20,26)) (Var (Just (20,8)-(20,12)) "eval") [Tuple (Just (20,13)-(20,25)) [Var (Just (20,14)-(20,18)) "expr",Var (Just (20,20)-(20,21)) "x",Var (Just (20,23)-(20,24)) "y"]]) (App (Just (20,30)-(20,50)) (Var (Just (20,31)-(20,35)) "eval") [Tuple (Just (20,36)-(20,49)) [Var (Just (20,37)-(20,42)) "expr1",Var (Just (20,44)-(20,45)) "x",Var (Just (20,47)-(20,48)) "y"]])) (Lit (Just (20,55)-(20,57)) (LD 2.0))
*)

(* typed spans
(20,6)-(20,57)
*)

(* correct types
float
*)

(* bad types
int
*)
