
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      ("(" "1/sin(pi*") ^
        ((exprToString e1) ^
           (")" ^
              ("cos(pi*" ^
                 ((exprToString e1) ^
                    (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")"))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      "(" ^
        ("1/sin(pi*" ^
           ((exprToString e1) ^
              (")" ^
                 ("cos(pi*" ^
                    ((exprToString e1) ^
                       (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")")))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,6)-(31,23)
"("
LitG

(31,6)-(31,23)
"1/sin(pi*" ^ (exprToString e1 ^ (")" ^ ("cos(pi*" ^ (exprToString e1 ^ (")" ^ ("sin(pi*" ^ (exprToString e1 ^ (")" ^ ")"))))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (31,6)-(31,9)) (LS "(")
App (Just (32,8)-(37,83)) (Var (Just (32,21)-(32,22)) "^") [Lit (Just (32,9)-(32,20)) (LS "1/sin(pi*"),App (Just (33,11)-(37,82)) (Var (Just (33,30)-(33,31)) "^") [App (Just (33,12)-(33,29)) (Var (Just (33,13)-(33,25)) "exprToString") [Var (Just (33,26)-(33,28)) "e1"],App (Just (34,14)-(37,81)) (Var (Just (34,19)-(34,20)) "^") [Lit (Just (34,15)-(34,18)) (LS ")"),App (Just (35,17)-(37,80)) (Var (Just (35,28)-(35,29)) "^") [Lit (Just (35,18)-(35,27)) (LS "cos(pi*"),App (Just (36,20)-(37,79)) (Var (Just (36,39)-(36,40)) "^") [App (Just (36,21)-(36,38)) (Var (Just (36,22)-(36,34)) "exprToString") [Var (Just (36,35)-(36,37)) "e1"],App (Just (37,23)-(37,78)) (Var (Just (37,28)-(37,29)) "^") [Lit (Just (37,24)-(37,27)) (LS ")"),App (Just (37,30)-(37,77)) (Var (Just (37,41)-(37,42)) "^") [Lit (Just (37,31)-(37,40)) (LS "sin(pi*"),App (Just (37,43)-(37,76)) (Var (Just (37,62)-(37,63)) "^") [App (Just (37,44)-(37,61)) (Var (Just (37,45)-(37,57)) "exprToString") [Var (Just (37,58)-(37,60)) "e1"],App (Just (37,64)-(37,75)) (Var (Just (37,69)-(37,70)) "^") [Lit (Just (37,65)-(37,68)) (LS ")"),Lit (Just (37,71)-(37,74)) (LS ")")]]]]]]]]]
*)

(* typed spans
(31,6)-(31,9)
(32,8)-(37,83)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
