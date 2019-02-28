
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | SqXPlusY of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | TimesTimes (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))
  | SqXPlusY (e1,e2) ->
      ((eval (e1, x, y)) *. (eval (e1, x, y))) + (eval (e2, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | SqXPlusY of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | TimesTimes (e1,e2,e3) ->
      ((eval (e1, x, y)) *. (eval (e2, x, y))) *. (eval (e3, x, y))
  | SqXPlusY (e1,e2) ->
      ((eval (e1, x, y)) *. (eval (e1, x, y))) +. (eval (e2, x, y));;

*)

(* changed spans
(30,6)-(30,66)
(eval (e1 , x , y) *. eval (e1 , x , y)) +. eval (e2 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (30,6)-(30,67)) FPlus (Bop (Just (30,6)-(30,46)) FTimes (App (Just (30,7)-(30,24)) (Var (Just (30,8)-(30,12)) "eval") [Tuple (Just (30,13)-(30,23)) [Var (Just (30,14)-(30,16)) "e1",Var (Just (30,18)-(30,19)) "x",Var (Just (30,21)-(30,22)) "y"]]) (App (Just (30,28)-(30,45)) (Var (Just (30,29)-(30,33)) "eval") [Tuple (Just (30,34)-(30,44)) [Var (Just (30,35)-(30,37)) "e1",Var (Just (30,39)-(30,40)) "x",Var (Just (30,42)-(30,43)) "y"]])) (App (Just (30,50)-(30,67)) (Var (Just (30,51)-(30,55)) "eval") [Tuple (Just (30,56)-(30,66)) [Var (Just (30,57)-(30,59)) "e2",Var (Just (30,61)-(30,62)) "x",Var (Just (30,64)-(30,65)) "y"]])
*)

(* typed spans
(30,6)-(30,67)
*)

(* correct types
float
*)

(* bad types
int
*)
