
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
  | VarX  -> e
  | VarY  -> e
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) + (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) * (exprToString e2)
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) + (exprToString e2);;


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
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(14,13)-(14,14)
"x"
LitG

(15,15)-(15,30)
"y"
LitG

(17,23)-(17,66)
(exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,21)-(18,58)
"/2"
LitG

(18,21)-(18,38)
exprToString e1 ^ ("*" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(18,41)-(18,58)
"*" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,28)-(19,65)
exprToString e1 ^ ("+" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (13,13)-(13,16)) (LS "x")
Lit (Just (14,13)-(14,16)) (LS "y")
App (Just (17,23)-(17,77)) (Var (Just (17,71)-(17,72)) "^") [App (Just (17,23)-(17,70)) (Var (Just (17,42)-(17,43)) "^") [App (Just (17,24)-(17,41)) (Var (Just (17,25)-(17,37)) "exprToString") [Var (Just (17,38)-(17,40)) "e1"],App (Just (17,44)-(17,69)) (Var (Just (17,49)-(17,50)) "^") [Lit (Just (17,45)-(17,48)) (LS "+"),App (Just (17,51)-(17,68)) (Var (Just (17,52)-(17,64)) "exprToString") [Var (Just (17,65)-(17,67)) "e2"]]],Lit (Just (17,73)-(17,77)) (LS "/2")]
Lit (Just (17,73)-(17,77)) (LS "/2")
App (Just (18,21)-(18,66)) (Var (Just (18,39)-(18,40)) "^") [App (Just (18,21)-(18,38)) (Var (Just (18,22)-(18,34)) "exprToString") [Var (Just (18,35)-(18,37)) "e1"],App (Just (18,41)-(18,66)) (Var (Just (18,46)-(18,47)) "^") [Lit (Just (18,42)-(18,45)) (LS "*"),App (Just (18,48)-(18,65)) (Var (Just (18,49)-(18,61)) "exprToString") [Var (Just (18,62)-(18,64)) "e2"]]]
App (Just (18,41)-(18,66)) (Var (Just (18,46)-(18,47)) "^") [Lit (Just (18,42)-(18,45)) (LS "*"),App (Just (18,48)-(18,65)) (Var (Just (18,49)-(18,61)) "exprToString") [Var (Just (18,62)-(18,64)) "e2"]]
App (Just (19,28)-(19,73)) (Var (Just (19,46)-(19,47)) "^") [App (Just (19,28)-(19,45)) (Var (Just (19,29)-(19,41)) "exprToString") [Var (Just (19,42)-(19,44)) "e1"],App (Just (19,48)-(19,73)) (Var (Just (19,53)-(19,54)) "^") [Lit (Just (19,49)-(19,52)) (LS "+"),App (Just (19,55)-(19,72)) (Var (Just (19,56)-(19,68)) "exprToString") [Var (Just (19,69)-(19,71)) "e2"]]]
*)

(* typed spans
(13,13)-(13,16)
(14,13)-(14,16)
(17,23)-(17,77)
(17,73)-(17,77)
(18,21)-(18,66)
(18,41)-(18,66)
(19,28)-(19,73)
*)

(* correct types
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
int
int
int
int
int
int
*)
