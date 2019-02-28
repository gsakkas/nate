
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
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0;;

*)

(* changed spans
(17,21)-(17,63)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (17,21)-(17,66)) FDiv (Bop (Just (17,21)-(17,59)) FPlus (App (Just (17,22)-(17,38)) (Var (Just (17,23)-(17,27)) "eval") [Tuple (Just (17,28)-(17,37)) [Var (Just (17,29)-(17,30)) "a",Var (Just (17,32)-(17,33)) "x",Var (Just (17,35)-(17,36)) "y"]]) (App (Just (17,42)-(17,58)) (Var (Just (17,43)-(17,47)) "eval") [Tuple (Just (17,48)-(17,57)) [Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,53)) "x",Var (Just (17,55)-(17,56)) "y"]])) (Lit (Just (17,63)-(17,66)) (LD 2.0))
*)

(* typed spans
(17,21)-(17,66)
*)

(* correct types
float
*)

(* bad types
int
*)
