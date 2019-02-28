
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
  | Sine e -> "sin (pi*" + (exprToString e);;


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
  | Sine e -> "sin (pi*" ^ (exprToString e);;

*)

(* changed spans
(15,14)-(15,43)
"sin (pi*" ^ exprToString e
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (15,14)-(15,43)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,14)-(15,24)) (LS "sin (pi*"),App (Just (15,27)-(15,43)) (Var (Just (15,28)-(15,40)) "exprToString") [Var (Just (15,41)-(15,42)) "e"]]
*)

(* typed spans
(15,14)-(15,43)
*)

(* correct types
string
*)

(* bad types
int
*)
