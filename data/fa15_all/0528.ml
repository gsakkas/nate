
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
  | Sine b -> "sin(pi*" ^ ((exprToString b) ^ ")")
  | Cosine b -> "cos(pi*" ^ ((exprToString b) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2))")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^
                    ((exprToString c) ^ (":" ^ ((exprToString d) :: ")")))))))
  | _ -> "";;


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
  | Sine b -> "sin(pi*" ^ ((exprToString b) ^ ")")
  | Cosine b -> "cos(pi*" ^ ((exprToString b) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2))")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "";;

*)

(* changed spans
(26,47)-(26,72)
exprToString d ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (25,51)-(25,75)) (Var (Just (25,69)-(25,70)) "^") [App (Just (25,52)-(25,68)) (Var (Just (25,53)-(25,65)) "exprToString") [Var (Just (25,66)-(25,67)) "d"],Lit (Just (25,71)-(25,74)) (LS ")")]
*)

(* typed spans
(25,51)-(25,75)
*)

(* correct types
string
*)

(* bad types
string list
*)
