
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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) / 2;;


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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(17,21)-(17,63)
eval (a , x , y) +. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,21)-(17,57)) FPlus (App (Just (17,21)-(17,37)) (Var (Just (17,22)-(17,26)) "eval") [Tuple (Just (17,27)-(17,36)) [Var (Just (17,28)-(17,29)) "a",Var (Just (17,31)-(17,32)) "x",Var (Just (17,34)-(17,35)) "y"]]) (App (Just (17,41)-(17,57)) (Var (Just (17,42)-(17,46)) "eval") [Tuple (Just (17,47)-(17,56)) [Var (Just (17,48)-(17,49)) "b",Var (Just (17,51)-(17,52)) "x",Var (Just (17,54)-(17,55)) "y"]])
*)

(* typed spans
(17,21)-(17,57)
*)

(* correct types
float
*)

(* bad types
int
*)
