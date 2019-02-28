
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      ("((" exprToString e) ^ ("+" ^ ((exprToString e ")") / (2 ")")))
  | Times (x,y) -> exprToString e "*" exprToString e;;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y));;

*)

(* changed spans
(18,6)-(18,27)
EMPTY
EmptyG

(18,12)-(18,24)
exprToString y ^ ("+" ^ (exprToString y ^ ")/2)"))
AppG (fromList [AppG (fromList [EmptyG])])

(18,25)-(18,26)
y
VarG

(18,37)-(18,69)
EMPTY
EmptyG

(18,39)-(18,51)
exprToString y
AppG (fromList [VarG])

(18,52)-(18,53)
EMPTY
EmptyG

(18,54)-(18,57)
y
VarG

(18,61)-(18,68)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

(18,62)-(18,63)
EMPTY
EmptyG

(18,64)-(18,67)
EMPTY
EmptyG

(19,19)-(19,52)
EMPTY
EmptyG

(19,32)-(19,33)
x
VarG

(19,34)-(19,37)
"*" ^ exprToString y
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,38)-(19,50)
exprToString y
AppG (fromList [VarG])

(19,51)-(19,52)
y
VarG

*)

(* typed spans
string
expr
string
expr
string
expr
string
string
expr
*)
