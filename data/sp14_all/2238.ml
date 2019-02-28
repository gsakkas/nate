
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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) * (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) * (eval (u, x, y))) / 2
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;


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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(19,19)-(19,54)
eval (t , x , y) *. eval (u , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,21)-(20,62)
(eval (t , x , y) *. eval (u , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (19,19)-(19,55)) FTimes (App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,24)) "eval") [Tuple (Just (19,25)-(19,34)) [Var (Just (19,26)-(19,27)) "t",Var (Just (19,29)-(19,30)) "x",Var (Just (19,32)-(19,33)) "y"]]) (App (Just (19,39)-(19,55)) (Var (Just (19,40)-(19,44)) "eval") [Tuple (Just (19,45)-(19,54)) [Var (Just (19,46)-(19,47)) "u",Var (Just (19,49)-(19,50)) "x",Var (Just (19,52)-(19,53)) "y"]])
Bop (Just (20,21)-(20,66)) FDiv (Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,22)-(20,38)) (Var (Just (20,23)-(20,27)) "eval") [Tuple (Just (20,28)-(20,37)) [Var (Just (20,29)-(20,30)) "t",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,58)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,57)) [Var (Just (20,49)-(20,50)) "u",Var (Just (20,52)-(20,53)) "x",Var (Just (20,55)-(20,56)) "y"]])) (Lit (Just (20,63)-(20,66)) (LD 2.0))
*)

(* typed spans
(19,19)-(19,55)
(20,21)-(20,66)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
