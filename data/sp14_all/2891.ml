
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
  | Sine s -> "pi* " exprToString s;;


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
  | Sine s -> "pi* " ^ (exprToString s);;

*)

(* changed spans
(15,14)-(15,20)
(^)
VarG

(15,21)-(15,33)
exprToString s
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (15,21)-(15,22)) "^"
App (Just (15,23)-(15,39)) (Var (Just (15,24)-(15,36)) "exprToString") [Var (Just (15,37)-(15,38)) "s"]
*)

(* typed spans
(15,21)-(15,22)
(15,23)-(15,39)
*)

(* correct types
string -> string -> string
string
*)

(* bad types
string
expr -> string
*)
