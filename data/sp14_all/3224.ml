
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
  | Sine ex -> sin (pi *. (eval ex x y));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)));;

*)

(* changed spans
(17,26)-(17,39)
eval (ex , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (17,26)-(17,43)) (Var (Just (17,27)-(17,31)) "eval") [Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "ex",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]]
*)

(* typed spans
(17,26)-(17,43)
*)

(* correct types
float
*)

(* bad types
float
*)
