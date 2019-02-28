
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = (eval (m, x, y)) * (eval (n, x, y)) in
      if d > 0.0 then d /. d else d /. (eval (o, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = (eval (m, x, y)) *. (eval (n, x, y)) in
      if d > 0.0 then d /. d else d /. (eval (o, x, y));;

*)

(* changed spans
(33,14)-(33,49)
eval (m , x , y) *. eval (n , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (33,14)-(33,50)) FTimes (App (Just (33,14)-(33,30)) (Var (Just (33,15)-(33,19)) "eval") [Tuple (Just (33,20)-(33,29)) [Var (Just (33,21)-(33,22)) "m",Var (Just (33,24)-(33,25)) "x",Var (Just (33,27)-(33,28)) "y"]]) (App (Just (33,34)-(33,50)) (Var (Just (33,35)-(33,39)) "eval") [Tuple (Just (33,40)-(33,49)) [Var (Just (33,41)-(33,42)) "n",Var (Just (33,44)-(33,45)) "x",Var (Just (33,47)-(33,48)) "y"]])
*)

(* typed spans
(33,14)-(33,50)
*)

(* correct types
float
*)

(* bad types
int
*)
