
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | VarY  -> y
  | VarX  -> x
  | Abs a ->
      if (eval (a, x, y) a) < 0
      then (eval (a, x, y)) *. (-1.0)
      else eval (a, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | VarY  -> y
  | VarX  -> x
  | Abs a ->
      if (eval (a, x, y)) < 0.0
      then (eval (a, x, y)) *. (-1.0)
      else eval (a, x, y);;

*)

(* changed spans
(27,9)-(27,27)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,30)-(27,31)
0.0
LitG

*)

(* changed exprs
App (Just (27,9)-(27,25)) (Var (Just (27,10)-(27,14)) "eval") [Tuple (Just (27,15)-(27,24)) [Var (Just (27,16)-(27,17)) "a",Var (Just (27,19)-(27,20)) "x",Var (Just (27,22)-(27,23)) "y"]]
Lit (Just (27,28)-(27,31)) (LD 0.0)
*)

(* typed spans
(27,9)-(27,25)
(27,28)-(27,31)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
