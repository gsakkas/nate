
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos (pi *. (eval e))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0;;

*)

(* changed spans
(17,32)-(17,33)
(18,17)-(18,35)
(18,34)-(18,35)
(19,26)-(19,53)
(19,31)-(19,33)
(19,39)-(19,43)
(19,44)-(19,46)
(19,52)-(19,53)
*)

(* type error slice
(13,4)-(19,55)
(13,15)-(19,53)
(14,3)-(19,53)
(17,27)-(17,31)
(17,27)-(17,33)
(17,32)-(17,33)
(19,26)-(19,53)
(19,52)-(19,53)
*)