
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
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" exprToString a ")"
  | Average (a,b) -> "((" exprToString a "+" exprToString b ")/2)"
  | Times (a,b) -> exprToString a "*" exprToString b
  | Thresh (a,b,c,d) ->
      "(" exprToString a "<" exprToString b "?" exprToString c ":"
        exprToString d ")";;


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
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))));;

*)

(* changed spans
(16,16)-(16,44)
"cos(pi*" ^ (exprToString a ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,21)-(17,66)
"((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,19)-(18,52)
exprToString a ^ ("*" ^ exprToString b)
AppG (fromList [AppG (fromList [EmptyG])])

(20,6)-(21,26)
"(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (16,16)-(16,52)) (Var (Just (16,26)-(16,27)) "^") [Lit (Just (16,16)-(16,25)) (LS "cos(pi*"),App (Just (16,28)-(16,52)) (Var (Just (16,46)-(16,47)) "^") [App (Just (16,29)-(16,45)) (Var (Just (16,30)-(16,42)) "exprToString") [Var (Just (16,43)-(16,44)) "a"],Lit (Just (16,48)-(16,51)) (LS ")")]]
App (Just (18,6)-(18,69)) (Var (Just (18,11)-(18,12)) "^") [Lit (Just (18,6)-(18,10)) (LS "(("),App (Just (18,13)-(18,69)) (Var (Just (18,31)-(18,32)) "^") [App (Just (18,14)-(18,30)) (Var (Just (18,15)-(18,27)) "exprToString") [Var (Just (18,28)-(18,29)) "a"],App (Just (18,33)-(18,68)) (Var (Just (18,38)-(18,39)) "^") [Lit (Just (18,34)-(18,37)) (LS "+"),App (Just (18,40)-(18,67)) (Var (Just (18,58)-(18,59)) "^") [App (Just (18,41)-(18,57)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,56)) "b"],Lit (Just (18,60)-(18,66)) (LS ")/2)")]]]]
App (Just (19,19)-(19,62)) (Var (Just (19,36)-(19,37)) "^") [App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,32)) "exprToString") [Var (Just (19,33)-(19,34)) "a"],App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "b"]]]
App (Just (21,6)-(25,81)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(25,81)) (Var (Just (22,26)-(22,27)) "^") [App (Just (22,9)-(22,25)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,24)) "a"],App (Just (23,11)-(25,80)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(25,79)) (Var (Just (24,32)-(24,33)) "^") [App (Just (24,15)-(24,31)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,30)) "b"],App (Just (25,17)-(25,78)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (25,24)-(25,77)) (Var (Just (25,42)-(25,43)) "^") [App (Just (25,25)-(25,41)) (Var (Just (25,26)-(25,38)) "exprToString") [Var (Just (25,39)-(25,40)) "c"],App (Just (25,44)-(25,76)) (Var (Just (25,49)-(25,50)) "^") [Lit (Just (25,45)-(25,48)) (LS ":"),App (Just (25,51)-(25,75)) (Var (Just (25,69)-(25,70)) "^") [App (Just (25,52)-(25,68)) (Var (Just (25,53)-(25,65)) "exprToString") [Var (Just (25,66)-(25,67)) "d"],Lit (Just (25,71)-(25,74)) (LS ")")]]]]]]]]
*)

(* typed spans
(16,16)-(16,52)
(18,6)-(18,69)
(19,19)-(19,62)
(21,6)-(25,81)
*)

(* correct types
string
string
string
string
*)

(* bad types
string
string
string
string
*)
