
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Volume (j,k,l) ->
      (exprToString e) ^ ("*" ^ (exprToString e "*" exprToString e));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Volume of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Volume (j,k,l) ->
      (exprToString e) ^
        ("*" ^ ((exprToString e) ^ ("*" ^ (exprToString e))));;

*)

(* changed spans
(30,32)-(30,67)
exprToString e ^ ("*" ^ exprToString e)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (31,15)-(31,60)) (Var (Just (31,33)-(31,34)) "^") [App (Just (31,16)-(31,32)) (Var (Just (31,17)-(31,29)) "exprToString") [Var (Just (31,30)-(31,31)) "e"],App (Just (31,35)-(31,59)) (Var (Just (31,40)-(31,41)) "^") [Lit (Just (31,36)-(31,39)) (LS "*"),App (Just (31,42)-(31,58)) (Var (Just (31,43)-(31,55)) "exprToString") [Var (Just (31,56)-(31,57)) "e"]]]
*)

(* typed spans
(31,15)-(31,60)
*)

(* correct types
string
*)

(* bad types
string
*)
