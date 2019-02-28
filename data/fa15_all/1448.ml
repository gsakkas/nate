
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y));;

*)

(* changed spans
(23,6)-(23,65)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (23,6)-(23,67)) FPlus (Bop (Just (23,6)-(23,46)) FPlus (App (Just (23,7)-(23,24)) (Var (Just (23,8)-(23,12)) "eval") [Tuple (Just (23,13)-(23,23)) [Var (Just (23,14)-(23,16)) "e1",Var (Just (23,18)-(23,19)) "x",Var (Just (23,21)-(23,22)) "y"]]) (App (Just (23,28)-(23,45)) (Var (Just (23,29)-(23,33)) "eval") [Tuple (Just (23,34)-(23,44)) [Var (Just (23,35)-(23,37)) "e2",Var (Just (23,39)-(23,40)) "x",Var (Just (23,42)-(23,43)) "y"]])) (App (Just (23,50)-(23,67)) (Var (Just (23,51)-(23,55)) "eval") [Tuple (Just (23,56)-(23,66)) [Var (Just (23,57)-(23,59)) "e3",Var (Just (23,61)-(23,62)) "x",Var (Just (23,64)-(23,65)) "y"]])
*)

(* typed spans
(23,6)-(23,67)
*)

(* correct types
float
*)

(* bad types
int
*)
