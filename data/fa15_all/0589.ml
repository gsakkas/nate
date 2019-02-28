
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
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (("+" exprToString e2) ^ ")/2)"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("?" ^ ((exprToString e2) ^ (":" ^ ((exprToString e4) ^ ")")))));;


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
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("?" ^ ((exprToString e2) ^ (":" ^ ((exprToString e4) ^ ")")))));;

*)

(* changed spans
(18,35)-(18,56)
"+"
LitG

(18,35)-(18,56)
exprToString e2 ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (18,35)-(18,38)) (LS "+")
App (Just (18,41)-(18,69)) (Var (Just (18,60)-(18,61)) "^") [App (Just (18,42)-(18,59)) (Var (Just (18,43)-(18,55)) "exprToString") [Var (Just (18,56)-(18,58)) "e2"],Lit (Just (18,62)-(18,68)) (LS ")/2)")]
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
