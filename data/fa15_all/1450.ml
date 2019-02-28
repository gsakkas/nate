
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = match e with | VarX  -> "%s" VarX;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = match e with | VarX  -> "VarX";;

*)

(* changed spans
(11,49)-(11,58)
"VarX"
LitG

*)

(* changed exprs
Lit (Just (11,49)-(11,55)) (LS "VarX")
*)

(* typed spans
(11,49)-(11,55)
*)

(* correct types
string
*)

(* bad types
'a
*)
