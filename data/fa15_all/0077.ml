
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
           ("/2*" ^ ((exprToString e2) ^ ("/3*" ^ (exprToString e3 "/4)")))))
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
(32,51)-(32,63)
(^)
VarG

(32,51)-(32,63)
exprToString e3
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (33,63)-(33,64)) "^"
App (Just (33,45)-(33,62)) (Var (Just (33,46)-(33,58)) "exprToString") [Var (Just (33,59)-(33,61)) "e3"]
*)

(* typed spans
(33,63)-(33,64)
(33,45)-(33,62)
*)

(* correct types
string -> string -> string
string
*)

(* bad types
expr -> string
expr -> string
*)
