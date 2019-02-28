
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Comp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) /. (float_of_int 2)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Power (e1,e2) -> (eval (e1, x, y)) ** (eval (e2, x, y))
  | Comp (e1,e2,e3) ->
      float_of_int -
        (((1 *. (eval (e1, x, y))) *. (eval (e2, x, y))) *. (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Comp of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) /. (float_of_int 2)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Power (e1,e2) -> (eval (e1, x, y)) ** (eval (e2, x, y))
  | Comp (e1,e2,e3) ->
      (((float_of_int (-1)) *. (eval (e1, x, y))) *. (eval (e2, x, y))) *.
        (eval (e3, x, y));;

*)

(* changed spans
(30,6)-(31,78)
((float_of_int (-1) *. eval (e1 , x , y)) *. eval (e2 , x , y)) *. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (30,6)-(31,25)) FTimes (Bop (Just (30,6)-(30,71)) FTimes (Bop (Just (30,7)-(30,49)) FTimes (App (Just (30,8)-(30,27)) (Var (Just (30,9)-(30,21)) "float_of_int") [Lit (Just (30,22)-(30,26)) (LI (-1))]) (App (Just (30,31)-(30,48)) (Var (Just (30,32)-(30,36)) "eval") [Tuple (Just (30,37)-(30,47)) [Var (Just (30,38)-(30,40)) "e1",Var (Just (30,42)-(30,43)) "x",Var (Just (30,45)-(30,46)) "y"]])) (App (Just (30,53)-(30,70)) (Var (Just (30,54)-(30,58)) "eval") [Tuple (Just (30,59)-(30,69)) [Var (Just (30,60)-(30,62)) "e2",Var (Just (30,64)-(30,65)) "x",Var (Just (30,67)-(30,68)) "y"]])) (App (Just (31,8)-(31,25)) (Var (Just (31,9)-(31,13)) "eval") [Tuple (Just (31,14)-(31,24)) [Var (Just (31,15)-(31,17)) "e3",Var (Just (31,19)-(31,20)) "x",Var (Just (31,22)-(31,23)) "y"]])
*)

(* typed spans
(30,6)-(31,25)
*)

(* correct types
float
*)

(* bad types
int
*)
