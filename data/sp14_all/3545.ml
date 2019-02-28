
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
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2
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
(20,23)-(20,62)
2.0
LitG

(20,23)-(20,41)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lit (Just (19,71)-(19,73)) (LD 2.0)
Bop (Just (20,23)-(20,63)) FTimes (App (Just (20,23)-(20,41)) (Var (Just (20,24)-(20,28)) "eval") [Tuple (Just (20,29)-(20,40)) [Var (Just (20,30)-(20,33)) "ex1",Var (Just (20,35)-(20,36)) "x",Var (Just (20,38)-(20,39)) "y"]]) (App (Just (20,45)-(20,63)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,62)) [Var (Just (20,52)-(20,55)) "ex2",Var (Just (20,57)-(20,58)) "x",Var (Just (20,60)-(20,61)) "y"]])
*)

(* typed spans
(19,71)-(19,73)
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
