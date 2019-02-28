
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
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2 "?") ^
                 ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")"))))));;


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
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(24,15)-(24,36)
exprToString e2
AppG (fromList [VarG])

(24,32)-(24,35)
"?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (24,15)-(24,32)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,31)) "e2"]
App (Just (25,17)-(26,76)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (26,20)-(26,75)) (Var (Just (26,39)-(26,40)) "^") [App (Just (26,21)-(26,38)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,37)) "e3"],App (Just (26,41)-(26,74)) (Var (Just (26,46)-(26,47)) "^") [Lit (Just (26,42)-(26,45)) (LS ":"),App (Just (26,48)-(26,73)) (Var (Just (26,67)-(26,68)) "^") [App (Just (26,49)-(26,66)) (Var (Just (26,50)-(26,62)) "exprToString") [Var (Just (26,63)-(26,65)) "e4"],Lit (Just (26,69)-(26,72)) (LS ")")]]]]
*)

(* typed spans
(24,15)-(24,32)
(25,17)-(26,76)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
