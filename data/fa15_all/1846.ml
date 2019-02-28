
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr;;

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
  | Square e -> "%s*%s" exprToString e exprToString e;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr;;

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
  | Square e -> (exprToString e) ^ ("*" ^ (exprToString e));;

*)

(* changed spans
(28,16)-(28,53)
exprToString e ^ ("*" ^ exprToString e)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (28,16)-(28,59)) (Var (Just (28,33)-(28,34)) "^") [App (Just (28,16)-(28,32)) (Var (Just (28,17)-(28,29)) "exprToString") [Var (Just (28,30)-(28,31)) "e"],App (Just (28,35)-(28,59)) (Var (Just (28,40)-(28,41)) "^") [Lit (Just (28,36)-(28,39)) (LS "*"),App (Just (28,42)-(28,58)) (Var (Just (28,43)-(28,55)) "exprToString") [Var (Just (28,56)-(28,57)) "e"]]]
*)

(* typed spans
(28,16)-(28,59)
*)

(* correct types
string
*)

(* bad types
string
*)
