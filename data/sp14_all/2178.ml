
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(17,18)-(17,41)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,20)-(18,43)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "a",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])
Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "a",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])
*)

(* typed spans
(17,18)-(17,42)
(18,20)-(18,44)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
