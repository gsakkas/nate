
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sigmoid a -> 1 /. (1 - (exp ((-1) *. a)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sigmoid a -> 1. /. (1. -. (exp ((-1.) *. (eval (a, x, y)))))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(20,22)-(20,45)
1.0
LitG

(20,27)-(20,44)
1.0 -. exp ((- 1.0) *. eval (a , x , y))
BopG LitG (AppG (fromList [EmptyG]))

(20,33)-(20,37)
(- 1.0)
UopG LitG

(20,41)-(20,42)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(21,21)-(21,65)
x
VarG

(21,21)-(21,65)
y
VarG

*)

(* changed exprs
Lit (Just (20,17)-(20,19)) (LD 1.0)
Bop (Just (20,23)-(20,64)) FMinus (Lit (Just (20,24)-(20,26)) (LD 1.0)) (App (Just (20,30)-(20,63)) (Var (Just (20,31)-(20,34)) "exp") [Bop (Just (20,35)-(20,62)) FTimes (Uop (Just (20,36)-(20,41)) Neg (Lit (Just (20,38)-(20,40)) (LD 1.0))) (App (Just (20,45)-(20,61)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,60)) [Var (Just (20,52)-(20,53)) "a",Var (Just (20,55)-(20,56)) "x",Var (Just (20,58)-(20,59)) "y"]])])
Uop (Just (20,36)-(20,41)) Neg (Lit (Just (20,38)-(20,40)) (LD 1.0))
App (Just (20,45)-(20,61)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,60)) [Var (Just (20,52)-(20,53)) "a",Var (Just (20,55)-(20,56)) "x",Var (Just (20,58)-(20,59)) "y"]]
Var (Just (20,55)-(20,56)) "x"
Var (Just (20,58)-(20,59)) "y"
*)

(* typed spans
(20,17)-(20,19)
(20,23)-(20,64)
(20,36)-(20,41)
(20,45)-(20,61)
(20,55)-(20,56)
(20,58)-(20,59)
*)

(* correct types
float
float
int
float
float
float
*)

(* bad types
int
float -> float
int
expr
float
float
*)
