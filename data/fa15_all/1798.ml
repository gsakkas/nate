
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = if e = VarX then "x";;


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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

*)

(* changed spans
(11,25)-(11,45)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine ex -> "sin(pi*" ^ (exprToString ex ^ ")")
| Cosine ex -> "cos(pi*" ^ (exprToString ex ^ ")")
| Average (ex1 , ex2) -> "(" ^ (exprToString ex1 ^ ("*" ^ (exprToString ex2 ^ ")/2")))
| Times (ex1 , ex2) -> exprToString ex1 ^ ("*" ^ exprToString ex2)
| Thresh (ex1 , ex2 , ex3 , ex4) -> "(" ^ (exprToString ex1 ^ ("<" ^ (exprToString ex2 ^ ("?" ^ (exprToString ex3 ^ (":" ^ (exprToString ex4 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(26,81)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "ex")),Nothing,App (Just (15,15)-(15,52)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,15)-(15,24)) (LS "sin(pi*"),App (Just (15,27)-(15,52)) (Var (Just (15,46)-(15,47)) "^") [App (Just (15,28)-(15,45)) (Var (Just (15,29)-(15,41)) "exprToString") [Var (Just (15,42)-(15,44)) "ex"],Lit (Just (15,48)-(15,51)) (LS ")")]]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "ex")),Nothing,App (Just (16,17)-(16,54)) (Var (Just (16,27)-(16,28)) "^") [Lit (Just (16,17)-(16,26)) (LS "cos(pi*"),App (Just (16,29)-(16,54)) (Var (Just (16,48)-(16,49)) "^") [App (Just (16,30)-(16,47)) (Var (Just (16,31)-(16,43)) "exprToString") [Var (Just (16,44)-(16,46)) "ex"],Lit (Just (16,50)-(16,53)) (LS ")")]]),(ConPat (Just (17,4)-(17,20)) "Average" (Just (TuplePat (Just (17,13)-(17,20)) [VarPat (Just (17,13)-(17,16)) "ex1",VarPat (Just (17,17)-(17,20)) "ex2"])),Nothing,App (Just (18,6)-(18,71)) (Var (Just (18,10)-(18,11)) "^") [Lit (Just (18,6)-(18,9)) (LS "("),App (Just (18,12)-(18,71)) (Var (Just (18,32)-(18,33)) "^") [App (Just (18,13)-(18,31)) (Var (Just (18,14)-(18,26)) "exprToString") [Var (Just (18,27)-(18,30)) "ex1"],App (Just (18,34)-(18,70)) (Var (Just (18,39)-(18,40)) "^") [Lit (Just (18,35)-(18,38)) (LS "*"),App (Just (18,41)-(18,69)) (Var (Just (18,61)-(18,62)) "^") [App (Just (18,42)-(18,60)) (Var (Just (18,43)-(18,55)) "exprToString") [Var (Just (18,56)-(18,59)) "ex2"],Lit (Just (18,63)-(18,68)) (LS ")/2")]]]]),(ConPat (Just (19,4)-(19,18)) "Times" (Just (TuplePat (Just (19,11)-(19,18)) [VarPat (Just (19,11)-(19,14)) "ex1",VarPat (Just (19,15)-(19,18)) "ex2"])),Nothing,App (Just (19,23)-(19,70)) (Var (Just (19,42)-(19,43)) "^") [App (Just (19,23)-(19,41)) (Var (Just (19,24)-(19,36)) "exprToString") [Var (Just (19,37)-(19,40)) "ex1"],App (Just (19,44)-(19,70)) (Var (Just (19,49)-(19,50)) "^") [Lit (Just (19,45)-(19,48)) (LS "*"),App (Just (19,51)-(19,69)) (Var (Just (19,52)-(19,64)) "exprToString") [Var (Just (19,65)-(19,68)) "ex2"]]]),(ConPat (Just (20,4)-(20,27)) "Thresh" (Just (TuplePat (Just (20,12)-(20,27)) [VarPat (Just (20,12)-(20,15)) "ex1",VarPat (Just (20,16)-(20,19)) "ex2",VarPat (Just (20,20)-(20,23)) "ex3",VarPat (Just (20,24)-(20,27)) "ex4"])),Nothing,App (Just (21,6)-(26,81)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(26,81)) (Var (Just (22,28)-(22,29)) "^") [App (Just (22,9)-(22,27)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,26)) "ex1"],App (Just (23,11)-(26,80)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(26,79)) (Var (Just (24,34)-(24,35)) "^") [App (Just (24,15)-(24,33)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,32)) "ex2"],App (Just (25,17)-(26,78)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (26,20)-(26,77)) (Var (Just (26,40)-(26,41)) "^") [App (Just (26,21)-(26,39)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,38)) "ex3"],App (Just (26,42)-(26,76)) (Var (Just (26,47)-(26,48)) "^") [Lit (Just (26,43)-(26,46)) (LS ":"),App (Just (26,49)-(26,75)) (Var (Just (26,69)-(26,70)) "^") [App (Just (26,50)-(26,68)) (Var (Just (26,51)-(26,63)) "exprToString") [Var (Just (26,64)-(26,67)) "ex4"],Lit (Just (26,71)-(26,74)) (LS ")")]]]]]]]])]
*)

(* typed spans
(12,2)-(26,81)
*)

(* correct types
string
*)

(* bad types
unit
*)
