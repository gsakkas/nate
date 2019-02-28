
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
      ((sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))))) *.
        (sin (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) * (cos (pi *. (eval (e, x, y))));;


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
      ((sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))))) *.
        (sin (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) *. (cos (pi *. (eval (e, x, y))));;

*)

(* changed spans
(31,6)-(31,69)
sin (pi *. eval (e , x , y)) *. cos (pi *. eval (e , x , y))
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (31,6)-(31,70)) FTimes (App (Just (31,6)-(31,36)) (Var (Just (31,7)-(31,10)) "sin") [Bop (Just (31,11)-(31,35)) FTimes (Var (Just (31,12)-(31,14)) "pi") (App (Just (31,18)-(31,34)) (Var (Just (31,19)-(31,23)) "eval") [Tuple (Just (31,24)-(31,33)) [Var (Just (31,25)-(31,26)) "e",Var (Just (31,28)-(31,29)) "x",Var (Just (31,31)-(31,32)) "y"]])]) (App (Just (31,40)-(31,70)) (Var (Just (31,41)-(31,44)) "cos") [Bop (Just (31,45)-(31,69)) FTimes (Var (Just (31,46)-(31,48)) "pi") (App (Just (31,52)-(31,68)) (Var (Just (31,53)-(31,57)) "eval") [Tuple (Just (31,58)-(31,67)) [Var (Just (31,59)-(31,60)) "e",Var (Just (31,62)-(31,63)) "x",Var (Just (31,65)-(31,66)) "y"]])])
*)

(* typed spans
(31,6)-(31,70)
*)

(* correct types
float
*)

(* bad types
int
*)
