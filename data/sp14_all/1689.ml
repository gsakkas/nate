
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) * (eval (v, x, y))
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

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(16,19)-(16,54)
eval (v , x , y) *. eval (v , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (16,19)-(16,55)) FTimes (App (Just (16,19)-(16,35)) (Var (Just (16,20)-(16,24)) "eval") [Tuple (Just (16,25)-(16,34)) [Var (Just (16,26)-(16,27)) "v",Var (Just (16,29)-(16,30)) "x",Var (Just (16,32)-(16,33)) "y"]]) (App (Just (16,39)-(16,55)) (Var (Just (16,40)-(16,44)) "eval") [Tuple (Just (16,45)-(16,54)) [Var (Just (16,46)-(16,47)) "v",Var (Just (16,49)-(16,50)) "x",Var (Just (16,52)-(16,53)) "y"]])
*)

(* typed spans
(16,19)-(16,55)
*)

(* correct types
float
*)

(* bad types
int
*)
