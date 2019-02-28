
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
  | MyExpr1 (e1,e2,e3) -> ((sqrt e1) *. (sqrt e2)) *. e3
  | MyExpr2 e -> e *. 0.5;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
  | MyExpr1 (e1,e2,e3) ->
      ((sqrt (eval (e1, x, y))) *. (sqrt (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> (eval (e, x, y)) *. 0.5;;

*)

(* changed spans
(27,33)-(27,35)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,46)-(27,48)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,54)-(27,56)
x
VarG

(27,54)-(27,56)
y
VarG

(27,54)-(27,56)
eval (e3 , x , y)
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
App (Just (28,13)-(28,30)) (Var (Just (28,14)-(28,18)) "eval") [Tuple (Just (28,19)-(28,29)) [Var (Just (28,20)-(28,22)) "e1",Var (Just (28,24)-(28,25)) "x",Var (Just (28,27)-(28,28)) "y"]]
App (Just (28,41)-(28,58)) (Var (Just (28,42)-(28,46)) "eval") [Tuple (Just (28,47)-(28,57)) [Var (Just (28,48)-(28,50)) "e2",Var (Just (28,52)-(28,53)) "x",Var (Just (28,55)-(28,56)) "y"]]
Var (Just (28,52)-(28,53)) "x"
Var (Just (28,55)-(28,56)) "y"
App (Just (29,8)-(29,25)) (Var (Just (29,9)-(29,13)) "eval") [Tuple (Just (29,14)-(29,24)) [Var (Just (29,15)-(29,17)) "e3",Var (Just (29,19)-(29,20)) "x",Var (Just (29,22)-(29,23)) "y"]]
Var (Just (29,19)-(29,20)) "x"
Var (Just (29,22)-(29,23)) "y"
App (Just (30,17)-(30,33)) (Var (Just (30,18)-(30,22)) "eval") [Tuple (Just (30,23)-(30,32)) [Var (Just (30,24)-(30,25)) "e",Var (Just (30,27)-(30,28)) "x",Var (Just (30,30)-(30,31)) "y"]]
Var (Just (30,27)-(30,28)) "x"
Var (Just (30,30)-(30,31)) "y"
*)

(* typed spans
(28,13)-(28,30)
(28,41)-(28,58)
(28,52)-(28,53)
(28,55)-(28,56)
(29,8)-(29,25)
(29,19)-(29,20)
(29,22)-(29,23)
(30,17)-(30,33)
(30,27)-(30,28)
(30,30)-(30,31)
*)

(* correct types
float
float
float
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
expr
expr
expr
float
float
expr
float
float
*)
