
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2)")))
  | Times (x,y) -> exprToString e "*" exprToString e;;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y));;

*)

(* changed spans
(18,28)-(18,29)
y
VarG

(18,55)-(18,56)
y
VarG

(19,19)-(19,52)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (18,28)-(18,29)) "y"
Var (Just (18,55)-(18,56)) "y"
App (Just (19,19)-(19,62)) (Var (Just (19,36)-(19,37)) "^") [App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,32)) "exprToString") [Var (Just (19,33)-(19,34)) "x"],App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "y"]]]
*)

(* typed spans
(18,28)-(18,29)
(18,55)-(18,56)
(19,19)-(19,62)
*)

(* correct types
expr
expr
string
*)

(* bad types
expr
expr
string
*)
