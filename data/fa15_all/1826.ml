
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Quarter of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e -> e *. e
  | Quarter e -> e /. 4.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Quarter of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Square e -> (eval (e, x, y)) *. (eval (e, x, y))
  | Quarter e -> (eval (e, x, y)) /. 4.0;;

*)

(* changed spans
(27,16)-(27,17)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,21)-(27,22)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,17)-(28,25)
x
VarG

(28,17)-(28,25)
y
VarG

(28,17)-(28,18)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,22)-(28,25)
x
VarG

(28,22)-(28,25)
y
VarG

*)

(* changed exprs
App (Just (27,16)-(27,32)) (Var (Just (27,17)-(27,21)) "eval") [Tuple (Just (27,22)-(27,31)) [Var (Just (27,23)-(27,24)) "e",Var (Just (27,26)-(27,27)) "x",Var (Just (27,29)-(27,30)) "y"]]
App (Just (27,36)-(27,52)) (Var (Just (27,37)-(27,41)) "eval") [Tuple (Just (27,42)-(27,51)) [Var (Just (27,43)-(27,44)) "e",Var (Just (27,46)-(27,47)) "x",Var (Just (27,49)-(27,50)) "y"]]
Var (Just (27,46)-(27,47)) "x"
Var (Just (27,49)-(27,50)) "y"
App (Just (28,17)-(28,33)) (Var (Just (28,18)-(28,22)) "eval") [Tuple (Just (28,23)-(28,32)) [Var (Just (28,24)-(28,25)) "e",Var (Just (28,27)-(28,28)) "x",Var (Just (28,30)-(28,31)) "y"]]
Var (Just (28,27)-(28,28)) "x"
Var (Just (28,30)-(28,31)) "y"
*)

(* typed spans
(27,16)-(27,32)
(27,36)-(27,52)
(27,46)-(27,47)
(27,49)-(27,50)
(28,17)-(28,33)
(28,27)-(28,28)
(28,30)-(28,31)
*)

(* correct types
float
float
float
float
float
float
float
*)

(* bad types
expr
expr
float
float
expr
float
float
*)
