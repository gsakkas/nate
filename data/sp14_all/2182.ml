
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (c, x, y))))
        / 2
  | Tan a -> (sin (pi *. (eval (a, x, y)))) /. (cos (pi *. (eval (a, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (c, x, y))))
        /. 2.0
  | Tan a -> (sin (pi *. (eval (a, x, y)))) /. (cos (pi *. (eval (a, x, y))));;

*)

(* changed spans
(28,6)-(30,11)
((eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (c , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (28,6)-(30,14)) FDiv (Bop (Just (28,6)-(29,48)) FPlus (Bop (Just (28,7)-(28,45)) FTimes (App (Just (28,8)-(28,24)) (Var (Just (28,9)-(28,13)) "eval") [Tuple (Just (28,14)-(28,23)) [Var (Just (28,15)-(28,16)) "a",Var (Just (28,18)-(28,19)) "x",Var (Just (28,21)-(28,22)) "y"]]) (App (Just (28,28)-(28,44)) (Var (Just (28,29)-(28,33)) "eval") [Tuple (Just (28,34)-(28,43)) [Var (Just (28,35)-(28,36)) "a",Var (Just (28,38)-(28,39)) "x",Var (Just (28,41)-(28,42)) "y"]])) (Bop (Just (29,9)-(29,47)) FTimes (App (Just (29,10)-(29,26)) (Var (Just (29,11)-(29,15)) "eval") [Tuple (Just (29,16)-(29,25)) [Var (Just (29,17)-(29,18)) "b",Var (Just (29,20)-(29,21)) "x",Var (Just (29,23)-(29,24)) "y"]]) (App (Just (29,30)-(29,46)) (Var (Just (29,31)-(29,35)) "eval") [Tuple (Just (29,36)-(29,45)) [Var (Just (29,37)-(29,38)) "c",Var (Just (29,40)-(29,41)) "x",Var (Just (29,43)-(29,44)) "y"]]))) (Lit (Just (30,11)-(30,14)) (LD 2.0))
*)

(* typed spans
(28,6)-(30,14)
*)

(* correct types
float
*)

(* bad types
int
*)
