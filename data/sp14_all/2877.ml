
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
  match e with | VarX  -> x | VarY  -> y | Sine e -> sin (pi *. (eval e));;


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
  | Sine e -> sin (pi *. (eval (e, 0.0, 0.0)));;

*)

(* changed spans
(14,70)-(14,71)
(e , 0.0 , 0.0)
TupleG (fromList [VarG,LitG])

*)

(* changed exprs
Tuple (Just (17,31)-(17,44)) [Var (Just (17,32)-(17,33)) "e",Lit (Just (17,35)-(17,38)) (LD 0.0),Lit (Just (17,40)-(17,43)) (LD 0.0)]
*)

(* typed spans
(17,31)-(17,44)
*)

(* correct types
(expr * float * float)
*)

(* bad types
expr
*)
