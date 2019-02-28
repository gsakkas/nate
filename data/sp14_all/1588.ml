
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
  | Sine e -> pi *. e
  | Cosine e -> pi *. e
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
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
  | Sine e -> pi *. (eval (e, x, y))
  | Cosine e -> pi *. (eval (e, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,20)-(17,21)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,22)-(18,23)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,23)-(19,70)
x
VarG

(19,23)-(19,70)
y
VarG

*)

(* changed exprs
App (Just (17,20)-(17,36)) (Var (Just (17,21)-(17,25)) "eval") [Tuple (Just (17,26)-(17,35)) [Var (Just (17,27)-(17,28)) "e",Var (Just (17,30)-(17,31)) "x",Var (Just (17,33)-(17,34)) "y"]]
App (Just (18,22)-(18,38)) (Var (Just (18,23)-(18,27)) "eval") [Tuple (Just (18,28)-(18,37)) [Var (Just (18,29)-(18,30)) "e",Var (Just (18,32)-(18,33)) "x",Var (Just (18,35)-(18,36)) "y"]]
Var (Just (18,32)-(18,33)) "x"
Var (Just (18,35)-(18,36)) "y"
*)

(* typed spans
(17,20)-(17,36)
(18,22)-(18,38)
(18,32)-(18,33)
(18,35)-(18,36)
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
