
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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) + (eval (ex2, x, y))) / 2
  | Times (ex1,ex2) -> (eval (ex1, x, y)) * (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;

*)

(* changed spans
(19,25)-(19,70)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,23)-(20,41)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (19,25)-(19,73)) FDiv (Bop (Just (19,25)-(19,67)) FPlus (App (Just (19,26)-(19,44)) (Var (Just (19,27)-(19,31)) "eval") [Tuple (Just (19,32)-(19,43)) [Var (Just (19,33)-(19,36)) "ex1",Var (Just (19,38)-(19,39)) "x",Var (Just (19,41)-(19,42)) "y"]]) (App (Just (19,48)-(19,66)) (Var (Just (19,49)-(19,53)) "eval") [Tuple (Just (19,54)-(19,65)) [Var (Just (19,55)-(19,58)) "ex2",Var (Just (19,60)-(19,61)) "x",Var (Just (19,63)-(19,64)) "y"]])) (Lit (Just (19,71)-(19,73)) (LD 2.0))
Bop (Just (20,23)-(20,63)) FTimes (App (Just (20,23)-(20,41)) (Var (Just (20,24)-(20,28)) "eval") [Tuple (Just (20,29)-(20,40)) [Var (Just (20,30)-(20,33)) "ex1",Var (Just (20,35)-(20,36)) "x",Var (Just (20,38)-(20,39)) "y"]]) (App (Just (20,45)-(20,63)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,62)) [Var (Just (20,52)-(20,55)) "ex2",Var (Just (20,57)-(20,58)) "x",Var (Just (20,60)-(20,61)) "y"]])
*)

(* typed spans
(19,25)-(19,73)
(20,23)-(20,63)
*)

(* correct types
float
float
*)

(* bad types
int
float
*)
