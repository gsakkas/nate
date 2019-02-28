
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

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
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) +. (cos (pi *. (eval (e, x, y))))) *
        (cos (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) / (cos (pi *. (eval (e, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

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
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) +. (cos (pi *. (eval (e, x, y))))) *.
        (cos (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))));;

*)

(* changed spans
(28,6)-(29,38)
(sin (pi *. eval (e , x , y)) +. cos (pi *. eval (e , x , y))) *. cos (pi *. eval (e , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,6)-(31,69)
sin (pi *. eval (e , x , y)) /. cos (pi *. eval (e , x , y))
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (28,6)-(29,38)) FTimes (Bop (Just (28,6)-(28,72)) FPlus (App (Just (28,7)-(28,37)) (Var (Just (28,8)-(28,11)) "sin") [Bop (Just (28,12)-(28,36)) FTimes (Var (Just (28,13)-(28,15)) "pi") (App (Just (28,19)-(28,35)) (Var (Just (28,20)-(28,24)) "eval") [Tuple (Just (28,25)-(28,34)) [Var (Just (28,26)-(28,27)) "e",Var (Just (28,29)-(28,30)) "x",Var (Just (28,32)-(28,33)) "y"]])]) (App (Just (28,41)-(28,71)) (Var (Just (28,42)-(28,45)) "cos") [Bop (Just (28,46)-(28,70)) FTimes (Var (Just (28,47)-(28,49)) "pi") (App (Just (28,53)-(28,69)) (Var (Just (28,54)-(28,58)) "eval") [Tuple (Just (28,59)-(28,68)) [Var (Just (28,60)-(28,61)) "e",Var (Just (28,63)-(28,64)) "x",Var (Just (28,66)-(28,67)) "y"]])])) (App (Just (29,8)-(29,38)) (Var (Just (29,9)-(29,12)) "cos") [Bop (Just (29,13)-(29,37)) FTimes (Var (Just (29,14)-(29,16)) "pi") (App (Just (29,20)-(29,36)) (Var (Just (29,21)-(29,25)) "eval") [Tuple (Just (29,26)-(29,35)) [Var (Just (29,27)-(29,28)) "e",Var (Just (29,30)-(29,31)) "x",Var (Just (29,33)-(29,34)) "y"]])])
Bop (Just (31,6)-(31,70)) FDiv (App (Just (31,6)-(31,36)) (Var (Just (31,7)-(31,10)) "sin") [Bop (Just (31,11)-(31,35)) FTimes (Var (Just (31,12)-(31,14)) "pi") (App (Just (31,18)-(31,34)) (Var (Just (31,19)-(31,23)) "eval") [Tuple (Just (31,24)-(31,33)) [Var (Just (31,25)-(31,26)) "e",Var (Just (31,28)-(31,29)) "x",Var (Just (31,31)-(31,32)) "y"]])]) (App (Just (31,40)-(31,70)) (Var (Just (31,41)-(31,44)) "cos") [Bop (Just (31,45)-(31,69)) FTimes (Var (Just (31,46)-(31,48)) "pi") (App (Just (31,52)-(31,68)) (Var (Just (31,53)-(31,57)) "eval") [Tuple (Just (31,58)-(31,67)) [Var (Just (31,59)-(31,60)) "e",Var (Just (31,62)-(31,63)) "x",Var (Just (31,65)-(31,66)) "y"]])])
*)

(* typed spans
(28,6)-(29,38)
(31,6)-(31,70)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
