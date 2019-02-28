
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (eval (e1, x, y))
  | Cosine e1 -> cos (eval (e1, x, y))
  | Average (e1,e2) -> (eval (e1, x, y)) +. (eval (e2, x, y));;

*)

(* changed spans
(17,23)-(17,68)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,23)-(17,61)) FPlus (App (Just (17,23)-(17,40)) (Var (Just (17,24)-(17,28)) "eval") [Tuple (Just (17,29)-(17,39)) [Var (Just (17,30)-(17,32)) "e1",Var (Just (17,34)-(17,35)) "x",Var (Just (17,37)-(17,38)) "y"]]) (App (Just (17,44)-(17,61)) (Var (Just (17,45)-(17,49)) "eval") [Tuple (Just (17,50)-(17,60)) [Var (Just (17,51)-(17,53)) "e2",Var (Just (17,55)-(17,56)) "x",Var (Just (17,58)-(17,59)) "y"]])
*)

(* typed spans
(17,23)-(17,61)
*)

(* correct types
float
*)

(* bad types
float
*)
