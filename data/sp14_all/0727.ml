
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr1) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr,expr1) -> (exprToString expr) ^ ("*" ^ (exprToString expr1))
  | Nom (expr1,expr2,expr3) ->
      let (res1,res2,res3) =
        ((exprToString expr1), (exprToString expr2), (exprToString expr3)) in
      "(" ^
        (res1 ^
           ("+" ^
              (res2 ^
                 ("+" ^
                    (res3 ^
                       (")/(abs(" ^
                          (res1 ^
                             (")+abs(" ^ (res2 ^ (")+abs(" ^ (res3 ^ "))")))))))))))
  | Squa expr ->
      let res = exprToString expr in res ^ ("/(abs(" ^ (res ^ ")+1)"))
  | Thresh (expr,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr1) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr,expr1) -> (exprToString expr) ^ ("*" ^ (exprToString expr1))
  | Nom (expr1,expr2,expr3) ->
      let (res1,res2,res3) =
        ((exprToString expr1), (exprToString expr2), (exprToString expr3)) in
      "(" ^
        (res1 ^
           ("+" ^
              (res2 ^
                 ("+" ^
                    (res3 ^
                       (")/(abs(" ^
                          (res1 ^
                             (")+abs(" ^ (res2 ^ (")+abs(" ^ (res3 ^ "))")))))))))))
  | Squa expr ->
      let res = exprToString expr in res ^ ("/(abs(" ^ (res ^ ")+1)"))
  | Thresh (expr,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(43,30)-(43,56)
exprToString expr3 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (43,30)-(43,58)) (Var (Just (43,52)-(43,53)) "^") [App (Just (43,31)-(43,51)) (Var (Just (43,32)-(43,44)) "exprToString") [Var (Just (43,45)-(43,50)) "expr3"],Lit (Just (43,54)-(43,57)) (LS ")")]
*)

(* typed spans
(43,30)-(43,58)
*)

(* correct types
string
*)

(* bad types
string
*)
