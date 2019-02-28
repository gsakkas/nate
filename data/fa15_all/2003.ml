
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
      let d = (eval (m, x, y)) ** (eval (n, x, y)) in
      if (d > 1.0) || (d < (-1.0)) then 1.0
  | Op (m,n,o) ->
      let d =
        (((eval (m, x, y)) *. (eval (n, x, y))) *. (eval (o, x, y))) /.
          (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;


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
      let d =
        (((eval (m, x, y)) *. (eval (n, x, y))) *. (eval (o, x, y))) /.
          (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;

*)

(* changed spans
(28,14)-(28,50)
eval (n , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,14)-(28,50)
if d > 1.0
then eval (m , x , y)
else eval (m , x , y) ** eval (n , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
App (Just (28,14)-(28,28)) (Var (Just (28,14)-(28,18)) "eval") [Tuple (Just (28,19)-(28,28)) [Var (Just (28,20)-(28,21)) "n",Var (Just (28,23)-(28,24)) "x",Var (Just (28,26)-(28,27)) "y"]]
Ite (Just (29,6)-(31,47)) (Bop (Just (29,9)-(29,16)) Gt (Var (Just (29,9)-(29,10)) "d") (Lit (Just (29,13)-(29,16)) (LD 1.0))) (App (Just (30,11)-(30,25)) (Var (Just (30,11)-(30,15)) "eval") [Tuple (Just (30,16)-(30,25)) [Var (Just (30,17)-(30,18)) "m",Var (Just (30,20)-(30,21)) "x",Var (Just (30,23)-(30,24)) "y"]]) (App (Just (31,11)-(31,47)) (Var (Just (31,28)-(31,30)) "**") [App (Just (31,11)-(31,27)) (Var (Just (31,12)-(31,16)) "eval") [Tuple (Just (31,17)-(31,26)) [Var (Just (31,18)-(31,19)) "m",Var (Just (31,21)-(31,22)) "x",Var (Just (31,24)-(31,25)) "y"]],App (Just (31,31)-(31,47)) (Var (Just (31,32)-(31,36)) "eval") [Tuple (Just (31,37)-(31,46)) [Var (Just (31,38)-(31,39)) "n",Var (Just (31,41)-(31,42)) "x",Var (Just (31,44)-(31,45)) "y"]]])
*)

(* typed spans
(28,14)-(28,28)
(29,6)-(31,47)
*)

(* correct types
float
float
*)

(* bad types
float
float
*)
