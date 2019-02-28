
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Arc of expr* expr* expr;;

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
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Tan a -> "tan(pi*" ^ ((exprToString a) ^ ")")
  | Arc (a,b,c) -> "sin(pi*" ^ ((exprToString (a (b, c))) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sin_Avg of expr* expr* expr;;

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
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Tan a -> "tan(pi*" ^ ((exprToString a) ^ ")")
  | Sin_Avg (a,b,c) ->
      "sin(pi*(" ^
        ((exprToString a) ^
           ("+" ^ ((exprToString b) ^ ((exprToString c) ^ ")/3)"))));;

*)

(* changed spans
(14,2)-(30,64)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exprToString a ^ ")")
| Cosine a -> "cos(pi*" ^ (exprToString a ^ ")")
| Average (a , b) -> "((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
| Times (a , b) -> exprToString a ^ ("*" ^ exprToString b)
| Thresh (a , b , c , d) -> "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
| _ -> "_"
| Tan a -> "tan(pi*" ^ (exprToString a ^ ")")
| Sin_Avg (a , b , c) -> "sin(pi*(" ^ (exprToString a ^ ("+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (14,2)-(33,68)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Lit (Just (15,13)-(15,16)) (LS "x")),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Lit (Just (16,13)-(16,16)) (LS "y")),(ConPat (Just (17,4)-(17,10)) "Sine" (Just (VarPat (Just (17,9)-(17,10)) "a")),Nothing,App (Just (17,14)-(17,50)) (Var (Just (17,24)-(17,25)) "^") [Lit (Just (17,14)-(17,23)) (LS "sin(pi*"),App (Just (17,26)-(17,50)) (Var (Just (17,44)-(17,45)) "^") [App (Just (17,27)-(17,43)) (Var (Just (17,28)-(17,40)) "exprToString") [Var (Just (17,41)-(17,42)) "a"],Lit (Just (17,46)-(17,49)) (LS ")")]]),(ConPat (Just (18,4)-(18,12)) "Cosine" (Just (VarPat (Just (18,11)-(18,12)) "a")),Nothing,App (Just (18,16)-(18,52)) (Var (Just (18,26)-(18,27)) "^") [Lit (Just (18,16)-(18,25)) (LS "cos(pi*"),App (Just (18,28)-(18,52)) (Var (Just (18,46)-(18,47)) "^") [App (Just (18,29)-(18,45)) (Var (Just (18,30)-(18,42)) "exprToString") [Var (Just (18,43)-(18,44)) "a"],Lit (Just (18,48)-(18,51)) (LS ")")]]),(ConPat (Just (19,4)-(19,16)) "Average" (Just (TuplePat (Just (19,13)-(19,16)) [VarPat (Just (19,13)-(19,14)) "a",VarPat (Just (19,15)-(19,16)) "b"])),Nothing,App (Just (20,6)-(20,69)) (Var (Just (20,11)-(20,12)) "^") [Lit (Just (20,6)-(20,10)) (LS "(("),App (Just (20,13)-(20,69)) (Var (Just (20,31)-(20,32)) "^") [App (Just (20,14)-(20,30)) (Var (Just (20,15)-(20,27)) "exprToString") [Var (Just (20,28)-(20,29)) "a"],App (Just (20,33)-(20,68)) (Var (Just (20,38)-(20,39)) "^") [Lit (Just (20,34)-(20,37)) (LS "+"),App (Just (20,40)-(20,67)) (Var (Just (20,58)-(20,59)) "^") [App (Just (20,41)-(20,57)) (Var (Just (20,42)-(20,54)) "exprToString") [Var (Just (20,55)-(20,56)) "b"],Lit (Just (20,60)-(20,66)) (LS ")/2)")]]]]),(ConPat (Just (21,4)-(21,14)) "Times" (Just (TuplePat (Just (21,11)-(21,14)) [VarPat (Just (21,11)-(21,12)) "a",VarPat (Just (21,13)-(21,14)) "b"])),Nothing,App (Just (21,19)-(21,62)) (Var (Just (21,36)-(21,37)) "^") [App (Just (21,19)-(21,35)) (Var (Just (21,20)-(21,32)) "exprToString") [Var (Just (21,33)-(21,34)) "a"],App (Just (21,38)-(21,62)) (Var (Just (21,43)-(21,44)) "^") [Lit (Just (21,39)-(21,42)) (LS "*"),App (Just (21,45)-(21,61)) (Var (Just (21,46)-(21,58)) "exprToString") [Var (Just (21,59)-(21,60)) "b"]]]),(ConPat (Just (22,4)-(22,19)) "Thresh" (Just (TuplePat (Just (22,12)-(22,19)) [VarPat (Just (22,12)-(22,13)) "a",VarPat (Just (22,14)-(22,15)) "b",VarPat (Just (22,16)-(22,17)) "c",VarPat (Just (22,18)-(22,19)) "d"])),Nothing,App (Just (23,6)-(27,81)) (Var (Just (23,10)-(23,11)) "^") [Lit (Just (23,6)-(23,9)) (LS "("),App (Just (24,8)-(27,81)) (Var (Just (24,26)-(24,27)) "^") [App (Just (24,9)-(24,25)) (Var (Just (24,10)-(24,22)) "exprToString") [Var (Just (24,23)-(24,24)) "a"],App (Just (25,11)-(27,80)) (Var (Just (25,16)-(25,17)) "^") [Lit (Just (25,12)-(25,15)) (LS "<"),App (Just (26,14)-(27,79)) (Var (Just (26,32)-(26,33)) "^") [App (Just (26,15)-(26,31)) (Var (Just (26,16)-(26,28)) "exprToString") [Var (Just (26,29)-(26,30)) "b"],App (Just (27,17)-(27,78)) (Var (Just (27,22)-(27,23)) "^") [Lit (Just (27,18)-(27,21)) (LS "?"),App (Just (27,24)-(27,77)) (Var (Just (27,42)-(27,43)) "^") [App (Just (27,25)-(27,41)) (Var (Just (27,26)-(27,38)) "exprToString") [Var (Just (27,39)-(27,40)) "c"],App (Just (27,44)-(27,76)) (Var (Just (27,49)-(27,50)) "^") [Lit (Just (27,45)-(27,48)) (LS ":"),App (Just (27,51)-(27,75)) (Var (Just (27,69)-(27,70)) "^") [App (Just (27,52)-(27,68)) (Var (Just (27,53)-(27,65)) "exprToString") [Var (Just (27,66)-(27,67)) "d"],Lit (Just (27,71)-(27,74)) (LS ")")]]]]]]]]),(WildPat (Just (28,4)-(28,5)),Nothing,Lit (Just (28,9)-(28,12)) (LS "_")),(ConPat (Just (29,4)-(29,9)) "Tan" (Just (VarPat (Just (29,8)-(29,9)) "a")),Nothing,App (Just (29,13)-(29,49)) (Var (Just (29,23)-(29,24)) "^") [Lit (Just (29,13)-(29,22)) (LS "tan(pi*"),App (Just (29,25)-(29,49)) (Var (Just (29,43)-(29,44)) "^") [App (Just (29,26)-(29,42)) (Var (Just (29,27)-(29,39)) "exprToString") [Var (Just (29,40)-(29,41)) "a"],Lit (Just (29,45)-(29,48)) (LS ")")]]),(ConPat (Just (30,4)-(30,18)) "Sin_Avg" (Just (TuplePat (Just (30,13)-(30,18)) [VarPat (Just (30,13)-(30,14)) "a",VarPat (Just (30,15)-(30,16)) "b",VarPat (Just (30,17)-(30,18)) "c"])),Nothing,App (Just (31,6)-(33,68)) (Var (Just (31,17)-(31,18)) "^") [Lit (Just (31,6)-(31,16)) (LS "sin(pi*("),App (Just (32,8)-(33,68)) (Var (Just (32,26)-(32,27)) "^") [App (Just (32,9)-(32,25)) (Var (Just (32,10)-(32,22)) "exprToString") [Var (Just (32,23)-(32,24)) "a"],App (Just (33,11)-(33,67)) (Var (Just (33,16)-(33,17)) "^") [Lit (Just (33,12)-(33,15)) (LS "+"),App (Just (33,18)-(33,66)) (Var (Just (33,36)-(33,37)) "^") [App (Just (33,19)-(33,35)) (Var (Just (33,20)-(33,32)) "exprToString") [Var (Just (33,33)-(33,34)) "b"],App (Just (33,38)-(33,65)) (Var (Just (33,56)-(33,57)) "^") [App (Just (33,39)-(33,55)) (Var (Just (33,40)-(33,52)) "exprToString") [Var (Just (33,53)-(33,54)) "c"],Lit (Just (33,58)-(33,64)) (LS ")/3)")]]]]])]
*)

(* typed spans
(14,2)-(33,68)
*)

(* correct types
string
*)

(* bad types
string
*)
