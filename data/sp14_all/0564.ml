
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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ (("+" exprToString e4) ^ ")/2)"));;


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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")));;

*)

(* changed spans
(18,35)-(18,56)
"+"
LitG

(18,35)-(18,56)
exprToString e4 ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (18,35)-(18,38)) (LS "+")
App (Just (18,41)-(18,69)) (Var (Just (18,60)-(18,61)) "^") [App (Just (18,42)-(18,59)) (Var (Just (18,43)-(18,55)) "exprToString") [Var (Just (18,56)-(18,58)) "e4"],Lit (Just (18,62)-(18,68)) (LS ")/2)")]
*)

(* typed spans
(18,35)-(18,38)
(18,41)-(18,69)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
