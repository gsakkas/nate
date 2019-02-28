
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
  | Sine x -> ("sin(pi*" + (exprToString x)) + ")"
  | Cosine x -> ("cos(pi*" + (exprToString x)) + ")"
  | Average (x,y) ->
      ((("((" + (exprToString x)) + "*") + (exprToString y)) + ")/2)"
  | Times (x,y) -> ((exprToString x) + "*") + (exprToString y)
  | Thresh (a,b,c,d) ->
      ((((("(" + (exprToString a)) + "<") + (exprToString b)) +
          ("?" exprToString c))
         + ":")
        + (exprToString d);;


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
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(15,14)-(15,50)
"sin(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,16)-(16,52)
"cos(pi*" ^ (exprToString x ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,6)-(18,69)
"((" ^ (exprToString x ^ ("*" ^ (exprToString y ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,19)-(19,62)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

(21,6)-(24,26)
"(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ exprToString d))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (15,14)-(15,50)) (Var (Just (15,24)-(15,25)) "^") [Lit (Just (15,14)-(15,23)) (LS "sin(pi*"),App (Just (15,26)-(15,50)) (Var (Just (15,44)-(15,45)) "^") [App (Just (15,27)-(15,43)) (Var (Just (15,28)-(15,40)) "exprToString") [Var (Just (15,41)-(15,42)) "x"],Lit (Just (15,46)-(15,49)) (LS ")")]]
App (Just (16,16)-(16,52)) (Var (Just (16,26)-(16,27)) "^") [Lit (Just (16,16)-(16,25)) (LS "cos(pi*"),App (Just (16,28)-(16,52)) (Var (Just (16,46)-(16,47)) "^") [App (Just (16,29)-(16,45)) (Var (Just (16,30)-(16,42)) "exprToString") [Var (Just (16,43)-(16,44)) "x"],Lit (Just (16,48)-(16,51)) (LS ")")]]
App (Just (18,6)-(18,69)) (Var (Just (18,11)-(18,12)) "^") [Lit (Just (18,6)-(18,10)) (LS "(("),App (Just (18,13)-(18,69)) (Var (Just (18,31)-(18,32)) "^") [App (Just (18,14)-(18,30)) (Var (Just (18,15)-(18,27)) "exprToString") [Var (Just (18,28)-(18,29)) "x"],App (Just (18,33)-(18,68)) (Var (Just (18,38)-(18,39)) "^") [Lit (Just (18,34)-(18,37)) (LS "*"),App (Just (18,40)-(18,67)) (Var (Just (18,58)-(18,59)) "^") [App (Just (18,41)-(18,57)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,56)) "y"],Lit (Just (18,60)-(18,66)) (LS ")/2)")]]]]
App (Just (19,19)-(19,62)) (Var (Just (19,36)-(19,37)) "^") [App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,32)) "exprToString") [Var (Just (19,33)-(19,34)) "x"],App (Just (19,38)-(19,62)) (Var (Just (19,43)-(19,44)) "^") [Lit (Just (19,39)-(19,42)) (LS "*"),App (Just (19,45)-(19,61)) (Var (Just (19,46)-(19,58)) "exprToString") [Var (Just (19,59)-(19,60)) "y"]]]
App (Just (21,6)-(25,73)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(25,73)) (Var (Just (22,26)-(22,27)) "^") [App (Just (22,9)-(22,25)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,24)) "a"],App (Just (23,11)-(25,72)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(25,71)) (Var (Just (24,32)-(24,33)) "^") [App (Just (24,15)-(24,31)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,30)) "b"],App (Just (25,17)-(25,70)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (25,24)-(25,69)) (Var (Just (25,42)-(25,43)) "^") [App (Just (25,25)-(25,41)) (Var (Just (25,26)-(25,38)) "exprToString") [Var (Just (25,39)-(25,40)) "c"],App (Just (25,44)-(25,68)) (Var (Just (25,49)-(25,50)) "^") [Lit (Just (25,45)-(25,48)) (LS ":"),App (Just (25,51)-(25,67)) (Var (Just (25,52)-(25,64)) "exprToString") [Var (Just (25,65)-(25,66)) "d"]]]]]]]]
*)

(* typed spans
(15,14)-(15,50)
(16,16)-(16,52)
(18,6)-(18,69)
(19,19)-(19,62)
(21,6)-(25,73)
*)

(* correct types
string
string
string
string
string
*)

(* bad types
int
int
int
int
int
*)
