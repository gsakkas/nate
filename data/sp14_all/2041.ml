
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
exprToString m
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (15,22)-(15,38)) (Var (Just (15,23)-(15,35)) "exprToString") [Var (Just (15,36)-(15,37)) "m"]
*)

(* typed spans
(15,22)-(15,38)
*)

(* correct types
string
*)

(* bad types
string
*)
