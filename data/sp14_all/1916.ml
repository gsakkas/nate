
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Squared e -> "(" ^ ((exprToString e) ^ ")^(2)")
  | Flatten (e1,e2,e3) ->
      ("(" exprToString e1) ^
        ("/" ^ ((exprToString e2) ^ ("/" ^ ((exprToString e3) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Squared e -> "(" ^ ((exprToString e) ^ ")^(2)")
  | Flatten (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/" ^ ((exprToString e2) ^ ("/" ^ ((exprToString e3) ^ ")")))));;

*)

(* changed spans
(31,6)-(31,27)
"("
LitG

(31,6)-(31,27)
exprToString e1 ^ ("/" ^ (exprToString e2 ^ ("/" ^ (exprToString e3 ^ ")"))))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (31,6)-(31,9)) (LS "(")
App (Just (32,8)-(33,75)) (Var (Just (32,27)-(32,28)) "^") [App (Just (32,9)-(32,26)) (Var (Just (32,10)-(32,22)) "exprToString") [Var (Just (32,23)-(32,25)) "e1"],App (Just (33,11)-(33,74)) (Var (Just (33,16)-(33,17)) "^") [Lit (Just (33,12)-(33,15)) (LS "/"),App (Just (33,18)-(33,73)) (Var (Just (33,37)-(33,38)) "^") [App (Just (33,19)-(33,36)) (Var (Just (33,20)-(33,32)) "exprToString") [Var (Just (33,33)-(33,35)) "e2"],App (Just (33,39)-(33,72)) (Var (Just (33,44)-(33,45)) "^") [Lit (Just (33,40)-(33,43)) (LS "/"),App (Just (33,46)-(33,71)) (Var (Just (33,65)-(33,66)) "^") [App (Just (33,47)-(33,64)) (Var (Just (33,48)-(33,60)) "exprToString") [Var (Just (33,61)-(33,63)) "e3"],Lit (Just (33,67)-(33,70)) (LS ")")]]]]]
*)

(* typed spans
(31,6)-(31,9)
(32,8)-(33,75)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
