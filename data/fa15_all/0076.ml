
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
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
  | Uncreative (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/2*" ^ ((exprToString e2 "/3*") ^ (exprToString e3 "/4)"))))
  | Creative e1 -> "(-1*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
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
  | Uncreative (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/2*" ^
              ((exprToString e2) ^ ("/3*" ^ ((exprToString e3) ^ "/4)")))))
  | Creative e1 -> "(-1*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(32,21)-(32,44)
exprToString e2
AppG (fromList [VarG])

(32,38)-(32,43)
"/3*" ^ (exprToString e3 ^ "/4)")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(32,48)-(32,60)
(^)
VarG

(32,48)-(32,60)
exprToString e3
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (33,15)-(33,32)) (Var (Just (33,16)-(33,28)) "exprToString") [Var (Just (33,29)-(33,31)) "e2"]
App (Just (33,35)-(33,72)) (Var (Just (33,42)-(33,43)) "^") [Lit (Just (33,36)-(33,41)) (LS "/3*"),App (Just (33,44)-(33,71)) (Var (Just (33,63)-(33,64)) "^") [App (Just (33,45)-(33,62)) (Var (Just (33,46)-(33,58)) "exprToString") [Var (Just (33,59)-(33,61)) "e3"],Lit (Just (33,65)-(33,70)) (LS "/4)")]]
Var (Just (33,63)-(33,64)) "^"
App (Just (33,45)-(33,62)) (Var (Just (33,46)-(33,58)) "exprToString") [Var (Just (33,59)-(33,61)) "e3"]
*)

(* typed spans
(33,15)-(33,32)
(33,35)-(33,72)
(33,63)-(33,64)
(33,45)-(33,62)
*)

(* correct types
string
string
string -> string -> string
string
*)

(* bad types
string
string
expr -> string
expr -> string
*)
