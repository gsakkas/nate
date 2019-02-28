
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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" exprToString expr2)
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^ (":" ^ (exprToString expr4 ")")))))));;


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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))));;

*)

(* changed spans
(19,49)-(19,52)
(^)
VarG

(19,53)-(19,65)
exprToString expr2
AppG (fromList [VarG])

(26,52)-(26,64)
(^)
VarG

(26,52)-(26,64)
exprToString expr4
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (19,53)-(19,54)) "^"
App (Just (19,55)-(19,75)) (Var (Just (19,56)-(19,68)) "exprToString") [Var (Just (19,69)-(19,74)) "expr2"]
Var (Just (27,52)-(27,53)) "^"
App (Just (27,31)-(27,51)) (Var (Just (27,32)-(27,44)) "exprToString") [Var (Just (27,45)-(27,50)) "expr4"]
*)

(* typed spans
(19,53)-(19,54)
(19,55)-(19,75)
(27,52)-(27,53)
(27,31)-(27,51)
*)

(* correct types
string -> string -> string
string
string -> string -> string
string
*)

(* bad types
string
expr -> string
expr -> string
expr -> string
*)
