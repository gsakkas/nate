
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
  | Sine s -> "sin(pi*" ^ (exprToString s ")");;


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
  | Sine s -> "sin(pi*" ^ ((exprToString s) ^ ")");;

*)

(* changed spans
(15,27)-(15,39)
(^)
VarG

(15,27)-(15,39)
exprToString s
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (15,44)-(15,45)) "^"
App (Just (15,27)-(15,43)) (Var (Just (15,28)-(15,40)) "exprToString") [Var (Just (15,41)-(15,42)) "s"]
*)

(* typed spans
(15,44)-(15,45)
(15,27)-(15,43)
*)

(* correct types
string -> string -> string
string
*)

(* bad types
expr -> string -> string
expr -> string -> string
*)
