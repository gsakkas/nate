
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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ (("+" exprToString y) ^ ")/2)"))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 (" ? " ^
                    ((exprToString y) ^ (" : " ^ ((exprToString z) ^ ")")))))));;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 (" ? " ^
                    ((exprToString y) ^ (" : " ^ ((exprToString z) ^ ")")))))));;

*)

(* changed spans
(18,34)-(18,54)
"+"
LitG

(18,34)-(18,54)
exprToString y ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (18,34)-(18,37)) (LS "+")
App (Just (18,40)-(18,67)) (Var (Just (18,58)-(18,59)) "^") [App (Just (18,41)-(18,57)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,56)) "y"],Lit (Just (18,60)-(18,66)) (LS ")/2)")]
*)

(* typed spans
(18,34)-(18,37)
(18,40)-(18,67)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
