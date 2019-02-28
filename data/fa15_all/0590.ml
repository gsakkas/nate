
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

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
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1 "*") ^
           ((exprToString e2 "*") ^ ((exprToString e3) ^ ")")))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

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
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("*" ^ ((exprToString e2) ^ ("*" ^ ((exprToString e3) ^ ")")))))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,9)-(31,30)
exprToString e1
AppG (fromList [VarG])

(32,12)-(32,33)
"*"
LitG

(32,13)-(32,25)
(^)
VarG

(32,13)-(32,25)
exprToString e2
AppG (fromList [VarG])

(32,29)-(32,32)
"*" ^ (exprToString e3 ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (31,9)-(31,26)) (Var (Just (31,10)-(31,22)) "exprToString") [Var (Just (31,23)-(31,25)) "e1"]
Lit (Just (32,12)-(32,15)) (LS "*")
Var (Just (32,37)-(32,38)) "^"
App (Just (32,19)-(32,36)) (Var (Just (32,20)-(32,32)) "exprToString") [Var (Just (32,33)-(32,35)) "e2"]
App (Just (32,39)-(32,72)) (Var (Just (32,44)-(32,45)) "^") [Lit (Just (32,40)-(32,43)) (LS "*"),App (Just (32,46)-(32,71)) (Var (Just (32,65)-(32,66)) "^") [App (Just (32,47)-(32,64)) (Var (Just (32,48)-(32,60)) "exprToString") [Var (Just (32,61)-(32,63)) "e3"],Lit (Just (32,67)-(32,70)) (LS ")")]]
*)

(* typed spans
(31,9)-(31,26)
(32,12)-(32,15)
(32,37)-(32,38)
(32,19)-(32,36)
(32,39)-(32,72)
*)

(* correct types
string
string
string -> string -> string
string
string
*)

(* bad types
string
string
expr -> string
expr -> string
string
*)
