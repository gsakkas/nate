
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))))
  | Plus (v,w) -> "(" ^ ((exprToString v) ^ (("+" exprToString w) ^ ")"))
  | Cube (v,w,x) ->
      "(" ^
        ((exprToString v) ^
           ("*" ^ ((exprToString w) ^ ("*" ^ (exprToString x)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))))
  | Plus (v,w) -> "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")")))
  | Cube (v,w,x) ->
      "(" ^
        ((exprToString v) ^
           ("*" ^ ((exprToString w) ^ ("*" ^ (exprToString x)))));;

*)

(* changed spans
(27,45)-(27,65)
"+"
LitG

(27,45)-(27,65)
exprToString w ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (27,45)-(27,48)) (LS "+")
App (Just (27,51)-(27,75)) (Var (Just (27,69)-(27,70)) "^") [App (Just (27,52)-(27,68)) (Var (Just (27,53)-(27,65)) "exprToString") [Var (Just (27,66)-(27,67)) "w"],Lit (Just (27,71)-(27,74)) (LS ")")]
*)

(* typed spans
(27,45)-(27,48)
(27,51)-(27,75)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
