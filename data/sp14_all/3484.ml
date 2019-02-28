
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
  | Sine expr -> "sin(" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr) ^ ")/2)")))
  | Times (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("*" ^ ((exprToString expr) ^ ")")))
  | Thresh (expr,expr,expr,expr) ->
      "(" ^ (expr ^ ("<" ^ (expr ^ ("?" ^ (expr ^ (":" ^ (expr ^ ")")))))));;


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
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr0) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(12,2)-(22,75)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine expr0 -> "sin(" ^ (exprToString expr0 ^ ")")
| Cosine expr0 -> "cos(" ^ (exprToString expr0 ^ ")")
| Average (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("+" ^ (exprToString expr1 ^ ")/2)")))
| Times (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("*" ^ (exprToString expr1 ^ ")")))
| Thresh (expr0 , expr1 , expr2 , expr3) -> "(" ^ (exprToString expr0 ^ ("<" ^ (exprToString expr1 ^ ("?" ^ (exprToString expr2 ^ (":" ^ (exprToString expr3 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (12,2)-(28,64)) (Var (Just (12,8)-(12,9)) "e") [(ConPat (Just (13,4)-(13,8)) "VarX" Nothing,Nothing,Lit (Just (13,13)-(13,16)) (LS "x")),(ConPat (Just (14,4)-(14,8)) "VarY" Nothing,Nothing,Lit (Just (14,13)-(14,16)) (LS "y")),(ConPat (Just (15,4)-(15,14)) "Sine" (Just (VarPat (Just (15,9)-(15,14)) "expr0")),Nothing,App (Just (15,18)-(15,55)) (Var (Just (15,25)-(15,26)) "^") [Lit (Just (15,18)-(15,24)) (LS "sin("),App (Just (15,27)-(15,55)) (Var (Just (15,49)-(15,50)) "^") [App (Just (15,28)-(15,48)) (Var (Just (15,29)-(15,41)) "exprToString") [Var (Just (15,42)-(15,47)) "expr0"],Lit (Just (15,51)-(15,54)) (LS ")")]]),(ConPat (Just (16,4)-(16,16)) "Cosine" (Just (VarPat (Just (16,11)-(16,16)) "expr0")),Nothing,App (Just (16,20)-(16,57)) (Var (Just (16,27)-(16,28)) "^") [Lit (Just (16,20)-(16,26)) (LS "cos("),App (Just (16,29)-(16,57)) (Var (Just (16,51)-(16,52)) "^") [App (Just (16,30)-(16,50)) (Var (Just (16,31)-(16,43)) "exprToString") [Var (Just (16,44)-(16,49)) "expr0"],Lit (Just (16,53)-(16,56)) (LS ")")]]),(ConPat (Just (17,4)-(17,24)) "Average" (Just (TuplePat (Just (17,13)-(17,24)) [VarPat (Just (17,13)-(17,18)) "expr0",VarPat (Just (17,19)-(17,24)) "expr1"])),Nothing,App (Just (18,6)-(18,76)) (Var (Just (18,10)-(18,11)) "^") [Lit (Just (18,6)-(18,9)) (LS "("),App (Just (18,12)-(18,76)) (Var (Just (18,34)-(18,35)) "^") [App (Just (18,13)-(18,33)) (Var (Just (18,14)-(18,26)) "exprToString") [Var (Just (18,27)-(18,32)) "expr0"],App (Just (18,36)-(18,75)) (Var (Just (18,41)-(18,42)) "^") [Lit (Just (18,37)-(18,40)) (LS "+"),App (Just (18,43)-(18,74)) (Var (Just (18,65)-(18,66)) "^") [App (Just (18,44)-(18,64)) (Var (Just (18,45)-(18,57)) "exprToString") [Var (Just (18,58)-(18,63)) "expr1"],Lit (Just (18,67)-(18,73)) (LS ")/2)")]]]]),(ConPat (Just (19,4)-(19,22)) "Times" (Just (TuplePat (Just (19,11)-(19,22)) [VarPat (Just (19,11)-(19,16)) "expr0",VarPat (Just (19,17)-(19,22)) "expr1"])),Nothing,App (Just (20,6)-(20,73)) (Var (Just (20,10)-(20,11)) "^") [Lit (Just (20,6)-(20,9)) (LS "("),App (Just (20,12)-(20,73)) (Var (Just (20,34)-(20,35)) "^") [App (Just (20,13)-(20,33)) (Var (Just (20,14)-(20,26)) "exprToString") [Var (Just (20,27)-(20,32)) "expr0"],App (Just (20,36)-(20,72)) (Var (Just (20,41)-(20,42)) "^") [Lit (Just (20,37)-(20,40)) (LS "*"),App (Just (20,43)-(20,71)) (Var (Just (20,65)-(20,66)) "^") [App (Just (20,44)-(20,64)) (Var (Just (20,45)-(20,57)) "exprToString") [Var (Just (20,58)-(20,63)) "expr1"],Lit (Just (20,67)-(20,70)) (LS ")")]]]]),(ConPat (Just (21,4)-(21,35)) "Thresh" (Just (TuplePat (Just (21,12)-(21,35)) [VarPat (Just (21,12)-(21,17)) "expr0",VarPat (Just (21,18)-(21,23)) "expr1",VarPat (Just (21,24)-(21,29)) "expr2",VarPat (Just (21,30)-(21,35)) "expr3"])),Nothing,App (Just (22,6)-(28,64)) (Var (Just (22,10)-(22,11)) "^") [Lit (Just (22,6)-(22,9)) (LS "("),App (Just (23,8)-(28,64)) (Var (Just (23,30)-(23,31)) "^") [App (Just (23,9)-(23,29)) (Var (Just (23,10)-(23,22)) "exprToString") [Var (Just (23,23)-(23,28)) "expr0"],App (Just (24,11)-(28,63)) (Var (Just (24,16)-(24,17)) "^") [Lit (Just (24,12)-(24,15)) (LS "<"),App (Just (25,14)-(28,62)) (Var (Just (25,36)-(25,37)) "^") [App (Just (25,15)-(25,35)) (Var (Just (25,16)-(25,28)) "exprToString") [Var (Just (25,29)-(25,34)) "expr1"],App (Just (26,17)-(28,61)) (Var (Just (26,22)-(26,23)) "^") [Lit (Just (26,18)-(26,21)) (LS "?"),App (Just (27,20)-(28,60)) (Var (Just (27,42)-(27,43)) "^") [App (Just (27,21)-(27,41)) (Var (Just (27,22)-(27,34)) "exprToString") [Var (Just (27,35)-(27,40)) "expr2"],App (Just (28,23)-(28,59)) (Var (Just (28,28)-(28,29)) "^") [Lit (Just (28,24)-(28,27)) (LS ":"),App (Just (28,30)-(28,58)) (Var (Just (28,52)-(28,53)) "^") [App (Just (28,31)-(28,51)) (Var (Just (28,32)-(28,44)) "exprToString") [Var (Just (28,45)-(28,50)) "expr3"],Lit (Just (28,54)-(28,57)) (LS ")")]]]]]]]])]
*)

(* typed spans
(12,2)-(28,64)
*)

(* correct types
string
*)

(* bad types
string
*)
