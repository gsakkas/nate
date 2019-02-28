
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
  | Sine e -> sin (pi *. e)
  | Cosine e -> cos (pi *. e)
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;

*)

(* changed spans
(17,25)-(17,26)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,27)-(18,28)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,23)-(19,67)
x
VarG

(19,23)-(19,67)
y
VarG

*)

(* changed exprs
App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "e",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]]
App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "e",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]]
Var (Just (18,37)-(18,38)) "x"
Var (Just (18,40)-(18,41)) "y"
*)

(* typed spans
(17,25)-(17,41)
(18,27)-(18,43)
(18,37)-(18,38)
(18,40)-(18,41)
*)

(* correct types
float
float
float
float
*)

(* bad types
expr
expr
float
float
*)
