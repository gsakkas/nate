
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e,f) ->
      "((" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")/2)")))
  | Times (e,f) ->
      "(" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")")))
  | Thresh (e,f,g,h) ->
      "(" ^
        ((exprToString e) ^
           ("<" ^
              ((exprToString f) ^
                 ("?" ^ ((exprToString g) ^ (":" ^ ((exprToString h) ^ ")")))))))
  | Timmy1 (e1,e2) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^ (")*" ^ ("cos(pi*" ^ ((exprToString e2) ^ ")"))))
  | Timmy2 (e1,e2,e3) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^
           (")*" ^
              ("(cos^2(pi*" ^
                 ((exprToString e2) ^
                    (")*" ^ (("cos(" exprToString e3) ^ "))"))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e,f) ->
      "((" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")/2)")))
  | Times (e,f) ->
      "(" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")")))
  | Thresh (e,f,g,h) ->
      "(" ^
        ((exprToString e) ^
           ("<" ^
              ((exprToString f) ^
                 ("?" ^ ((exprToString g) ^ (":" ^ ((exprToString h) ^ ")")))))))
  | Timmy1 (e1,e2) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^ (")*" ^ ("cos(pi*" ^ ((exprToString e2) ^ ")"))))
  | Timmy2 (e1,e2,e3) ->
      "sin^.5(pi*" ^
        ((exprToString e1) ^
           (")*" ^
              ("(cos^2(pi*" ^
                 ((exprToString e2) ^
                    (")*" ^ ("cos(" ^ ((exprToString e3) ^ "))")))))));;

*)

(* changed spans
(33,6)-(33,17)
"sin^.5(pi*"
LitG

(38,29)-(38,53)
"cos("
LitG

(38,29)-(38,53)
exprToString e3 ^ "))"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (33,6)-(33,18)) (LS "sin^.5(pi*")
Lit (Just (38,29)-(38,35)) (LS "cos(")
App (Just (38,38)-(38,64)) (Var (Just (38,57)-(38,58)) "^") [App (Just (38,39)-(38,56)) (Var (Just (38,40)-(38,52)) "exprToString") [Var (Just (38,53)-(38,55)) "e3"],Lit (Just (38,59)-(38,63)) (LS "))")]
*)

(* typed spans
(33,6)-(33,18)
(38,29)-(38,35)
(38,38)-(38,64)
*)

(* correct types
string
string
string
*)

(* bad types
string
string
string
*)
