
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
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ (("*" (exprToString t2)) ^ ")"))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;


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
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ ("*" ^ ((exprToString t2) ^ ")")))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;

*)

(* changed spans
(20,34)-(20,57)
"*"
LitG

(20,34)-(20,57)
exprToString t2 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (20,34)-(20,37)) (LS "*")
App (Just (20,40)-(20,65)) (Var (Just (20,59)-(20,60)) "^") [App (Just (20,41)-(20,58)) (Var (Just (20,42)-(20,54)) "exprToString") [Var (Just (20,55)-(20,57)) "t2"],Lit (Just (20,61)-(20,64)) (LS ")")]
*)

(* typed spans
(20,34)-(20,37)
(20,40)-(20,65)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
