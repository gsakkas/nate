
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
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        (expr0 ^ ("<" ^ (expr1 ^ ("?" ^ (expr2 ^ (":" ^ (expr3 ^ ")")))))));;


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
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr0) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(23,9)-(23,14)
exprToString expr0
AppG (fromList [VarG])

(23,25)-(23,30)
exprToString expr1
AppG (fromList [VarG])

(23,41)-(23,46)
exprToString expr2
AppG (fromList [VarG])

(23,57)-(23,62)
exprToString expr3
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (23,9)-(23,29)) (Var (Just (23,10)-(23,22)) "exprToString") [Var (Just (23,23)-(23,28)) "expr0"]
App (Just (25,15)-(25,35)) (Var (Just (25,16)-(25,28)) "exprToString") [Var (Just (25,29)-(25,34)) "expr1"]
App (Just (27,21)-(27,41)) (Var (Just (27,22)-(27,34)) "exprToString") [Var (Just (27,35)-(27,40)) "expr2"]
App (Just (28,31)-(28,51)) (Var (Just (28,32)-(28,44)) "exprToString") [Var (Just (28,45)-(28,50)) "expr3"]
*)

(* typed spans
(23,9)-(23,29)
(25,15)-(25,35)
(27,21)-(27,41)
(28,31)-(28,51)
*)

(* correct types
string
string
string
string
*)

(* bad types
expr
expr
expr
expr
*)
