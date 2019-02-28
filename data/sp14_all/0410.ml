
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
  | Sigmoid a -> 1. /. (1. -. (exp (- a)))
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
(20,35)-(20,40)
(- 1.0) *. eval (a , x , y)
BopG (UopG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (20,35)-(20,62)) FTimes (Uop (Just (20,36)-(20,41)) Neg (Lit (Just (20,38)-(20,40)) (LD 1.0))) (App (Just (20,45)-(20,61)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,60)) [Var (Just (20,52)-(20,53)) "a",Var (Just (20,55)-(20,56)) "x",Var (Just (20,58)-(20,59)) "y"]])
*)

(* typed spans
(20,35)-(20,62)
*)

(* correct types
float
*)

(* bad types
int
*)
