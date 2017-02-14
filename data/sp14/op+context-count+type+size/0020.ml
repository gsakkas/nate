
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "x" | VarY  -> "y" | Sine m -> "sin" ^ exprToString;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine m -> "sin" ^ (exprToString m);;

*)

(* changed spans
(12,65)-(12,77)
*)

(* type error slice
(11,3)-(12,79)
(11,21)-(12,77)
(12,57)-(12,77)
(12,63)-(12,64)
(12,65)-(12,77)
*)
