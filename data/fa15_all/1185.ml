
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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ (exprToString d ")" "/2)")))
  | Times (e,f) -> exprToString e "*" exprToString f
  | Thresh (g,h,i,j) ->
      "(" exprToString g "<" exprToString h "?" exprToString i ":"
        exprToString j ")";;


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
  | Sine a -> "(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ ((exprToString d) ^ ")/2)")))
  | Times (e,f) -> (exprToString e) ^ ("*" ^ (exprToString f))
  | Thresh (g,h,i,j) ->
      "(" ^
        ((exprToString g) ^
           ("<" ^
              ((exprToString h) ^
                 ("?" ^ ((exprToString i) ^ (":" ^ ((exprToString j) ^ ")")))))));;

*)

(* changed spans
(18,40)-(18,66)
exprToString d ^ ")/2)"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,19)-(19,31)
exprToString e ^ ("*" ^ exprToString f)
AppG (fromList [AppG (fromList [EmptyG])])

(19,34)-(19,37)
"*" ^ exprToString f
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,38)-(19,50)
exprToString f
AppG (fromList [VarG])

(21,6)-(22,26)
"(" ^ (exprToString g ^ ("<" ^ (exprToString h ^ ("?" ^ (exprToString i ^ (":" ^ (exprToString j ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (18,40)-(18,67)) (Var (Just (18,58)-(18,59)) "^") [App (Just (18,41)-(18,57)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,56)) "d"],Lit (Just (18,60)-(18,66)) (LS ")/2)")]
App (Just (19,19)-(19,62)) (Var (Just (19,36)-(19,37)) "^") [App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,32)) "exprToString") [Var (Just (19,33)-(19,34)) "e"],App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "f"]]]
App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "f"]]
App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "f"]
App (Just (21,6)-(25,81)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(25,81)) (Var (Just (22,26)-(22,27)) "^") [App (Just (22,9)-(22,25)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,24)) "g"],App (Just (23,11)-(25,80)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(25,79)) (Var (Just (24,32)-(24,33)) "^") [App (Just (24,15)-(24,31)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,30)) "h"],App (Just (25,17)-(25,78)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (25,24)-(25,77)) (Var (Just (25,42)-(25,43)) "^") [App (Just (25,25)-(25,41)) (Var (Just (25,26)-(25,38)) "exprToString") [Var (Just (25,39)-(25,40)) "i"],App (Just (25,44)-(25,76)) (Var (Just (25,49)-(25,50)) "^") [Lit (Just (25,45)-(25,48)) (LS ":"),App (Just (25,51)-(25,75)) (Var (Just (25,69)-(25,70)) "^") [App (Just (25,52)-(25,68)) (Var (Just (25,53)-(25,65)) "exprToString") [Var (Just (25,66)-(25,67)) "j"],Lit (Just (25,71)-(25,74)) (LS ")")]]]]]]]]
*)

(* typed spans
(18,40)-(18,67)
(19,19)-(19,62)
(19,38)-(19,62)
(19,45)-(19,61)
(21,6)-(25,81)
*)

(* correct types
string
string
string
string
string
*)

(* bad types
string
expr -> string
string
expr -> string
string
*)
