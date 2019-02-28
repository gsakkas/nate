
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
  | Sine e -> "sin (pi*" exprToString e ")"
  | Cosine e -> "cos (pi*" exprToString e ")"
  | Average (e,ex) -> "((" exprToString e "+" exprToString ex ")/2)"
  | Times (e,ex) -> exprToString e "*" exprToString ex
  | Thresh (e1,e2,e3,e4) ->
      "(" exprToString e1 "<" exprToString e2 "?" exprToString e3 ":"
        exprToString e4 ")";;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos (pi*" ^ ((exprToString e) ^ ")")
  | Average (e,ex) ->
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString ex) ^ ")/2)")))
  | Times (e,ex) -> (exprToString e) ^ ("*" ^ (exprToString ex))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(15,14)-(15,43)
"sin (pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,16)-(16,45)
"cos (pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,22)-(17,68)
"((" ^ (exprToString e ^ ("+" ^ (exprToString ex ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,20)-(18,54)
exprToString e ^ ("*" ^ exprToString ex)
AppG (fromList [AppG (fromList [EmptyG])])

(20,6)-(21,27)
"(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (15,14)-(15,51)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,14)-(15,24)) (LS "sin (pi*"),App (Just (15,27)-(15,51)) (Var (Just (15,45)-(15,46)) "^") [App (Just (15,28)-(15,44)) (Var (Just (15,29)-(15,41)) "exprToString") [Var (Just (15,42)-(15,43)) "e"],Lit (Just (15,47)-(15,50)) (LS ")")]]
App (Just (16,16)-(16,53)) (Var (Just (16,27)-(16,28)) "^") [Lit (Just (16,16)-(16,26)) (LS "cos (pi*"),App (Just (16,29)-(16,53)) (Var (Just (16,47)-(16,48)) "^") [App (Just (16,30)-(16,46)) (Var (Just (16,31)-(16,43)) "exprToString") [Var (Just (16,44)-(16,45)) "e"],Lit (Just (16,49)-(16,52)) (LS ")")]]
App (Just (18,6)-(18,70)) (Var (Just (18,11)-(18,12)) "^") [Lit (Just (18,6)-(18,10)) (LS "(("),App (Just (18,13)-(18,70)) (Var (Just (18,31)-(18,32)) "^") [App (Just (18,14)-(18,30)) (Var (Just (18,15)-(18,27)) "exprToString") [Var (Just (18,28)-(18,29)) "e"],App (Just (18,33)-(18,69)) (Var (Just (18,38)-(18,39)) "^") [Lit (Just (18,34)-(18,37)) (LS "+"),App (Just (18,40)-(18,68)) (Var (Just (18,59)-(18,60)) "^") [App (Just (18,41)-(18,58)) (Var (Just (18,42)-(18,54)) "exprToString") [Var (Just (18,55)-(18,57)) "ex"],Lit (Just (18,61)-(18,67)) (LS ")/2)")]]]]
App (Just (19,20)-(19,64)) (Var (Just (19,37)-(19,38)) "^") [App (Just (19,20)-(19,36)) (Var (Just (19,21)-(19,33)) "exprToString") [Var (Just (19,34)-(19,35)) "e"],App (Just (19,39)-(19,64)) (Var (Just (19,44)-(19,45)) "^") [Lit (Just (19,40)-(19,43)) (LS "*"),App (Just (19,46)-(19,63)) (Var (Just (19,47)-(19,59)) "exprToString") [Var (Just (19,60)-(19,62)) "ex"]]]
App (Just (21,6)-(26,79)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(26,79)) (Var (Just (22,27)-(22,28)) "^") [App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,25)) "e1"],App (Just (23,11)-(26,78)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(26,77)) (Var (Just (24,33)-(24,34)) "^") [App (Just (24,15)-(24,32)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,31)) "e2"],App (Just (25,17)-(26,76)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (26,20)-(26,75)) (Var (Just (26,39)-(26,40)) "^") [App (Just (26,21)-(26,38)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,37)) "e3"],App (Just (26,41)-(26,74)) (Var (Just (26,46)-(26,47)) "^") [Lit (Just (26,42)-(26,45)) (LS ":"),App (Just (26,48)-(26,73)) (Var (Just (26,67)-(26,68)) "^") [App (Just (26,49)-(26,66)) (Var (Just (26,50)-(26,62)) "exprToString") [Var (Just (26,63)-(26,65)) "e4"],Lit (Just (26,69)-(26,72)) (LS ")")]]]]]]]]
*)

(* typed spans
(15,14)-(15,51)
(16,16)-(16,53)
(18,6)-(18,70)
(19,20)-(19,64)
(21,6)-(26,79)
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
string
string
string
string
*)
