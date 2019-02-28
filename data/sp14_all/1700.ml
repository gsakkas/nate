
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) * 2)
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
(13,14)-(21,25)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(17,18)-(17,40)
eval (a , x , y) *. pi
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
Bop (Just (13,9)-(13,26)) FTimes (Lit (Just (13,9)-(13,12)) (LD 4.0)) (App (Just (13,16)-(13,26)) (Var (Just (13,17)-(13,21)) "atan") [Lit (Just (13,22)-(13,25)) (LD 1.0)])
Bop (Just (19,18)-(19,42)) FTimes (App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,24)) "eval") [Tuple (Just (19,25)-(19,34)) [Var (Just (19,26)-(19,27)) "a",Var (Just (19,29)-(19,30)) "x",Var (Just (19,32)-(19,33)) "y"]]) (Var (Just (19,39)-(19,41)) "pi")
*)

(* typed spans
(13,9)-(13,26)
(19,18)-(19,42)
*)

(* correct types
float
float
*)

(* bad types
(expr * int * int) -> int
int
*)
