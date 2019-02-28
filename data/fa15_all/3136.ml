
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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ (exprToString e2 ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ (exprToString e2 ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ ((exprToString e2) ^ ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(18,42)-(18,54)
(^)
VarG

(18,42)-(18,54)
exprToString e2
AppG (fromList [VarG])

(20,41)-(20,53)
(^)
VarG

(20,41)-(20,53)
exprToString e2
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (18,60)-(18,61)) "^"
App (Just (18,42)-(18,59)) (Var (Just (18,43)-(18,55)) "exprToString") [Var (Just (18,56)-(18,58)) "e2"]
Var (Just (20,59)-(20,60)) "^"
App (Just (20,41)-(20,58)) (Var (Just (20,42)-(20,54)) "exprToString") [Var (Just (20,55)-(20,57)) "e2"]
*)

(* typed spans
(18,60)-(18,61)
(18,42)-(18,59)
(20,59)-(20,60)
(20,41)-(20,58)
*)

(* correct types
string -> string -> string
string
string -> string -> string
string
*)

(* bad types
expr -> string
expr -> string
expr -> string
expr -> string
*)
