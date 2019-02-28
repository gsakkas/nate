
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) / 30) +. ((eval (r, x, y)) / (eval (s, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) /. 30.0) +. ((eval (r, x, y)) /. (eval (s, x, y)));;

*)

(* changed spans
(27,6)-(27,29)
eval (t , x , y) /. 30.0
BopG (AppG (fromList [EmptyG])) LitG

(27,34)-(27,50)
eval (r , x , y) /. eval (s , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (27,6)-(27,32)) FDiv (App (Just (27,7)-(27,23)) (Var (Just (27,8)-(27,12)) "eval") [Tuple (Just (27,13)-(27,22)) [Var (Just (27,14)-(27,15)) "t",Var (Just (27,17)-(27,18)) "x",Var (Just (27,20)-(27,21)) "y"]]) (Lit (Just (27,27)-(27,31)) (LD 30.0))
Bop (Just (27,36)-(27,74)) FDiv (App (Just (27,37)-(27,53)) (Var (Just (27,38)-(27,42)) "eval") [Tuple (Just (27,43)-(27,52)) [Var (Just (27,44)-(27,45)) "r",Var (Just (27,47)-(27,48)) "x",Var (Just (27,50)-(27,51)) "y"]]) (App (Just (27,57)-(27,73)) (Var (Just (27,58)-(27,62)) "eval") [Tuple (Just (27,63)-(27,72)) [Var (Just (27,64)-(27,65)) "s",Var (Just (27,67)-(27,68)) "x",Var (Just (27,70)-(27,71)) "y"]])
*)

(* typed spans
(27,6)-(27,32)
(27,36)-(27,74)
*)

(* correct types
float
float
*)

(* bad types
int
float
*)
