
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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (("+" exprToString b) ^ ")/20"))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;


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
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/20")))
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | VarY  -> "x"
  | VarX  -> "y";;

*)

(* changed spans
(21,34)-(21,54)
"+"
LitG

(21,34)-(21,54)
exprToString b ^ ")/20"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (21,34)-(21,37)) (LS "+")
App (Just (21,40)-(21,67)) (Var (Just (21,58)-(21,59)) "^") [App (Just (21,41)-(21,57)) (Var (Just (21,42)-(21,54)) "exprToString") [Var (Just (21,55)-(21,56)) "b"],Lit (Just (21,60)-(21,66)) (LS ")/20")]
*)

(* typed spans
(21,34)-(21,37)
(21,40)-(21,67)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
