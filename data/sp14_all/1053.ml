
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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) /. (float_of_int 2)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(19,23)-(19,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. float_of_int 2
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (20,6)-(20,66)) FDiv (Bop (Just (20,6)-(20,46)) FPlus (App (Just (20,7)-(20,24)) (Var (Just (20,8)-(20,12)) "eval") [Tuple (Just (20,13)-(20,23)) [Var (Just (20,14)-(20,16)) "e1",Var (Just (20,18)-(20,19)) "x",Var (Just (20,21)-(20,22)) "y"]]) (App (Just (20,28)-(20,45)) (Var (Just (20,29)-(20,33)) "eval") [Tuple (Just (20,34)-(20,44)) [Var (Just (20,35)-(20,37)) "e2",Var (Just (20,39)-(20,40)) "x",Var (Just (20,42)-(20,43)) "y"]])) (App (Just (20,50)-(20,66)) (Var (Just (20,51)-(20,63)) "float_of_int") [Lit (Just (20,64)-(20,65)) (LI 2)])
*)

(* typed spans
(20,6)-(20,66)
*)

(* correct types
float
*)

(* bad types
int
*)
