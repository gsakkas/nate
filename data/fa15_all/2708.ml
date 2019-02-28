
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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
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
  | Thresh of expr* expr* expr* expr;;

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
      else eval (d, x, y);;

*)

(* changed spans
(19,21)-(19,62)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,19)-(20,35)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (19,21)-(19,66)) FDiv (Bop (Just (19,21)-(19,59)) FPlus (App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "a",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "b",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]])) (Lit (Just (19,63)-(19,66)) (LD 2.0))
Bop (Just (20,19)-(20,55)) FTimes (App (Just (20,19)-(20,35)) (Var (Just (20,20)-(20,24)) "eval") [Tuple (Just (20,25)-(20,34)) [Var (Just (20,26)-(20,27)) "a",Var (Just (20,29)-(20,30)) "x",Var (Just (20,32)-(20,33)) "y"]]) (App (Just (20,39)-(20,55)) (Var (Just (20,40)-(20,44)) "eval") [Tuple (Just (20,45)-(20,54)) [Var (Just (20,46)-(20,47)) "b",Var (Just (20,49)-(20,50)) "x",Var (Just (20,52)-(20,53)) "y"]])
*)

(* typed spans
(19,21)-(19,66)
(20,19)-(20,55)
*)

(* correct types
float
float
*)

(* bad types
int
float
*)
