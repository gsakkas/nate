
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Hoi of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b) ->
      "sin(pi*" ^ ((exp a) ^ (")/(" ("cos(pi*" ^ ((exp b) ^ ")")) ")"));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Hoi of expr* expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;

*)

(* changed spans
(14,2)-(26,71)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exp a ^ ")")
| Cosine a -> "cos(pi*" ^ (exp a ^ ")")
| Average (a , b) -> "((" ^ (exp a ^ ("+" ^ (exp b ^ ")/2)")))
| Times (a , b) -> exp a ^ ("*" ^ exp b)
| Thresh (a , b , c , d) -> "(" ^ (exp a ^ ("<" ^ (exp b ^ ("?" ^ (exp c ^ (":" ^ (exp d ^ ")")))))))
| Hoi (a , b , c) -> "sin(pi*" ^ (exp a ^ (")*cos(pi*" ^ (exp b ^ (")/(" ^ (exp c ^ ")")))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (14,2)-(27,73)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Lit (Just (15,13)-(15,16)) (LS "x")),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Lit (Just (16,13)-(16,16)) (LS "y")),(ConPat (Just (17,4)-(17,10)) "Sine" (Just (VarPat (Just (17,9)-(17,10)) "a")),Nothing,App (Just (17,14)-(17,41)) (Var (Just (17,24)-(17,25)) "^") [Lit (Just (17,14)-(17,23)) (LS "sin(pi*"),App (Just (17,26)-(17,41)) (Var (Just (17,35)-(17,36)) "^") [App (Just (17,27)-(17,34)) (Var (Just (17,28)-(17,31)) "exp") [Var (Just (17,32)-(17,33)) "a"],Lit (Just (17,37)-(17,40)) (LS ")")]]),(ConPat (Just (18,4)-(18,12)) "Cosine" (Just (VarPat (Just (18,11)-(18,12)) "a")),Nothing,App (Just (18,16)-(18,43)) (Var (Just (18,26)-(18,27)) "^") [Lit (Just (18,16)-(18,25)) (LS "cos(pi*"),App (Just (18,28)-(18,43)) (Var (Just (18,37)-(18,38)) "^") [App (Just (18,29)-(18,36)) (Var (Just (18,30)-(18,33)) "exp") [Var (Just (18,34)-(18,35)) "a"],Lit (Just (18,39)-(18,42)) (LS ")")]]),(ConPat (Just (19,4)-(19,16)) "Average" (Just (TuplePat (Just (19,13)-(19,16)) [VarPat (Just (19,13)-(19,14)) "a",VarPat (Just (19,15)-(19,16)) "b"])),Nothing,App (Just (19,21)-(19,66)) (Var (Just (19,26)-(19,27)) "^") [Lit (Just (19,21)-(19,25)) (LS "(("),App (Just (19,28)-(19,66)) (Var (Just (19,37)-(19,38)) "^") [App (Just (19,29)-(19,36)) (Var (Just (19,30)-(19,33)) "exp") [Var (Just (19,34)-(19,35)) "a"],App (Just (19,39)-(19,65)) (Var (Just (19,44)-(19,45)) "^") [Lit (Just (19,40)-(19,43)) (LS "+"),App (Just (19,46)-(19,64)) (Var (Just (19,55)-(19,56)) "^") [App (Just (19,47)-(19,54)) (Var (Just (19,48)-(19,51)) "exp") [Var (Just (19,52)-(19,53)) "b"],Lit (Just (19,57)-(19,63)) (LS ")/2)")]]]]),(ConPat (Just (20,4)-(20,14)) "Times" (Just (TuplePat (Just (20,11)-(20,14)) [VarPat (Just (20,11)-(20,12)) "a",VarPat (Just (20,13)-(20,14)) "b"])),Nothing,App (Just (20,19)-(20,44)) (Var (Just (20,27)-(20,28)) "^") [App (Just (20,19)-(20,26)) (Var (Just (20,20)-(20,23)) "exp") [Var (Just (20,24)-(20,25)) "a"],App (Just (20,29)-(20,44)) (Var (Just (20,34)-(20,35)) "^") [Lit (Just (20,30)-(20,33)) (LS "*"),App (Just (20,36)-(20,43)) (Var (Just (20,37)-(20,40)) "exp") [Var (Just (20,41)-(20,42)) "b"]]]),(ConPat (Just (21,4)-(21,19)) "Thresh" (Just (TuplePat (Just (21,12)-(21,19)) [VarPat (Just (21,12)-(21,13)) "a",VarPat (Just (21,14)-(21,15)) "b",VarPat (Just (21,16)-(21,17)) "c",VarPat (Just (21,18)-(21,19)) "d"])),Nothing,App (Just (22,6)-(24,75)) (Var (Just (22,10)-(22,11)) "^") [Lit (Just (22,6)-(22,9)) (LS "("),App (Just (23,8)-(24,75)) (Var (Just (23,17)-(23,18)) "^") [App (Just (23,9)-(23,16)) (Var (Just (23,10)-(23,13)) "exp") [Var (Just (23,14)-(23,15)) "a"],App (Just (24,11)-(24,74)) (Var (Just (24,16)-(24,17)) "^") [Lit (Just (24,12)-(24,15)) (LS "<"),App (Just (24,18)-(24,73)) (Var (Just (24,27)-(24,28)) "^") [App (Just (24,19)-(24,26)) (Var (Just (24,20)-(24,23)) "exp") [Var (Just (24,24)-(24,25)) "b"],App (Just (24,29)-(24,72)) (Var (Just (24,34)-(24,35)) "^") [Lit (Just (24,30)-(24,33)) (LS "?"),App (Just (24,36)-(24,71)) (Var (Just (24,45)-(24,46)) "^") [App (Just (24,37)-(24,44)) (Var (Just (24,38)-(24,41)) "exp") [Var (Just (24,42)-(24,43)) "c"],App (Just (24,47)-(24,70)) (Var (Just (24,52)-(24,53)) "^") [Lit (Just (24,48)-(24,51)) (LS ":"),App (Just (24,54)-(24,69)) (Var (Just (24,63)-(24,64)) "^") [App (Just (24,55)-(24,62)) (Var (Just (24,56)-(24,59)) "exp") [Var (Just (24,60)-(24,61)) "d"],Lit (Just (24,65)-(24,68)) (LS ")")]]]]]]]]),(ConPat (Just (25,4)-(25,14)) "Hoi" (Just (TuplePat (Just (25,9)-(25,14)) [VarPat (Just (25,9)-(25,10)) "a",VarPat (Just (25,11)-(25,12)) "b",VarPat (Just (25,13)-(25,14)) "c"])),Nothing,App (Just (26,6)-(27,73)) (Var (Just (26,16)-(26,17)) "^") [Lit (Just (26,6)-(26,15)) (LS "sin(pi*"),App (Just (27,8)-(27,73)) (Var (Just (27,17)-(27,18)) "^") [App (Just (27,9)-(27,16)) (Var (Just (27,10)-(27,13)) "exp") [Var (Just (27,14)-(27,15)) "a"],App (Just (27,19)-(27,72)) (Var (Just (27,32)-(27,33)) "^") [Lit (Just (27,20)-(27,31)) (LS ")*cos(pi*"),App (Just (27,34)-(27,71)) (Var (Just (27,43)-(27,44)) "^") [App (Just (27,35)-(27,42)) (Var (Just (27,36)-(27,39)) "exp") [Var (Just (27,40)-(27,41)) "b"],App (Just (27,45)-(27,70)) (Var (Just (27,52)-(27,53)) "^") [Lit (Just (27,46)-(27,51)) (LS ")/("),App (Just (27,54)-(27,69)) (Var (Just (27,63)-(27,64)) "^") [App (Just (27,55)-(27,62)) (Var (Just (27,56)-(27,59)) "exp") [Var (Just (27,60)-(27,61)) "c"],Lit (Just (27,65)-(27,68)) (LS ")")]]]]]])]
*)

(* typed spans
(14,2)-(27,73)
*)

(* correct types
string
*)

(* bad types
string
*)
