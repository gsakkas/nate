
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
  | VarX  -> float x
  | VarY  -> float y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) / 2
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
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,13)-(15,20)
x
VarG

(16,13)-(16,20)
y
VarG

(19,21)-(19,63)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Var (Just (15,13)-(15,14)) "x"
Var (Just (16,13)-(16,14)) "y"
Bop (Just (19,21)-(19,65)) FDiv (Bop (Just (19,21)-(19,59)) FPlus (App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "a",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "b",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]])) (Lit (Just (19,63)-(19,65)) (LD 2.0))
*)

(* typed spans
(15,13)-(15,14)
(16,13)-(16,14)
(19,21)-(19,65)
*)

(* correct types
float
float
float
*)

(* bad types
float
float
int
*)
