
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval e1)) *. (asin (eval e2))) *. 2.0) /. (pi *. pi);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi);;

*)

(* changed spans
(27,20)-(27,22)
(e1 , x , y)
TupleG (fromList [VarG])

(27,40)-(27,42)
(e2 , x , y)
TupleG (fromList [VarG])

(27,49)-(27,52)
x
VarG

(27,49)-(27,52)
y
VarG

*)

(* changed exprs
Tuple (Just (27,20)-(27,30)) [Var (Just (27,21)-(27,23)) "e1",Var (Just (27,25)-(27,26)) "x",Var (Just (27,28)-(27,29)) "y"]
Tuple (Just (27,48)-(27,58)) [Var (Just (27,49)-(27,51)) "e2",Var (Just (27,53)-(27,54)) "x",Var (Just (27,56)-(27,57)) "y"]
Var (Just (27,53)-(27,54)) "x"
Var (Just (27,56)-(27,57)) "y"
*)

(* typed spans
(27,20)-(27,30)
(27,48)-(27,58)
(27,53)-(27,54)
(27,56)-(27,57)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
*)

(* bad types
expr
expr
float
float
*)
