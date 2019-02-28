
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Op (x,y,z) ->
      "(" ^
        ((exprToString x) ^
           ("*" ^
              ((exprToString y) ^
                 ("*" ^
                    (((exprToString z) ")/(") ^
                       ((exprToString x) ^
                          ("+" ^
                             ((exprToString y) ^
                                (("+" (exprToString z)) ^ ")")))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Op (x,y,z) ->
      "(" ^
        ((exprToString x) ^
           ("*" ^
              ((exprToString y) ^
                 ("*" ^
                    ((exprToString z) ^
                       (")/(" ^
                          ((exprToString x) ^
                             ("+" ^
                                ((exprToString y) ^
                                   ("+" ^ ((exprToString z) ^ ")")))))))))));;

*)

(* changed spans
(35,22)-(35,38)
exprToString
VarG

(35,22)-(35,38)
z
VarG

(35,22)-(35,38)
")/(" ^ (exprToString x ^ ("+" ^ (exprToString y ^ ("+" ^ (exprToString z ^ ")")))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(39,33)-(39,55)
"+"
LitG

(39,33)-(39,55)
exprToString z ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Var (Just (35,22)-(35,34)) "exprToString"
Var (Just (35,35)-(35,36)) "z"
App (Just (36,23)-(40,71)) (Var (Just (36,30)-(36,31)) "^") [Lit (Just (36,24)-(36,29)) (LS ")/("),App (Just (37,26)-(40,70)) (Var (Just (37,44)-(37,45)) "^") [App (Just (37,27)-(37,43)) (Var (Just (37,28)-(37,40)) "exprToString") [Var (Just (37,41)-(37,42)) "x"],App (Just (38,29)-(40,69)) (Var (Just (38,34)-(38,35)) "^") [Lit (Just (38,30)-(38,33)) (LS "+"),App (Just (39,32)-(40,68)) (Var (Just (39,50)-(39,51)) "^") [App (Just (39,33)-(39,49)) (Var (Just (39,34)-(39,46)) "exprToString") [Var (Just (39,47)-(39,48)) "y"],App (Just (40,35)-(40,67)) (Var (Just (40,40)-(40,41)) "^") [Lit (Just (40,36)-(40,39)) (LS "+"),App (Just (40,42)-(40,66)) (Var (Just (40,60)-(40,61)) "^") [App (Just (40,43)-(40,59)) (Var (Just (40,44)-(40,56)) "exprToString") [Var (Just (40,57)-(40,58)) "z"],Lit (Just (40,62)-(40,65)) (LS ")")]]]]]]
Lit (Just (40,36)-(40,39)) (LS "+")
App (Just (40,42)-(40,66)) (Var (Just (40,60)-(40,61)) "^") [App (Just (40,43)-(40,59)) (Var (Just (40,44)-(40,56)) "exprToString") [Var (Just (40,57)-(40,58)) "z"],Lit (Just (40,62)-(40,65)) (LS ")")]
*)

(* typed spans
(35,22)-(35,34)
(35,35)-(35,36)
(36,23)-(40,71)
(40,36)-(40,39)
(40,42)-(40,66)
*)

(* correct types
expr -> string
expr
string
string
string
*)

(* bad types
string
string
string
string
string
*)
