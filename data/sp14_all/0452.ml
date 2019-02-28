
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumPercent of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | SumPercent (e1,e2,e3) ->
      (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y))) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumPercent of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | SumPercent (e1,e2,e3) ->
      (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0);;

*)

(* changed spans
(29,6)-(29,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,6)-(29,69)) FPlus (Bop (Just (29,7)-(29,47)) FPlus (App (Just (29,8)-(29,25)) (Var (Just (29,9)-(29,13)) "eval") [Tuple (Just (29,14)-(29,24)) [Var (Just (29,15)-(29,17)) "e1",Var (Just (29,19)-(29,20)) "x",Var (Just (29,22)-(29,23)) "y"]]) (App (Just (29,29)-(29,46)) (Var (Just (29,30)-(29,34)) "eval") [Tuple (Just (29,35)-(29,45)) [Var (Just (29,36)-(29,38)) "e2",Var (Just (29,40)-(29,41)) "x",Var (Just (29,43)-(29,44)) "y"]])) (App (Just (29,51)-(29,68)) (Var (Just (29,52)-(29,56)) "eval") [Tuple (Just (29,57)-(29,67)) [Var (Just (29,58)-(29,60)) "e3",Var (Just (29,62)-(29,63)) "x",Var (Just (29,65)-(29,66)) "y"]])
*)

(* typed spans
(29,6)-(29,69)
*)

(* correct types
float
*)

(* bad types
int
*)
