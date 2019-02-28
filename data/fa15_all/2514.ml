
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin (pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))))
  | TimesTimes (e1,e2,e3) ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e2) ^ (" * " ^ (exprToString e3))))
  | Cube e1 ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e1) ^ (" * " ^ (exprToString e1))))
  | MultDivBy6 (e1,e2) ->
      ("((" (exprToString e1)) ^ (" * " ^ ((exprToString e2) ^ ") /6)"));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin (pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))))
  | TimesTimes (e1,e2,e3) ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e2) ^ (" * " ^ (exprToString e3))))
  | Cube e1 ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e1) ^ (" * " ^ (exprToString e1))))
  | MultDivBy6 (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" * " ^ ((exprToString e2) ^ ") /6)")));;

*)

(* changed spans
(37,6)-(37,30)
"(("
LitG

(37,6)-(37,30)
exprToString e1 ^ (" * " ^ (exprToString e2 ^ ") /6)"))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (37,6)-(37,10)) (LS "((")
App (Just (37,13)-(37,74)) (Var (Just (37,32)-(37,33)) "^") [App (Just (37,14)-(37,31)) (Var (Just (37,15)-(37,27)) "exprToString") [Var (Just (37,28)-(37,30)) "e1"],App (Just (37,34)-(37,73)) (Var (Just (37,41)-(37,42)) "^") [Lit (Just (37,35)-(37,40)) (LS " * "),App (Just (37,43)-(37,72)) (Var (Just (37,62)-(37,63)) "^") [App (Just (37,44)-(37,61)) (Var (Just (37,45)-(37,57)) "exprToString") [Var (Just (37,58)-(37,60)) "e2"],Lit (Just (37,64)-(37,71)) (LS ") /6)")]]]
*)

(* typed spans
(37,6)-(37,10)
(37,13)-(37,74)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
