
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Substract of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Substract (j,k) ->
      "(" ^ ((exprToString j) ^ ("-" ^ (exprToString k ")")));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squares of expr
  | Substract of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 ("?" ^ ((exprToString y) ^ (":" ^ (exprToString z)))))))
  | Squares e -> (exprToString e) ^ ("*" ^ (exprToString e))
  | Substract (j,k) -> (exprToString e) ^ ("-" ^ (exprToString e));;

*)

(* changed spans
(30,12)-(30,61)
exprToString e
AppG (fromList [VarG])

(30,40)-(30,52)
exprToString e
AppG (fromList [VarG])

(30,55)-(30,58)
e
VarG

*)

(* changed exprs
App (Just (29,23)-(29,39)) (Var (Just (29,24)-(29,36)) "exprToString") [Var (Just (29,37)-(29,38)) "e"]
App (Just (29,49)-(29,65)) (Var (Just (29,50)-(29,62)) "exprToString") [Var (Just (29,63)-(29,64)) "e"]
Var (Just (29,63)-(29,64)) "e"
*)

(* typed spans
(29,23)-(29,39)
(29,49)-(29,65)
(29,63)-(29,64)
*)

(* correct types
string
string
expr
*)

(* bad types
string
expr -> string
string
*)
