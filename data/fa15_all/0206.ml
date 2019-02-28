
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1 / (sin (pi *. (eval (e1, x, y))))) *
         (cos (pi *. (eval (e1, x, y)))))
        * (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1 / (sin (pi *. (eval (e1, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1.0 /. (sin (pi *. (eval (e1, x, y))))) *.
         (cos (pi *. (eval (e1, x, y)))))
        *. (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1.0 /. (sin (pi *. (eval (e1, x, y))));;

*)

(* changed spans
(28,6)-(30,41)
((1.0 /. sin (pi *. eval (e1 , x , y))) *. cos (pi *. eval (e1 , x , y))) *. sin (pi *. eval (e1 , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,17)-(31,52)
1.0 /. sin (pi *. eval (e1 , x , y))
BopG LitG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (28,6)-(30,42)) FTimes (Bop (Just (28,6)-(29,41)) FTimes (Bop (Just (28,7)-(28,47)) FDiv (Lit (Just (28,8)-(28,11)) (LD 1.0)) (App (Just (28,15)-(28,46)) (Var (Just (28,16)-(28,19)) "sin") [Bop (Just (28,20)-(28,45)) FTimes (Var (Just (28,21)-(28,23)) "pi") (App (Just (28,27)-(28,44)) (Var (Just (28,28)-(28,32)) "eval") [Tuple (Just (28,33)-(28,43)) [Var (Just (28,34)-(28,36)) "e1",Var (Just (28,38)-(28,39)) "x",Var (Just (28,41)-(28,42)) "y"]])])) (App (Just (29,9)-(29,40)) (Var (Just (29,10)-(29,13)) "cos") [Bop (Just (29,14)-(29,39)) FTimes (Var (Just (29,15)-(29,17)) "pi") (App (Just (29,21)-(29,38)) (Var (Just (29,22)-(29,26)) "eval") [Tuple (Just (29,27)-(29,37)) [Var (Just (29,28)-(29,30)) "e1",Var (Just (29,32)-(29,33)) "x",Var (Just (29,35)-(29,36)) "y"]])])) (App (Just (30,11)-(30,42)) (Var (Just (30,12)-(30,15)) "sin") [Bop (Just (30,16)-(30,41)) FTimes (Var (Just (30,17)-(30,19)) "pi") (App (Just (30,23)-(30,40)) (Var (Just (30,24)-(30,28)) "eval") [Tuple (Just (30,29)-(30,39)) [Var (Just (30,30)-(30,32)) "e1",Var (Just (30,34)-(30,35)) "x",Var (Just (30,37)-(30,38)) "y"]])])
Bop (Just (31,17)-(31,55)) FDiv (Lit (Just (31,17)-(31,20)) (LD 1.0)) (App (Just (31,24)-(31,55)) (Var (Just (31,25)-(31,28)) "sin") [Bop (Just (31,29)-(31,54)) FTimes (Var (Just (31,30)-(31,32)) "pi") (App (Just (31,36)-(31,53)) (Var (Just (31,37)-(31,41)) "eval") [Tuple (Just (31,42)-(31,52)) [Var (Just (31,43)-(31,45)) "e1",Var (Just (31,47)-(31,48)) "x",Var (Just (31,50)-(31,51)) "y"]])])
*)

(* typed spans
(28,6)-(30,42)
(31,17)-(31,55)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
