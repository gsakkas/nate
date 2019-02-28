
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
  | Sine e1 -> sin (exprToString e1)
  | Cosine e1 -> cos (exprToString e1)
  | Average (e1,e2) -> (e1 + e2) / 2
  | Times (e1,e2) -> e1 * e2
  | Thresh (e1,e2,e3,e4) -> ((e1 * e2) * e3) * e4;;


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
  | Sine e1 -> "sin (pi * " ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi * " ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (") + " ^ ((exprToString e2) ^ "/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(17,49)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin (pi * " ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos (pi * " ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ (") + " ^ (exprToString e2 ^ "/2)")))
| Times (e1 , e2) -> exprToString e1 ^ (" * " ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ (" ? " ^ (exprToString e3 ^ (" : " ^ (exprToString e4 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(26,81)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "e1")),Nothing,App (Just (15,15)-(15,55)) (Var (Just (15,28)-(15,29)) "^") [Lit (Just (15,15)-(15,27)) (LS "sin (pi * "),App (Just (15,30)-(15,55)) (Var (Just (15,49)-(15,50)) "^") [App (Just (15,31)-(15,48)) (Var (Just (15,32)-(15,44)) "exprToString") [Var (Just (15,45)-(15,47)) "e1"],Lit (Just (15,51)-(15,54)) (LS ")")]]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "e1")),Nothing,App (Just (16,17)-(16,57)) (Var (Just (16,30)-(16,31)) "^") [Lit (Just (16,17)-(16,29)) (LS "cos (pi * "),App (Just (16,32)-(16,57)) (Var (Just (16,51)-(16,52)) "^") [App (Just (16,33)-(16,50)) (Var (Just (16,34)-(16,46)) "exprToString") [Var (Just (16,47)-(16,49)) "e1"],Lit (Just (16,53)-(16,56)) (LS ")")]]),(ConPat (Just (17,4)-(17,18)) "Average" (Just (TuplePat (Just (17,13)-(17,18)) [VarPat (Just (17,13)-(17,15)) "e1",VarPat (Just (17,16)-(17,18)) "e2"])),Nothing,App (Just (18,6)-(18,73)) (Var (Just (18,11)-(18,12)) "^") [Lit (Just (18,6)-(18,10)) (LS "(("),App (Just (18,13)-(18,73)) (Var (Just (18,32)-(18,33)) "^") [App (Just (18,14)-(18,31)) (Var (Just (18,15)-(18,27)) "exprToString") [Var (Just (18,28)-(18,30)) "e1"],App (Just (18,34)-(18,72)) (Var (Just (18,42)-(18,43)) "^") [Lit (Just (18,35)-(18,41)) (LS ") + "),App (Just (18,44)-(18,71)) (Var (Just (18,63)-(18,64)) "^") [App (Just (18,45)-(18,62)) (Var (Just (18,46)-(18,58)) "exprToString") [Var (Just (18,59)-(18,61)) "e2"],Lit (Just (18,65)-(18,70)) (LS "/2)")]]]]),(ConPat (Just (19,4)-(19,16)) "Times" (Just (TuplePat (Just (19,11)-(19,16)) [VarPat (Just (19,11)-(19,13)) "e1",VarPat (Just (19,14)-(19,16)) "e2"])),Nothing,App (Just (19,21)-(19,68)) (Var (Just (19,39)-(19,40)) "^") [App (Just (19,21)-(19,38)) (Var (Just (19,22)-(19,34)) "exprToString") [Var (Just (19,35)-(19,37)) "e1"],App (Just (19,41)-(19,68)) (Var (Just (19,48)-(19,49)) "^") [Lit (Just (19,42)-(19,47)) (LS " * "),App (Just (19,50)-(19,67)) (Var (Just (19,51)-(19,63)) "exprToString") [Var (Just (19,64)-(19,66)) "e2"]]]),(ConPat (Just (20,4)-(20,23)) "Thresh" (Just (TuplePat (Just (20,12)-(20,23)) [VarPat (Just (20,12)-(20,14)) "e1",VarPat (Just (20,15)-(20,17)) "e2",VarPat (Just (20,18)-(20,20)) "e3",VarPat (Just (20,21)-(20,23)) "e4"])),Nothing,App (Just (21,6)-(26,81)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(26,81)) (Var (Just (22,27)-(22,28)) "^") [App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,25)) "e1"],App (Just (23,11)-(26,80)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(26,79)) (Var (Just (24,33)-(24,34)) "^") [App (Just (24,15)-(24,32)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,31)) "e2"],App (Just (25,17)-(26,78)) (Var (Just (25,24)-(25,25)) "^") [Lit (Just (25,18)-(25,23)) (LS " ? "),App (Just (26,20)-(26,77)) (Var (Just (26,39)-(26,40)) "^") [App (Just (26,21)-(26,38)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,37)) "e3"],App (Just (26,41)-(26,76)) (Var (Just (26,48)-(26,49)) "^") [Lit (Just (26,42)-(26,47)) (LS " : "),App (Just (26,50)-(26,75)) (Var (Just (26,69)-(26,70)) "^") [App (Just (26,51)-(26,68)) (Var (Just (26,52)-(26,64)) "exprToString") [Var (Just (26,65)-(26,67)) "e4"],Lit (Just (26,71)-(26,74)) (LS ")")]]]]]]]])]
*)

(* typed spans
(12,2)-(26,81)
*)

(* correct types
string
*)

(* bad types
float
*)
