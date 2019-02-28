
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
  | Sine a -> sin (pi * a)
  | Cosine a -> cos (pi *. a);;


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
  | Sine a -> sin (pi *. x)
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(17,18)-(17,26)
pi *. x
BopG VarG VarG

(18,27)-(18,28)
y
VarG

*)

(* changed exprs
Bop (Just (17,18)-(17,27)) FTimes (Var (Just (17,19)-(17,21)) "pi") (Var (Just (17,25)-(17,26)) "x")
Var (Just (18,27)-(18,28)) "y"
*)

(* typed spans
(17,18)-(17,27)
(18,27)-(18,28)
*)

(* correct types
float
float
*)

(* bad types
int
expr
*)
