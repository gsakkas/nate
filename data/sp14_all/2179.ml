
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
      (eval ((a, x, y) *. (a, x, y))) + ((b, x, y) *. (c, x, y));;


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
      ((eval (a, x, y)) *. (eval (a, x, y))) +.
        ((eval (b, x, y)) *. (eval (c, x, y)));;

*)

(* changed spans
(28,6)-(28,64)
(eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (c , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (28,6)-(29,46)) FPlus (Bop (Just (28,6)-(28,44)) FTimes (App (Just (28,7)-(28,23)) (Var (Just (28,8)-(28,12)) "eval") [Tuple (Just (28,13)-(28,22)) [Var (Just (28,14)-(28,15)) "a",Var (Just (28,17)-(28,18)) "x",Var (Just (28,20)-(28,21)) "y"]]) (App (Just (28,27)-(28,43)) (Var (Just (28,28)-(28,32)) "eval") [Tuple (Just (28,33)-(28,42)) [Var (Just (28,34)-(28,35)) "a",Var (Just (28,37)-(28,38)) "x",Var (Just (28,40)-(28,41)) "y"]])) (Bop (Just (29,8)-(29,46)) FTimes (App (Just (29,9)-(29,25)) (Var (Just (29,10)-(29,14)) "eval") [Tuple (Just (29,15)-(29,24)) [Var (Just (29,16)-(29,17)) "b",Var (Just (29,19)-(29,20)) "x",Var (Just (29,22)-(29,23)) "y"]]) (App (Just (29,29)-(29,45)) (Var (Just (29,30)-(29,34)) "eval") [Tuple (Just (29,35)-(29,44)) [Var (Just (29,36)-(29,37)) "c",Var (Just (29,39)-(29,40)) "x",Var (Just (29,42)-(29,43)) "y"]]))
*)

(* typed spans
(28,6)-(29,46)
*)

(* correct types
float
*)

(* bad types
int
*)
