
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' ->
      cos ((((eval (e', x, y)) ** 2.0) -. (eval (e', x, y))) -. 1.0)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y) eval) + (e2, x, y)) + ((eval (e3, x, y)) /. pi));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' ->
      cos ((((eval (e', x, y)) ** 2.0) -. (eval (e', x, y))) -. 1.0)
  | MeanPi (e1,e2,e3) ->
      sin
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +.
           ((eval (e3, x, y)) /. pi));;

*)

(* changed spans
(30,10)-(30,77)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. (eval (e3 , x , y) /. pi)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (31,8)-(32,37)) FPlus (Bop (Just (31,9)-(31,49)) FPlus (App (Just (31,10)-(31,27)) (Var (Just (31,11)-(31,15)) "eval") [Tuple (Just (31,16)-(31,26)) [Var (Just (31,17)-(31,19)) "e1",Var (Just (31,21)-(31,22)) "x",Var (Just (31,24)-(31,25)) "y"]]) (App (Just (31,31)-(31,48)) (Var (Just (31,32)-(31,36)) "eval") [Tuple (Just (31,37)-(31,47)) [Var (Just (31,38)-(31,40)) "e2",Var (Just (31,42)-(31,43)) "x",Var (Just (31,45)-(31,46)) "y"]])) (Bop (Just (32,11)-(32,36)) FDiv (App (Just (32,12)-(32,29)) (Var (Just (32,13)-(32,17)) "eval") [Tuple (Just (32,18)-(32,28)) [Var (Just (32,19)-(32,21)) "e3",Var (Just (32,23)-(32,24)) "x",Var (Just (32,26)-(32,27)) "y"]]) (Var (Just (32,33)-(32,35)) "pi"))
*)

(* typed spans
(31,8)-(32,37)
*)

(* correct types
float
*)

(* bad types
int
*)
