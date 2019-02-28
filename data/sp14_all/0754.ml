
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ (("*" (exprToString tm3)) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) ^ "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ ("*" ^ ((exprToString tm3) ^ ")")))));;

*)

(* changed spans
(35,49)-(35,74)
exprToString ds4 ^ "))"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(39,41)-(39,65)
"*"
LitG

(39,41)-(39,65)
exprToString tm3 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (35,49)-(35,76)) (Var (Just (35,69)-(35,70)) "^") [App (Just (35,50)-(35,68)) (Var (Just (35,51)-(35,63)) "exprToString") [Var (Just (35,64)-(35,67)) "ds4"],Lit (Just (35,71)-(35,75)) (LS "))")]
Lit (Just (39,41)-(39,44)) (LS "*")
App (Just (39,47)-(39,73)) (Var (Just (39,67)-(39,68)) "^") [App (Just (39,48)-(39,66)) (Var (Just (39,49)-(39,61)) "exprToString") [Var (Just (39,62)-(39,65)) "tm3"],Lit (Just (39,69)-(39,72)) (LS ")")]
*)

(* typed spans
(35,49)-(35,76)
(39,41)-(39,44)
(39,47)-(39,73)
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
