
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
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           (("<" exprToString e2) ^
              (" ? " ^
                 ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")"))))));;


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
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(23,12)-(23,33)
"<"
LitG

(23,12)-(23,33)
exprToString e2 ^ (" ? " ^ (exprToString e3 ^ (" : " ^ (exprToString e4 ^ ")"))))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (23,12)-(23,15)) (LS "<")
App (Just (24,14)-(26,79)) (Var (Just (24,33)-(24,34)) "^") [App (Just (24,15)-(24,32)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,31)) "e2"],App (Just (25,17)-(26,78)) (Var (Just (25,24)-(25,25)) "^") [Lit (Just (25,18)-(25,23)) (LS " ? "),App (Just (26,20)-(26,77)) (Var (Just (26,39)-(26,40)) "^") [App (Just (26,21)-(26,38)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,37)) "e3"],App (Just (26,41)-(26,76)) (Var (Just (26,48)-(26,49)) "^") [Lit (Just (26,42)-(26,47)) (LS " : "),App (Just (26,50)-(26,75)) (Var (Just (26,69)-(26,70)) "^") [App (Just (26,51)-(26,68)) (Var (Just (26,52)-(26,64)) "exprToString") [Var (Just (26,65)-(26,67)) "e4"],Lit (Just (26,71)-(26,74)) (LS ")")]]]]]
*)

(* typed spans
(23,12)-(23,15)
(24,14)-(26,79)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
