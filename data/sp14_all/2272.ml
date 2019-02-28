
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
      ((sin (pi *. (eval (e, x, y)))) -. (cos (pi *. (eval (e, x, y))))) / 3;;


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
      ((sin (pi *. (eval (e, x, y)))) -. (cos (pi *. (eval (e, x, y))))) /.
        3.0;;

*)

(* changed spans
(31,6)-(31,76)
(sin (pi *. eval (e , x , y)) -. cos (pi *. eval (e , x , y))) /. 3.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (31,6)-(32,11)) FDiv (Bop (Just (31,6)-(31,72)) FMinus (App (Just (31,7)-(31,37)) (Var (Just (31,8)-(31,11)) "sin") [Bop (Just (31,12)-(31,36)) FTimes (Var (Just (31,13)-(31,15)) "pi") (App (Just (31,19)-(31,35)) (Var (Just (31,20)-(31,24)) "eval") [Tuple (Just (31,25)-(31,34)) [Var (Just (31,26)-(31,27)) "e",Var (Just (31,29)-(31,30)) "x",Var (Just (31,32)-(31,33)) "y"]])]) (App (Just (31,41)-(31,71)) (Var (Just (31,42)-(31,45)) "cos") [Bop (Just (31,46)-(31,70)) FTimes (Var (Just (31,47)-(31,49)) "pi") (App (Just (31,53)-(31,69)) (Var (Just (31,54)-(31,58)) "eval") [Tuple (Just (31,59)-(31,68)) [Var (Just (31,60)-(31,61)) "e",Var (Just (31,63)-(31,64)) "x",Var (Just (31,66)-(31,67)) "y"]])])) (Lit (Just (32,8)-(32,11)) (LD 3.0))
*)

(* typed spans
(31,6)-(32,11)
*)

(* correct types
float
*)

(* bad types
int
*)
