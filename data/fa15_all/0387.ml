
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi *. (eval (r, x, y)))) * (tan (pi *. (eval (s, x, y))))) *.
        (sin (pi *. (eval (t, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((sin (pi *. (eval (r, x, y)))) *. (tan (pi *. (eval (s, x, y))))) *.
        (sin (pi *. (eval (t, x, y))));;

*)

(* changed spans
(27,6)-(27,71)
sin (pi *. eval (r , x , y)) *. tan (pi *. eval (s , x , y))
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (27,6)-(27,72)) FTimes (App (Just (27,7)-(27,37)) (Var (Just (27,8)-(27,11)) "sin") [Bop (Just (27,12)-(27,36)) FTimes (Var (Just (27,13)-(27,15)) "pi") (App (Just (27,19)-(27,35)) (Var (Just (27,20)-(27,24)) "eval") [Tuple (Just (27,25)-(27,34)) [Var (Just (27,26)-(27,27)) "r",Var (Just (27,29)-(27,30)) "x",Var (Just (27,32)-(27,33)) "y"]])]) (App (Just (27,41)-(27,71)) (Var (Just (27,42)-(27,45)) "tan") [Bop (Just (27,46)-(27,70)) FTimes (Var (Just (27,47)-(27,49)) "pi") (App (Just (27,53)-(27,69)) (Var (Just (27,54)-(27,58)) "eval") [Tuple (Just (27,59)-(27,68)) [Var (Just (27,60)-(27,61)) "s",Var (Just (27,63)-(27,64)) "x",Var (Just (27,66)-(27,67)) "y"]])])
*)

(* typed spans
(27,6)-(27,72)
*)

(* correct types
float
*)

(* bad types
int
*)
