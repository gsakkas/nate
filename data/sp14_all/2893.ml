
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
  | Sine s -> String.concat ["pi* "; exprToString s];;


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
(15,14)-(15,52)
"pi* " ^ exprToString s
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (15,14)-(15,39)) (Var (Just (15,21)-(15,22)) "^") [Lit (Just (15,14)-(15,20)) (LS "pi* "),App (Just (15,23)-(15,39)) (Var (Just (15,24)-(15,36)) "exprToString") [Var (Just (15,37)-(15,38)) "s"]]
*)

(* typed spans
(15,14)-(15,39)
*)

(* correct types
string
*)

(* bad types
string
*)
