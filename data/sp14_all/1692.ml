
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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (("^" exprToString y) ^ ")")))));;


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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))));;

*)

(* changed spans
(24,42)-(24,62)
":"
LitG

(24,43)-(24,46)
(^)
VarG

(24,47)-(24,59)
exprToString y
AppG (fromList [VarG])

*)

(* changed exprs
Lit (Just (24,42)-(24,45)) (LS ":")
Var (Just (24,66)-(24,67)) "^"
App (Just (24,49)-(24,65)) (Var (Just (24,50)-(24,62)) "exprToString") [Var (Just (24,63)-(24,64)) "y"]
*)

(* typed spans
(24,42)-(24,45)
(24,66)-(24,67)
(24,49)-(24,65)
*)

(* correct types
string
string -> string -> string
string
*)

(* bad types
string
string
expr -> string
*)
