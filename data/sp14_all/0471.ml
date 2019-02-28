
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
  | Sine ex -> sin (exprToString ex);;


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
  | Sine ex -> "sin" ^ (exprToString ex);;

*)

(* changed spans
(15,15)-(15,36)
"sin" ^ exprToString ex
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (15,15)-(15,40)) (Var (Just (15,21)-(15,22)) "^") [Lit (Just (15,15)-(15,20)) (LS "sin"),App (Just (15,23)-(15,40)) (Var (Just (15,24)-(15,36)) "exprToString") [Var (Just (15,37)-(15,39)) "ex"]]
*)

(* typed spans
(15,15)-(15,40)
*)

(* correct types
string
*)

(* bad types
float
*)
