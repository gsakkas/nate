
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(19,18)-(19,41)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (17,18)-(17,34)) (Var (Just (17,19)-(17,23)) "eval") [Tuple (Just (17,24)-(17,33)) [Var (Just (17,25)-(17,26)) "a",Var (Just (17,28)-(17,29)) "x",Var (Just (17,31)-(17,32)) "y"]]
*)

(* typed spans
(17,18)-(17,34)
*)

(* correct types
float
*)

(* bad types
int
*)
