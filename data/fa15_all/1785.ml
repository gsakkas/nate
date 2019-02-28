
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
  | [] -> []
  | h::e' ->
      (match h with
       | VarX  -> "x" ^ (exprToString e')
       | VarY  -> "y" ^ (exprToString e')
       | Sine e1 ->
           "sin(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Cosine e1 ->
           "cos(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Average (e1,e2) ->
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times (e1,e2) ->
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh (e1,e2,e3,e4) ->
           "(" ^
             ((exprToString e1) ^
                ("<" ^
                   ((exprToString e2) ^
                      ("?" ^
                         ((exprToString e3) ^
                            (":" ^
                               ((exprToString e4) ^ (")" ^ (exprToString e'))))))))));;


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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(37,85)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(26,79)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,11)) "Sine" (Just (VarPat (Just (15,9)-(15,11)) "e1")),Nothing,App (Just (15,15)-(15,52)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,15)-(15,24)) (LS "sin(pi*"),App (Just (15,27)-(15,52)) (Var (Just (15,46)-(15,47)) "^") [App (Just (15,28)-(15,45)) (Var (Just (15,29)-(15,41)) "exprToString") [Var (Just (15,42)-(15,44)) "e1"],Lit (Just (15,48)-(15,51)) (LS ")")]]),(ConPat (Just (16,4)-(16,13)) "Cosine" (Just (VarPat (Just (16,11)-(16,13)) "e1")),Nothing,App (Just (16,17)-(16,54)) (Var (Just (16,27)-(16,28)) "^") [Lit (Just (16,17)-(16,26)) (LS "cos(pi*"),App (Just (16,29)-(16,54)) (Var (Just (16,48)-(16,49)) "^") [App (Just (16,30)-(16,47)) (Var (Just (16,31)-(16,43)) "exprToString") [Var (Just (16,44)-(16,46)) "e1"],Lit (Just (16,50)-(16,53)) (LS ")")]]),(ConPat (Just (17,4)-(17,18)) "Average" (Just (TuplePat (Just (17,13)-(17,18)) [VarPat (Just (17,13)-(17,15)) "e1",VarPat (Just (17,16)-(17,18)) "e2"])),Nothing,App (Just (18,6)-(18,71)) (Var (Just (18,11)-(18,12)) "^") [Lit (Just (18,6)-(18,10)) (LS "(("),App (Just (18,13)-(18,71)) (Var (Just (18,32)-(18,33)) "^") [App (Just (18,14)-(18,31)) (Var (Just (18,15)-(18,27)) "exprToString") [Var (Just (18,28)-(18,30)) "e1"],App (Just (18,34)-(18,70)) (Var (Just (18,39)-(18,40)) "^") [Lit (Just (18,35)-(18,38)) (LS "+"),App (Just (18,41)-(18,69)) (Var (Just (18,60)-(18,61)) "^") [App (Just (18,42)-(18,59)) (Var (Just (18,43)-(18,55)) "exprToString") [Var (Just (18,56)-(18,58)) "e2"],Lit (Just (18,62)-(18,68)) (LS ")/2)")]]]]),(ConPat (Just (19,4)-(19,16)) "Times" (Just (TuplePat (Just (19,11)-(19,16)) [VarPat (Just (19,11)-(19,13)) "e1",VarPat (Just (19,14)-(19,16)) "e2"])),Nothing,App (Just (19,21)-(19,66)) (Var (Just (19,39)-(19,40)) "^") [App (Just (19,21)-(19,38)) (Var (Just (19,22)-(19,34)) "exprToString") [Var (Just (19,35)-(19,37)) "e1"],App (Just (19,41)-(19,66)) (Var (Just (19,46)-(19,47)) "^") [Lit (Just (19,42)-(19,45)) (LS "*"),App (Just (19,48)-(19,65)) (Var (Just (19,49)-(19,61)) "exprToString") [Var (Just (19,62)-(19,64)) "e2"]]]),(ConPat (Just (20,4)-(20,23)) "Thresh" (Just (TuplePat (Just (20,12)-(20,23)) [VarPat (Just (20,12)-(20,14)) "e1",VarPat (Just (20,15)-(20,17)) "e2",VarPat (Just (20,18)-(20,20)) "e3",VarPat (Just (20,21)-(20,23)) "e4"])),Nothing,App (Just (21,6)-(26,79)) (Var (Just (21,10)-(21,11)) "^") [Lit (Just (21,6)-(21,9)) (LS "("),App (Just (22,8)-(26,79)) (Var (Just (22,27)-(22,28)) "^") [App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,22)) "exprToString") [Var (Just (22,23)-(22,25)) "e1"],App (Just (23,11)-(26,78)) (Var (Just (23,16)-(23,17)) "^") [Lit (Just (23,12)-(23,15)) (LS "<"),App (Just (24,14)-(26,77)) (Var (Just (24,33)-(24,34)) "^") [App (Just (24,15)-(24,32)) (Var (Just (24,16)-(24,28)) "exprToString") [Var (Just (24,29)-(24,31)) "e2"],App (Just (25,17)-(26,76)) (Var (Just (25,22)-(25,23)) "^") [Lit (Just (25,18)-(25,21)) (LS "?"),App (Just (26,20)-(26,75)) (Var (Just (26,39)-(26,40)) "^") [App (Just (26,21)-(26,38)) (Var (Just (26,22)-(26,34)) "exprToString") [Var (Just (26,35)-(26,37)) "e3"],App (Just (26,41)-(26,74)) (Var (Just (26,46)-(26,47)) "^") [Lit (Just (26,42)-(26,45)) (LS ":"),App (Just (26,48)-(26,73)) (Var (Just (26,67)-(26,68)) "^") [App (Just (26,49)-(26,66)) (Var (Just (26,50)-(26,62)) "exprToString") [Var (Just (26,63)-(26,65)) "e4"],Lit (Just (26,69)-(26,72)) (LS ")")]]]]]]]])]
*)

(* typed spans
(12,2)-(26,79)
*)

(* correct types
string
*)

(* bad types
'a list
*)
