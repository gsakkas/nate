
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
  | Sine e -> "sin(" ^ (e ^ ")")
  | Cosine e -> "cos(" ^ (e ^ ")")
  | Average (e1,e2) -> e1 ^ ("+" ^ (e2 ^ "/2"))
  | Times (e1,e2) -> e1 ^ ("*" ^ e2)
  | Thresh (e1,e2,e3,e4) -> e1 ^ ("<" ^ (e2 ^ ("?" ^ (e3 ^ (":" ^ e4)))));;


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
  | Sine e -> "sin(" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) -> (exprToString e1) ^ ("+" ^ ((exprToString e2) ^ "/2"))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ("<" ^
           ((exprToString e2) ^
              ("?" ^ ((exprToString e3) ^ (":" ^ (exprToString e4))))));;

*)

(* changed spans
(15,24)-(15,25)
exprToString e
AppG (fromList [VarG])

(16,26)-(16,27)
exprToString e
AppG (fromList [VarG])

(17,23)-(17,25)
exprToString e1
AppG (fromList [VarG])

(17,36)-(17,38)
exprToString e2
AppG (fromList [VarG])

(18,21)-(18,23)
exprToString e1
AppG (fromList [VarG])

(18,33)-(18,35)
exprToString e2
AppG (fromList [VarG])

(19,28)-(19,30)
exprToString e1
AppG (fromList [VarG])

(19,41)-(19,43)
exprToString e2
AppG (fromList [VarG])

(19,54)-(19,56)
exprToString e3
AppG (fromList [VarG])

(19,66)-(19,68)
exprToString e4
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (15,24)-(15,40)) (Var (Just (15,25)-(15,37)) "exprToString") [Var (Just (15,38)-(15,39)) "e"]
App (Just (16,26)-(16,42)) (Var (Just (16,27)-(16,39)) "exprToString") [Var (Just (16,40)-(16,41)) "e"]
App (Just (17,23)-(17,40)) (Var (Just (17,24)-(17,36)) "exprToString") [Var (Just (17,37)-(17,39)) "e1"]
App (Just (17,51)-(17,68)) (Var (Just (17,52)-(17,64)) "exprToString") [Var (Just (17,65)-(17,67)) "e2"]
App (Just (18,21)-(18,38)) (Var (Just (18,22)-(18,34)) "exprToString") [Var (Just (18,35)-(18,37)) "e1"]
App (Just (18,48)-(18,65)) (Var (Just (18,49)-(18,61)) "exprToString") [Var (Just (18,62)-(18,64)) "e2"]
App (Just (20,6)-(20,23)) (Var (Just (20,7)-(20,19)) "exprToString") [Var (Just (20,20)-(20,22)) "e1"]
App (Just (22,12)-(22,29)) (Var (Just (22,13)-(22,25)) "exprToString") [Var (Just (22,26)-(22,28)) "e2"]
App (Just (23,22)-(23,39)) (Var (Just (23,23)-(23,35)) "exprToString") [Var (Just (23,36)-(23,38)) "e3"]
App (Just (23,49)-(23,66)) (Var (Just (23,50)-(23,62)) "exprToString") [Var (Just (23,63)-(23,65)) "e4"]
*)

(* typed spans
(15,24)-(15,40)
(16,26)-(16,42)
(17,23)-(17,40)
(17,51)-(17,68)
(18,21)-(18,38)
(18,48)-(18,65)
(20,6)-(20,23)
(22,12)-(22,29)
(23,22)-(23,39)
(23,49)-(23,66)
*)

(* correct types
string
string
string
string
string
string
string
string
string
string
*)

(* bad types
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
*)
