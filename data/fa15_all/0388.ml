
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
  | Sine x -> "sin(" @ ((exprToString x) @ ")");;


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
  | Sine x -> "sin(" ^ ((exprToString x) ^ ")");;

*)

(* changed spans
(15,21)-(15,22)
(^)
VarG

(15,41)-(15,42)
(^)
VarG

*)

(* changed exprs
Var (Just (15,21)-(15,22)) "^"
Var (Just (15,41)-(15,42)) "^"
*)

(* typed spans
(15,21)-(15,22)
(15,41)-(15,42)
*)

(* correct types
string -> string -> string
string -> string -> string
*)

(* bad types
'a list -> 'a list -> 'a list
'a list -> 'a list -> 'a list
*)
