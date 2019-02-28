
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
      ((Cosine (eval (e1, x, y))) *. (Sine (eval (e2, x, y)))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> Sine ((eval (e, x, y)) *. 0.5);;


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
      ((cos (pi *. (eval (e1, x, y)))) *. (sin (pi *. (eval (e2, x, y))))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> sin ((pi *. (eval (e, x, y))) *. 0.5);;

*)

(* changed spans
(28,7)-(28,33)
cos (pi *. eval (e1 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(28,37)-(28,61)
sin (pi *. eval (e2 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(28,37)-(28,61)
sin
VarG

(28,44)-(28,48)
pi *. eval (e2 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(30,17)-(30,47)
sin ((pi *. eval (e , x , y)) *. 0.5)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (28,7)-(28,38)) (Var (Just (28,8)-(28,11)) "cos") [Bop (Just (28,12)-(28,37)) FTimes (Var (Just (28,13)-(28,15)) "pi") (App (Just (28,19)-(28,36)) (Var (Just (28,20)-(28,24)) "eval") [Tuple (Just (28,25)-(28,35)) [Var (Just (28,26)-(28,28)) "e1",Var (Just (28,30)-(28,31)) "x",Var (Just (28,33)-(28,34)) "y"]])]
App (Just (28,42)-(28,73)) (Var (Just (28,43)-(28,46)) "sin") [Bop (Just (28,47)-(28,72)) FTimes (Var (Just (28,48)-(28,50)) "pi") (App (Just (28,54)-(28,71)) (Var (Just (28,55)-(28,59)) "eval") [Tuple (Just (28,60)-(28,70)) [Var (Just (28,61)-(28,63)) "e2",Var (Just (28,65)-(28,66)) "x",Var (Just (28,68)-(28,69)) "y"]])]
Var (Just (28,43)-(28,46)) "sin"
Bop (Just (28,47)-(28,72)) FTimes (Var (Just (28,48)-(28,50)) "pi") (App (Just (28,54)-(28,71)) (Var (Just (28,55)-(28,59)) "eval") [Tuple (Just (28,60)-(28,70)) [Var (Just (28,61)-(28,63)) "e2",Var (Just (28,65)-(28,66)) "x",Var (Just (28,68)-(28,69)) "y"]])
App (Just (30,17)-(30,54)) (Var (Just (30,17)-(30,20)) "sin") [Bop (Just (30,21)-(30,54)) FTimes (Bop (Just (30,22)-(30,46)) FTimes (Var (Just (30,23)-(30,25)) "pi") (App (Just (30,29)-(30,45)) (Var (Just (30,30)-(30,34)) "eval") [Tuple (Just (30,35)-(30,44)) [Var (Just (30,36)-(30,37)) "e",Var (Just (30,39)-(30,40)) "x",Var (Just (30,42)-(30,43)) "y"]])) (Lit (Just (30,50)-(30,53)) (LD 0.5))]
*)

(* typed spans
(28,7)-(28,38)
(28,42)-(28,73)
(28,43)-(28,46)
(28,47)-(28,72)
(30,17)-(30,54)
*)

(* correct types
float
float
float -> float
float
float
*)

(* bad types
expr
expr
expr
(expr * float * float) -> float
expr
*)
