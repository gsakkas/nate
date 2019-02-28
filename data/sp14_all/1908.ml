
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

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
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) / (eval (e2, x, y))) / (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

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
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) /. (eval (e2, x, y))) /. (eval (e3, x, y));;

*)

(* changed spans
(29,6)-(29,65)
(eval (e1 , x , y) /. eval (e2 , x , y)) /. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,6)-(29,67)) FDiv (Bop (Just (29,6)-(29,46)) FDiv (App (Just (29,7)-(29,24)) (Var (Just (29,8)-(29,12)) "eval") [Tuple (Just (29,13)-(29,23)) [Var (Just (29,14)-(29,16)) "e1",Var (Just (29,18)-(29,19)) "x",Var (Just (29,21)-(29,22)) "y"]]) (App (Just (29,28)-(29,45)) (Var (Just (29,29)-(29,33)) "eval") [Tuple (Just (29,34)-(29,44)) [Var (Just (29,35)-(29,37)) "e2",Var (Just (29,39)-(29,40)) "x",Var (Just (29,42)-(29,43)) "y"]])) (App (Just (29,50)-(29,67)) (Var (Just (29,51)-(29,55)) "eval") [Tuple (Just (29,56)-(29,66)) [Var (Just (29,57)-(29,59)) "e3",Var (Just (29,61)-(29,62)) "x",Var (Just (29,64)-(29,65)) "y"]])
*)

(* typed spans
(29,6)-(29,67)
*)

(* correct types
float
*)

(* bad types
int
*)
