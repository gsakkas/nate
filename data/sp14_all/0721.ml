
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
      ((eval (expr, x, y)) +. (eval (expr1, x, y))) /. 2
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
  | Average (expr,expr1) -> (eval (expr, x, y)) +. (eval (expr1, x, y))
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(20,6)-(20,56)
eval (expr , x , y) +. eval (expr1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (19,28)-(19,71)) FPlus (App (Just (19,28)-(19,47)) (Var (Just (19,29)-(19,33)) "eval") [Tuple (Just (19,34)-(19,46)) [Var (Just (19,35)-(19,39)) "expr",Var (Just (19,41)-(19,42)) "x",Var (Just (19,44)-(19,45)) "y"]]) (App (Just (19,51)-(19,71)) (Var (Just (19,52)-(19,56)) "eval") [Tuple (Just (19,57)-(19,70)) [Var (Just (19,58)-(19,63)) "expr1",Var (Just (19,65)-(19,66)) "x",Var (Just (19,68)-(19,69)) "y"]])
*)

(* typed spans
(19,28)-(19,71)
*)

(* correct types
float
*)

(* bad types
float
*)
