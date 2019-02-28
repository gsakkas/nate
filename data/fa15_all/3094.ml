
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
  | Sine expr -> sin (pi * (eval (expr, x, y)))
  | Cosine expr -> cos (pi * (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) + (eval (expr2, x, y))) / 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) * (eval (expr2, x, y));;


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
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(17,21)-(17,47)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,23)-(18,49)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(20,6)-(20,55)
(eval (expr1 , x , y) +. eval (expr2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(21,27)-(21,70)
2.0
LitG

(21,27)-(21,47)
eval (expr1 , x , y) *. eval (expr2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,21)-(17,48)) FTimes (Var (Just (17,22)-(17,24)) "pi") (App (Just (17,28)-(17,47)) (Var (Just (17,29)-(17,33)) "eval") [Tuple (Just (17,34)-(17,46)) [Var (Just (17,35)-(17,39)) "expr",Var (Just (17,41)-(17,42)) "x",Var (Just (17,44)-(17,45)) "y"]])
Bop (Just (18,23)-(18,50)) FTimes (Var (Just (18,24)-(18,26)) "pi") (App (Just (18,30)-(18,49)) (Var (Just (18,31)-(18,35)) "eval") [Tuple (Just (18,36)-(18,48)) [Var (Just (18,37)-(18,41)) "expr",Var (Just (18,43)-(18,44)) "x",Var (Just (18,46)-(18,47)) "y"]])
Bop (Just (20,6)-(20,59)) FDiv (Bop (Just (20,6)-(20,52)) FPlus (App (Just (20,7)-(20,27)) (Var (Just (20,8)-(20,12)) "eval") [Tuple (Just (20,13)-(20,26)) [Var (Just (20,14)-(20,19)) "expr1",Var (Just (20,21)-(20,22)) "x",Var (Just (20,24)-(20,25)) "y"]]) (App (Just (20,31)-(20,51)) (Var (Just (20,32)-(20,36)) "eval") [Tuple (Just (20,37)-(20,50)) [Var (Just (20,38)-(20,43)) "expr2",Var (Just (20,45)-(20,46)) "x",Var (Just (20,48)-(20,49)) "y"]])) (Lit (Just (20,56)-(20,59)) (LD 2.0))
Lit (Just (20,56)-(20,59)) (LD 2.0)
Bop (Just (21,27)-(21,71)) FTimes (App (Just (21,27)-(21,47)) (Var (Just (21,28)-(21,32)) "eval") [Tuple (Just (21,33)-(21,46)) [Var (Just (21,34)-(21,39)) "expr1",Var (Just (21,41)-(21,42)) "x",Var (Just (21,44)-(21,45)) "y"]]) (App (Just (21,51)-(21,71)) (Var (Just (21,52)-(21,56)) "eval") [Tuple (Just (21,57)-(21,70)) [Var (Just (21,58)-(21,63)) "expr2",Var (Just (21,65)-(21,66)) "x",Var (Just (21,68)-(21,69)) "y"]])
*)

(* typed spans
(17,21)-(17,48)
(18,23)-(18,50)
(20,6)-(20,59)
(20,56)-(20,59)
(21,27)-(21,71)
*)

(* correct types
float
float
float
float
float
*)

(* bad types
int
int
int
int
int
*)
