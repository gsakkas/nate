
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | NewA (a,b) ->
      (sin (pi *. (eval (a, x, y)))) *. (cos (pi *. (eval (b, x, y))))
  | NewB (a,b,c) ->
      (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y))) exp 0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | NewA (a,b) ->
      (sin (pi *. (eval (a, x, y)))) *. (cos (pi *. (eval (b, x, y))))
  | NewB (a,b,c) ->
      (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y))) -.
        (((eval (a, x, y)) +. (eval (b, x, y))) +. (eval (c, x, y)));;

*)

(* changed spans
(30,6)-(30,72)
((eval (a , x , y) +. eval (b , x , y)) +. eval (c , x , y)) -. ((eval (a , x , y) +. eval (b , x , y)) +. eval (c , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (30,6)-(31,68)) FMinus (Bop (Just (30,6)-(30,66)) FPlus (Bop (Just (30,7)-(30,45)) FPlus (App (Just (30,8)-(30,24)) (Var (Just (30,9)-(30,13)) "eval") [Tuple (Just (30,14)-(30,23)) [Var (Just (30,15)-(30,16)) "a",Var (Just (30,18)-(30,19)) "x",Var (Just (30,21)-(30,22)) "y"]]) (App (Just (30,28)-(30,44)) (Var (Just (30,29)-(30,33)) "eval") [Tuple (Just (30,34)-(30,43)) [Var (Just (30,35)-(30,36)) "b",Var (Just (30,38)-(30,39)) "x",Var (Just (30,41)-(30,42)) "y"]])) (App (Just (30,49)-(30,65)) (Var (Just (30,50)-(30,54)) "eval") [Tuple (Just (30,55)-(30,64)) [Var (Just (30,56)-(30,57)) "c",Var (Just (30,59)-(30,60)) "x",Var (Just (30,62)-(30,63)) "y"]])) (Bop (Just (31,8)-(31,68)) FPlus (Bop (Just (31,9)-(31,47)) FPlus (App (Just (31,10)-(31,26)) (Var (Just (31,11)-(31,15)) "eval") [Tuple (Just (31,16)-(31,25)) [Var (Just (31,17)-(31,18)) "a",Var (Just (31,20)-(31,21)) "x",Var (Just (31,23)-(31,24)) "y"]]) (App (Just (31,30)-(31,46)) (Var (Just (31,31)-(31,35)) "eval") [Tuple (Just (31,36)-(31,45)) [Var (Just (31,37)-(31,38)) "b",Var (Just (31,40)-(31,41)) "x",Var (Just (31,43)-(31,44)) "y"]])) (App (Just (31,51)-(31,67)) (Var (Just (31,52)-(31,56)) "eval") [Tuple (Just (31,57)-(31,66)) [Var (Just (31,58)-(31,59)) "c",Var (Just (31,61)-(31,62)) "x",Var (Just (31,64)-(31,65)) "y"]]))
*)

(* typed spans
(30,6)-(31,68)
*)

(* correct types
float
*)

(* bad types
float
*)
