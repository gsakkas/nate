
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

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
  | SquareAv (a,b) -> ((a *. a) +. (b *. b)) / 2.0
  | MultHalf (a,b,c) -> ((a *. b) *. c) / 2.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

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
  | SquareAv (a,b) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (b, x, y))))
        /. 2.0
  | MultHalf (a,b,c) ->
      (((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))) /. 2.0;;

*)

(* changed spans
(27,22)-(27,50)
((eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (b , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,24)-(28,45)
((eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (28,6)-(30,14)) FDiv (Bop (Just (28,6)-(29,48)) FPlus (Bop (Just (28,7)-(28,45)) FTimes (App (Just (28,8)-(28,24)) (Var (Just (28,9)-(28,13)) "eval") [Tuple (Just (28,14)-(28,23)) [Var (Just (28,15)-(28,16)) "a",Var (Just (28,18)-(28,19)) "x",Var (Just (28,21)-(28,22)) "y"]]) (App (Just (28,28)-(28,44)) (Var (Just (28,29)-(28,33)) "eval") [Tuple (Just (28,34)-(28,43)) [Var (Just (28,35)-(28,36)) "a",Var (Just (28,38)-(28,39)) "x",Var (Just (28,41)-(28,42)) "y"]])) (Bop (Just (29,9)-(29,47)) FTimes (App (Just (29,10)-(29,26)) (Var (Just (29,11)-(29,15)) "eval") [Tuple (Just (29,16)-(29,25)) [Var (Just (29,17)-(29,18)) "b",Var (Just (29,20)-(29,21)) "x",Var (Just (29,23)-(29,24)) "y"]]) (App (Just (29,30)-(29,46)) (Var (Just (29,31)-(29,35)) "eval") [Tuple (Just (29,36)-(29,45)) [Var (Just (29,37)-(29,38)) "b",Var (Just (29,40)-(29,41)) "x",Var (Just (29,43)-(29,44)) "y"]]))) (Lit (Just (30,11)-(30,14)) (LD 2.0))
Bop (Just (32,6)-(32,73)) FDiv (Bop (Just (32,6)-(32,66)) FTimes (Bop (Just (32,7)-(32,45)) FTimes (App (Just (32,8)-(32,24)) (Var (Just (32,9)-(32,13)) "eval") [Tuple (Just (32,14)-(32,23)) [Var (Just (32,15)-(32,16)) "a",Var (Just (32,18)-(32,19)) "x",Var (Just (32,21)-(32,22)) "y"]]) (App (Just (32,28)-(32,44)) (Var (Just (32,29)-(32,33)) "eval") [Tuple (Just (32,34)-(32,43)) [Var (Just (32,35)-(32,36)) "b",Var (Just (32,38)-(32,39)) "x",Var (Just (32,41)-(32,42)) "y"]])) (App (Just (32,49)-(32,65)) (Var (Just (32,50)-(32,54)) "eval") [Tuple (Just (32,55)-(32,64)) [Var (Just (32,56)-(32,57)) "c",Var (Just (32,59)-(32,60)) "x",Var (Just (32,62)-(32,63)) "y"]])) (Lit (Just (32,70)-(32,73)) (LD 2.0))
*)

(* typed spans
(28,6)-(30,14)
(32,6)-(32,73)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
