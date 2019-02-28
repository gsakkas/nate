
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "VarX" | VarY  -> "VarY" | Sine e1 -> sin e1;;


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
  match e with | VarX  -> "x" | VarY  -> "y" | Sine e1 -> "sin";;

*)

(* changed spans
(12,64)-(12,70)
"x"
LitG

*)

(* changed exprs
Lit (Just (12,26)-(12,29)) (LS "x")
*)

(* typed spans
(12,26)-(12,29)
*)

(* correct types
string
*)

(* bad types
string
*)
