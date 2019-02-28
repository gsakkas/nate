
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
  | Sine a -> sin (eval (e, x, a))
  | Cosine a -> cos (pi *. y);;


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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(17,31)-(17,32)
x
VarG

(17,31)-(17,32)
y
VarG

*)

(* changed exprs
Var (Just (17,28)-(17,29)) "x"
Var (Just (17,31)-(17,32)) "y"
*)

(* typed spans
(17,28)-(17,29)
(17,31)-(17,32)
*)

(* correct types
float
float
*)

(* bad types
expr
expr
*)
