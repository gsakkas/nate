
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumSquared of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Percent e1 -> (eval (e1, x, y)) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) * (-1)
  | SumSquared (e1,e2,e3) ->
      (((eval (e1, x, y)) * (eval (e1, x, y))) +
         ((eval (e2, x, y)) * (eval (e2, x, y))))
        + ((eval (e3, x, y)) * (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Percent of expr
  | Negate of expr
  | SumSquared of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Percent e1 -> (eval (e1, x, y)) *. 0.01
  | Negate e1 -> (eval (e1, x, y)) *. (-1.0)
  | SumSquared (e1,e2,e3) ->
      (((eval (e1, x, y)) *. (eval (e1, x, y))) +.
         ((eval (e2, x, y)) *. (eval (e2, x, y))))
        +. ((eval (e3, x, y)) *. (eval (e3, x, y)));;

*)

(* changed spans
(29,17)-(29,41)
eval (e1 , x , y) *. (- 1.0)
BopG (AppG (fromList [EmptyG])) (UopG EmptyG)

(31,8)-(31,25)
((eval (e1 , x , y) *. eval (e1 , x , y)) +. (eval (e2 , x , y) *. eval (e2 , x , y))) +. (eval (e3 , x , y) *. eval (e3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(32,9)-(32,48)
eval (e2 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(33,10)-(33,49)
eval (e3 , x , y) *. eval (e3 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,17)-(29,44)) FTimes (App (Just (29,17)-(29,34)) (Var (Just (29,18)-(29,22)) "eval") [Tuple (Just (29,23)-(29,33)) [Var (Just (29,24)-(29,26)) "e1",Var (Just (29,28)-(29,29)) "x",Var (Just (29,31)-(29,32)) "y"]]) (Uop (Just (29,38)-(29,44)) Neg (Lit (Just (29,40)-(29,43)) (LD 1.0)))
Bop (Just (31,6)-(33,51)) FPlus (Bop (Just (31,6)-(32,50)) FPlus (Bop (Just (31,7)-(31,47)) FTimes (App (Just (31,8)-(31,25)) (Var (Just (31,9)-(31,13)) "eval") [Tuple (Just (31,14)-(31,24)) [Var (Just (31,15)-(31,17)) "e1",Var (Just (31,19)-(31,20)) "x",Var (Just (31,22)-(31,23)) "y"]]) (App (Just (31,29)-(31,46)) (Var (Just (31,30)-(31,34)) "eval") [Tuple (Just (31,35)-(31,45)) [Var (Just (31,36)-(31,38)) "e1",Var (Just (31,40)-(31,41)) "x",Var (Just (31,43)-(31,44)) "y"]])) (Bop (Just (32,9)-(32,49)) FTimes (App (Just (32,10)-(32,27)) (Var (Just (32,11)-(32,15)) "eval") [Tuple (Just (32,16)-(32,26)) [Var (Just (32,17)-(32,19)) "e2",Var (Just (32,21)-(32,22)) "x",Var (Just (32,24)-(32,25)) "y"]]) (App (Just (32,31)-(32,48)) (Var (Just (32,32)-(32,36)) "eval") [Tuple (Just (32,37)-(32,47)) [Var (Just (32,38)-(32,40)) "e2",Var (Just (32,42)-(32,43)) "x",Var (Just (32,45)-(32,46)) "y"]]))) (Bop (Just (33,11)-(33,51)) FTimes (App (Just (33,12)-(33,29)) (Var (Just (33,13)-(33,17)) "eval") [Tuple (Just (33,18)-(33,28)) [Var (Just (33,19)-(33,21)) "e3",Var (Just (33,23)-(33,24)) "x",Var (Just (33,26)-(33,27)) "y"]]) (App (Just (33,33)-(33,50)) (Var (Just (33,34)-(33,38)) "eval") [Tuple (Just (33,39)-(33,49)) [Var (Just (33,40)-(33,42)) "e3",Var (Just (33,44)-(33,45)) "x",Var (Just (33,47)-(33,48)) "y"]]))
Bop (Just (32,9)-(32,49)) FTimes (App (Just (32,10)-(32,27)) (Var (Just (32,11)-(32,15)) "eval") [Tuple (Just (32,16)-(32,26)) [Var (Just (32,17)-(32,19)) "e2",Var (Just (32,21)-(32,22)) "x",Var (Just (32,24)-(32,25)) "y"]]) (App (Just (32,31)-(32,48)) (Var (Just (32,32)-(32,36)) "eval") [Tuple (Just (32,37)-(32,47)) [Var (Just (32,38)-(32,40)) "e2",Var (Just (32,42)-(32,43)) "x",Var (Just (32,45)-(32,46)) "y"]])
Bop (Just (33,11)-(33,51)) FTimes (App (Just (33,12)-(33,29)) (Var (Just (33,13)-(33,17)) "eval") [Tuple (Just (33,18)-(33,28)) [Var (Just (33,19)-(33,21)) "e3",Var (Just (33,23)-(33,24)) "x",Var (Just (33,26)-(33,27)) "y"]]) (App (Just (33,33)-(33,50)) (Var (Just (33,34)-(33,38)) "eval") [Tuple (Just (33,39)-(33,49)) [Var (Just (33,40)-(33,42)) "e3",Var (Just (33,44)-(33,45)) "x",Var (Just (33,47)-(33,48)) "y"]])
*)

(* typed spans
(29,17)-(29,44)
(31,6)-(33,51)
(32,9)-(32,49)
(33,11)-(33,51)
*)

(* correct types
float
float
float
float
*)

(* bad types
int
float
int
int
*)
