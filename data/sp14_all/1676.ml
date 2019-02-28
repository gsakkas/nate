
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos * (pi (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Magic e1 -> sin * (pi (cos (pi *. (eval (e1, x, y)))))
  | Weird (e1,e2,e3) ->
      cos
        ((pi *. (eval (e1, x, y))) *.
           ((eval (e2, x, y)) *. (eval (e3, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Magic e1 -> sin (pi *. (cos (pi *. (eval (e1, x, y)))))
  | Weird (e1,e2,e3) ->
      cos
        ((pi *. (eval (e1, x, y))) *.
           ((eval (e2, x, y)) *. (eval (e3, x, y))));;

*)

(* changed spans
(20,17)-(20,45)
cos (pi *. eval (e1 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(27,16)-(27,58)
sin (pi *. cos (pi *. eval (e1 , x , y)))
AppG (fromList [BopG EmptyG EmptyG])

(27,16)-(27,58)
sin
VarG

(27,23)-(27,25)
pi *. cos (pi *. eval (e1 , x , y))
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
App (Just (20,17)-(20,46)) (Var (Just (20,17)-(20,20)) "cos") [Bop (Just (20,21)-(20,46)) FTimes (Var (Just (20,22)-(20,24)) "pi") (App (Just (20,28)-(20,45)) (Var (Just (20,29)-(20,33)) "eval") [Tuple (Just (20,34)-(20,44)) [Var (Just (20,35)-(20,37)) "e1",Var (Just (20,39)-(20,40)) "x",Var (Just (20,42)-(20,43)) "y"]])]
App (Just (27,16)-(27,59)) (Var (Just (27,16)-(27,19)) "sin") [Bop (Just (27,20)-(27,59)) FTimes (Var (Just (27,21)-(27,23)) "pi") (App (Just (27,27)-(27,58)) (Var (Just (27,28)-(27,31)) "cos") [Bop (Just (27,32)-(27,57)) FTimes (Var (Just (27,33)-(27,35)) "pi") (App (Just (27,39)-(27,56)) (Var (Just (27,40)-(27,44)) "eval") [Tuple (Just (27,45)-(27,55)) [Var (Just (27,46)-(27,48)) "e1",Var (Just (27,50)-(27,51)) "x",Var (Just (27,53)-(27,54)) "y"]])])]
Var (Just (27,16)-(27,19)) "sin"
Bop (Just (27,20)-(27,59)) FTimes (Var (Just (27,21)-(27,23)) "pi") (App (Just (27,27)-(27,58)) (Var (Just (27,28)-(27,31)) "cos") [Bop (Just (27,32)-(27,57)) FTimes (Var (Just (27,33)-(27,35)) "pi") (App (Just (27,39)-(27,56)) (Var (Just (27,40)-(27,44)) "eval") [Tuple (Just (27,45)-(27,55)) [Var (Just (27,46)-(27,48)) "e1",Var (Just (27,50)-(27,51)) "x",Var (Just (27,53)-(27,54)) "y"]])])
*)

(* typed spans
(20,17)-(20,46)
(27,16)-(27,59)
(27,16)-(27,19)
(27,20)-(27,59)
*)

(* correct types
float
float
float -> float
float
*)

(* bad types
int
int
int
float
*)
