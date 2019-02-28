
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) - (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) -. (eval (e3, x, y));;

*)

(* changed spans
(32,6)-(32,65)
(eval (e1 , x , y) +. eval (e2 , x , y)) -. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (32,6)-(32,67)) FMinus (Bop (Just (32,6)-(32,46)) FPlus (App (Just (32,7)-(32,24)) (Var (Just (32,8)-(32,12)) "eval") [Tuple (Just (32,13)-(32,23)) [Var (Just (32,14)-(32,16)) "e1",Var (Just (32,18)-(32,19)) "x",Var (Just (32,21)-(32,22)) "y"]]) (App (Just (32,28)-(32,45)) (Var (Just (32,29)-(32,33)) "eval") [Tuple (Just (32,34)-(32,44)) [Var (Just (32,35)-(32,37)) "e2",Var (Just (32,39)-(32,40)) "x",Var (Just (32,42)-(32,43)) "y"]])) (App (Just (32,50)-(32,67)) (Var (Just (32,51)-(32,55)) "eval") [Tuple (Just (32,56)-(32,66)) [Var (Just (32,57)-(32,59)) "e3",Var (Just (32,61)-(32,62)) "x",Var (Just (32,64)-(32,65)) "y"]])
*)

(* typed spans
(32,6)-(32,67)
*)

(* correct types
float
*)

(* bad types
int
*)
