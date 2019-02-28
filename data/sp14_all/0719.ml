
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
  | Sine expr -> sin (pi *. (eval expr x y))
  | Cosine expr -> cos (pi *. (eval expr x y))
  | Average (expr,expr1) -> ((eval expr x y) +. (eval expr1 x y)) /. 2
  | Times (expr,expr1) -> (eval expr x y) *. (eval expr1 x y)
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval expr x y) < (eval expr1 x y)
      then eval expr2 x y
      else eval expr3 x y;;


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
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr,expr1) -> (eval (expr, x, y)) +. (eval (expr1, x, y))
  | Times (expr,expr1) -> (eval (expr, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr,expr1,expr2,expr3) ->
      if (eval (expr, x, y)) < (eval (expr1, x, y))
      then eval (expr2, x, y)
      else eval (expr3, x, y);;

*)

(* changed spans
(17,28)-(17,43)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,30)-(18,45)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,28)-(19,70)
eval (expr , x , y) +. eval (expr1 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,28)-(19,70)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,49)-(19,53)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,54)-(19,59)
(expr1 , x , y)
TupleG (fromList [VarG])

(20,26)-(20,41)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,45)-(20,61)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,9)-(22,24)
eval (expr , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,27)-(22,43)
eval (expr1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,11)-(23,25)
eval (expr2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,11)-(24,25)
eval (expr3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (17,28)-(17,47)) (Var (Just (17,29)-(17,33)) "eval") [Tuple (Just (17,34)-(17,46)) [Var (Just (17,35)-(17,39)) "expr",Var (Just (17,41)-(17,42)) "x",Var (Just (17,44)-(17,45)) "y"]]
App (Just (18,30)-(18,49)) (Var (Just (18,31)-(18,35)) "eval") [Tuple (Just (18,36)-(18,48)) [Var (Just (18,37)-(18,41)) "expr",Var (Just (18,43)-(18,44)) "x",Var (Just (18,46)-(18,47)) "y"]]
Bop (Just (19,28)-(19,71)) FPlus (App (Just (19,28)-(19,47)) (Var (Just (19,29)-(19,33)) "eval") [Tuple (Just (19,34)-(19,46)) [Var (Just (19,35)-(19,39)) "expr",Var (Just (19,41)-(19,42)) "x",Var (Just (19,44)-(19,45)) "y"]]) (App (Just (19,51)-(19,71)) (Var (Just (19,52)-(19,56)) "eval") [Tuple (Just (19,57)-(19,70)) [Var (Just (19,58)-(19,63)) "expr1",Var (Just (19,65)-(19,66)) "x",Var (Just (19,68)-(19,69)) "y"]])
App (Just (19,28)-(19,47)) (Var (Just (19,29)-(19,33)) "eval") [Tuple (Just (19,34)-(19,46)) [Var (Just (19,35)-(19,39)) "expr",Var (Just (19,41)-(19,42)) "x",Var (Just (19,44)-(19,45)) "y"]]
App (Just (19,51)-(19,71)) (Var (Just (19,52)-(19,56)) "eval") [Tuple (Just (19,57)-(19,70)) [Var (Just (19,58)-(19,63)) "expr1",Var (Just (19,65)-(19,66)) "x",Var (Just (19,68)-(19,69)) "y"]]
Tuple (Just (19,57)-(19,70)) [Var (Just (19,58)-(19,63)) "expr1",Var (Just (19,65)-(19,66)) "x",Var (Just (19,68)-(19,69)) "y"]
App (Just (20,26)-(20,45)) (Var (Just (20,27)-(20,31)) "eval") [Tuple (Just (20,32)-(20,44)) [Var (Just (20,33)-(20,37)) "expr",Var (Just (20,39)-(20,40)) "x",Var (Just (20,42)-(20,43)) "y"]]
App (Just (20,49)-(20,69)) (Var (Just (20,50)-(20,54)) "eval") [Tuple (Just (20,55)-(20,68)) [Var (Just (20,56)-(20,61)) "expr1",Var (Just (20,63)-(20,64)) "x",Var (Just (20,66)-(20,67)) "y"]]
App (Just (22,9)-(22,28)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,27)) [Var (Just (22,16)-(22,20)) "expr",Var (Just (22,22)-(22,23)) "x",Var (Just (22,25)-(22,26)) "y"]]
App (Just (22,31)-(22,51)) (Var (Just (22,32)-(22,36)) "eval") [Tuple (Just (22,37)-(22,50)) [Var (Just (22,38)-(22,43)) "expr1",Var (Just (22,45)-(22,46)) "x",Var (Just (22,48)-(22,49)) "y"]]
App (Just (23,11)-(23,29)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,29)) [Var (Just (23,17)-(23,22)) "expr2",Var (Just (23,24)-(23,25)) "x",Var (Just (23,27)-(23,28)) "y"]]
App (Just (24,11)-(24,29)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,29)) [Var (Just (24,17)-(24,22)) "expr3",Var (Just (24,24)-(24,25)) "x",Var (Just (24,27)-(24,28)) "y"]]
*)

(* typed spans
(17,28)-(17,47)
(18,30)-(18,49)
(19,28)-(19,71)
(19,28)-(19,47)
(19,51)-(19,71)
(19,57)-(19,70)
(20,26)-(20,45)
(20,49)-(20,69)
(22,9)-(22,28)
(22,31)-(22,51)
(23,11)-(23,29)
(24,11)-(24,29)
*)

(* correct types
float
float
float
float
float
(expr * float * float)
float
float
float
float
float
float
*)

(* bad types
float
float
float
float
expr -> float -> float -> float
expr
float
float
float
float
float
float
*)
