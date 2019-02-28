
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) * pi)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(19,18)-(19,41)
eval (a , x , y) *. pi
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
Bop (Just (19,18)-(19,42)) FTimes (App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,24)) "eval") [Tuple (Just (19,25)-(19,34)) [Var (Just (19,26)-(19,27)) "a",Var (Just (19,29)-(19,30)) "x",Var (Just (19,32)-(19,33)) "y"]]) (Var (Just (19,39)-(19,41)) "pi")
*)

(* typed spans
(19,18)-(19,42)
*)

(* correct types
float
*)

(* bad types
int
*)
