
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> buildY ()
  | Sine a -> sin (pi *. VarX)
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
  | Sine a -> sin (pi *. x)
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(20,13)-(20,22)
x
VarG

(20,20)-(20,22)
y
VarG

(21,25)-(21,29)
x
VarG

*)

(* changed exprs
Var (Just (15,13)-(15,14)) "x"
Var (Just (16,13)-(16,14)) "y"
Var (Just (17,25)-(17,26)) "x"
*)

(* typed spans
(15,13)-(15,14)
(16,13)-(16,14)
(17,25)-(17,26)
*)

(* correct types
float
float
float
*)

(* bad types
expr
unit
expr
*)
