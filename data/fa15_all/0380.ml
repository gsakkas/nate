
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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval t x y))
  | Cosine t -> cos (pi *. (eval t x y))
  | Average (t,s) -> ((eval t x y) +. (eval s x y)) /. 2;;


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
  | varX -> x
  | varY -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0;;

*)

(* changed spans
(17,25)-(17,37)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,27)-(18,39)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,22)-(19,34)
eval (t , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,38)-(19,50)
eval (s , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,55)-(19,56)
2.0
LitG

*)

(* changed exprs
App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "t",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]]
App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "t",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]]
App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "t",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]
App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "s",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]]
Lit (Just (19,63)-(19,66)) (LD 2.0)
*)

(* typed spans
(17,25)-(17,41)
(18,27)-(18,43)
(19,22)-(19,38)
(19,42)-(19,58)
(19,63)-(19,66)
*)

(* correct types
float
float
float
float
float
*)

(* bad types
float
float
float
float
int
*)
