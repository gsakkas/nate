
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
  | Times (x,y) -> ((exprToString x) + "*") ^ (exprToString y)
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
(19,19)-(19,43)
exprToString x
AppG (fromList [VarG])

(19,19)-(19,43)
"*" ^ exprToString y
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(25,18)-(25,38)
"?"
LitG

(25,18)-(25,38)
exprToString c ^ (":" ^ exprToString d)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,32)) "exprToString") [Var (Just (19,33)-(19,34)) "x"]
App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "y"]]
Lit (Just (25,18)-(25,21)) (LS "?")
App (Just (25,24)-(25,69)) (Var (Just (25,42)-(25,43)) "^") [App (Just (25,25)-(25,41)) (Var (Just (25,26)-(25,38)) "exprToString") [Var (Just (25,39)-(25,40)) "c"],App (Just (25,44)-(25,68)) (Var (Just (25,49)-(25,50)) "^") [Lit (Just (25,45)-(25,48)) (LS ":"),App (Just (25,51)-(25,67)) (Var (Just (25,52)-(25,64)) "exprToString") [Var (Just (25,65)-(25,66)) "d"]]]
*)

(* typed spans
(19,19)-(19,35)
(19,38)-(19,62)
(25,18)-(25,21)
(25,24)-(25,69)
*)

(* correct types
string
string
string
string
*)

(* bad types
int
int
string
string
*)
