
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
(18,7)-(18,28)
"(("
LitG

(18,32)-(18,35)
exprToString y
AppG [VarG]

(18,38)-(18,70)
"+" ^ (exprToString y ^ ")/2)")
AppG [LitG,AppG [EmptyG,EmptyG]]

(19,20)-(19,53)
exprToString x ^ ("*" ^ exprToString y)
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(15,27)-(15,51)
(15,28)-(15,44)
(15,29)-(15,41)
(15,45)-(15,46)
(18,7)-(18,28)
(18,8)-(18,12)
(18,31)-(18,71)
(18,36)-(18,37)
(18,38)-(18,70)
(18,39)-(18,59)
(18,40)-(18,52)
(18,62)-(18,69)
(18,63)-(18,64)
(19,20)-(19,32)
(19,20)-(19,53)
*)
