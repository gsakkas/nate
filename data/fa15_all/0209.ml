
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
  | Sine e1 -> "sin pi*" ^ (exprToString e1)
  | Cosine e1 -> "cos pi*" ^ (exprToString e1)
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ (exprToString e2 "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;


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
  | Sine e1 -> "sin pi*" ^ (exprToString e1)
  | Cosine e1 -> "cos pi*" ^ (exprToString e1)
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(17,51)-(17,63)
(^)
VarG

(17,51)-(17,63)
exprToString e2
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (17,69)-(17,70)) "^"
App (Just (17,51)-(17,68)) (Var (Just (17,52)-(17,64)) "exprToString") [Var (Just (17,65)-(17,67)) "e2"]
*)

(* typed spans
(17,69)-(17,70)
(17,51)-(17,68)
*)

(* correct types
string -> string -> string
string
*)

(* bad types
expr -> string
expr -> string
*)
