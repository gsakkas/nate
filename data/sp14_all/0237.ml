
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Inverse a -> "1/" ^ (exprToString a)
  | Max (a,b) ->
      "max(" ^ ((exprToString a) ^ ("," ^ ((exprToString b) ^ ")")))
  | Range (a,b,c) ->
      "range(" ^
        ((exprToString a) ^
           (("," exprToString b) ^ ("," ^ ((exprToString c) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Inverse a -> "1/" ^ (exprToString a)
  | Max (a,b) ->
      "max(" ^ ((exprToString a) ^ ("," ^ ((exprToString b) ^ ")")))
  | Range (a,b,c) ->
      "range(" ^
        ((exprToString a) ^
           ("," ^ ((exprToString b) ^ ("," ^ ((exprToString c) ^ ")")))));;

*)

(* changed spans
(35,12)-(35,32)
","
LitG

(35,12)-(35,32)
exprToString b ^ ("," ^ (exprToString c ^ ")"))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (35,12)-(35,15)) (LS ",")
App (Just (35,18)-(35,71)) (Var (Just (35,36)-(35,37)) "^") [App (Just (35,19)-(35,35)) (Var (Just (35,20)-(35,32)) "exprToString") [Var (Just (35,33)-(35,34)) "b"],App (Just (35,38)-(35,70)) (Var (Just (35,43)-(35,44)) "^") [Lit (Just (35,39)-(35,42)) (LS ","),App (Just (35,45)-(35,69)) (Var (Just (35,63)-(35,64)) "^") [App (Just (35,46)-(35,62)) (Var (Just (35,47)-(35,59)) "exprToString") [Var (Just (35,60)-(35,61)) "c"],Lit (Just (35,65)-(35,68)) (LS ")")]]]
*)

(* typed spans
(35,12)-(35,15)
(35,18)-(35,71)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
