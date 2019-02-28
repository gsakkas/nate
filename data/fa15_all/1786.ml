
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Harmonic of expr* expr
  | Log of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Harmonic (e1,e2) ->
      "((" ^
        ((exprToString e1) ^
           ("*" ^
              ((exprToString e2) ^
                 (")/(" ^ ((exprToString e1) ^ ("+" ^ (exprToString e2 ")")))))))
  | Log (e1,e2,e3) ->
      "(log(" ^
        ((exprToString e1) ^
           ("/" ^
              ((exprToString e2 ")/") ^ ("log(" ^ ((exprToString e3) ^ "))")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Harmonic of expr* expr
  | Log of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Harmonic (e1,e2) ->
      "((" ^
        ((exprToString e1) ^
           ("*" ^
              ((exprToString e2) ^
                 (")/(" ^
                    ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")")))))))
  | Log (e1,e2,e3) ->
      "(log(" ^
        ((exprToString e1) ^
           ("/" ^
              ((exprToString e2) ^
                 (")/" ^ ("log(" ^ ((exprToString e3) ^ "))"))))));;

*)

(* changed spans
(34,55)-(34,67)
(^)
VarG

(34,55)-(34,67)
exprToString e2
AppG (fromList [VarG])

(39,15)-(39,37)
exprToString e2
AppG (fromList [VarG])

(39,32)-(39,36)
")/" ^ ("log(" ^ (exprToString e3 ^ "))"))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Var (Just (35,67)-(35,68)) "^"
App (Just (35,49)-(35,66)) (Var (Just (35,50)-(35,62)) "exprToString") [Var (Just (35,63)-(35,65)) "e2"]
App (Just (40,15)-(40,32)) (Var (Just (40,16)-(40,28)) "exprToString") [Var (Just (40,29)-(40,31)) "e2"]
App (Just (41,17)-(41,63)) (Var (Just (41,23)-(41,24)) "^") [Lit (Just (41,18)-(41,22)) (LS ")/"),App (Just (41,25)-(41,62)) (Var (Just (41,33)-(41,34)) "^") [Lit (Just (41,26)-(41,32)) (LS "log("),App (Just (41,35)-(41,61)) (Var (Just (41,54)-(41,55)) "^") [App (Just (41,36)-(41,53)) (Var (Just (41,37)-(41,49)) "exprToString") [Var (Just (41,50)-(41,52)) "e3"],Lit (Just (41,56)-(41,60)) (LS "))")]]]
*)

(* typed spans
(35,67)-(35,68)
(35,49)-(35,66)
(40,15)-(40,32)
(41,17)-(41,63)
*)

(* correct types
string -> string -> string
string
string
string
*)

(* bad types
expr -> string
expr -> string
string
string
*)
