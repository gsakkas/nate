
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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 (("?" exprToString c) ^ (":" ^ (exprToString d))))));;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(25,18)-(25,38)
"?"
LitG

(25,18)-(25,38)
exprToString c ^ (":" ^ exprToString d)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (25,18)-(25,21)) (LS "?")
App (Just (25,24)-(25,69)) (Var (Just (25,42)-(25,43)) "^") [App (Just (25,25)-(25,41)) (Var (Just (25,26)-(25,38)) "exprToString") [Var (Just (25,39)-(25,40)) "c"],App (Just (25,44)-(25,68)) (Var (Just (25,49)-(25,50)) "^") [Lit (Just (25,45)-(25,48)) (LS ":"),App (Just (25,51)-(25,67)) (Var (Just (25,52)-(25,64)) "exprToString") [Var (Just (25,65)-(25,66)) "d"]]]
*)

(* typed spans
(25,18)-(25,21)
(25,24)-(25,69)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
