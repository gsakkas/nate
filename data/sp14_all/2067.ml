
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(18,20)-(18,43)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(19,18)-(19,41)
pi ** eval (a , x , y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (18,20)-(18,44)) (Var (Just (18,24)-(18,26)) "**") [Var (Just (18,21)-(18,23)) "pi",App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "a",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]]]
App (Just (19,18)-(19,42)) (Var (Just (19,22)-(19,24)) "**") [Var (Just (19,19)-(19,21)) "pi",App (Just (19,25)-(19,41)) (Var (Just (19,26)-(19,30)) "eval") [Tuple (Just (19,31)-(19,40)) [Var (Just (19,32)-(19,33)) "a",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]]
*)

(* typed spans
(18,20)-(18,44)
(19,18)-(19,42)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
