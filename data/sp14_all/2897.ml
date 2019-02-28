
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
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2 "?") ^
              ((exprToString e3) ^ ("?" exprToString e4))));;


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
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ ("?" ^ (exprToString e4))))));;

*)

(* changed spans
(23,12)-(23,33)
exprToString e2
AppG (fromList [VarG])

(23,29)-(23,32)
"?" ^ (exprToString e3 ^ ("?" ^ exprToString e4))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(24,36)-(24,39)
(^)
VarG

(24,40)-(24,52)
exprToString e4
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (23,12)-(23,29)) (Var (Just (23,13)-(23,25)) "exprToString") [Var (Just (23,26)-(23,28)) "e2"]
App (Just (24,14)-(24,69)) (Var (Just (24,19)-(24,20)) "^") [Lit (Just (24,15)-(24,18)) (LS "?"),App (Just (24,21)-(24,68)) (Var (Just (24,40)-(24,41)) "^") [App (Just (24,22)-(24,39)) (Var (Just (24,23)-(24,35)) "exprToString") [Var (Just (24,36)-(24,38)) "e3"],App (Just (24,42)-(24,67)) (Var (Just (24,47)-(24,48)) "^") [Lit (Just (24,43)-(24,46)) (LS "?"),App (Just (24,49)-(24,66)) (Var (Just (24,50)-(24,62)) "exprToString") [Var (Just (24,63)-(24,65)) "e4"]]]]
Var (Just (24,47)-(24,48)) "^"
App (Just (24,49)-(24,66)) (Var (Just (24,50)-(24,62)) "exprToString") [Var (Just (24,63)-(24,65)) "e4"]
*)

(* typed spans
(23,12)-(23,29)
(24,14)-(24,69)
(24,47)-(24,48)
(24,49)-(24,66)
*)

(* correct types
string
string
string -> string -> string
string
*)

(* bad types
string
string
string
expr -> string
*)
