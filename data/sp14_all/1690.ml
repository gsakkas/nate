
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
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;


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
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(15,18)-(15,41)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(16,20)-(16,43)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (15,18)-(15,42)) FTimes (Var (Just (15,19)-(15,21)) "pi") (App (Just (15,25)-(15,41)) (Var (Just (15,26)-(15,30)) "eval") [Tuple (Just (15,31)-(15,40)) [Var (Just (15,32)-(15,33)) "v",Var (Just (15,35)-(15,36)) "x",Var (Just (15,38)-(15,39)) "y"]])
Bop (Just (16,20)-(16,44)) FTimes (Var (Just (16,21)-(16,23)) "pi") (App (Just (16,27)-(16,43)) (Var (Just (16,28)-(16,32)) "eval") [Tuple (Just (16,33)-(16,42)) [Var (Just (16,34)-(16,35)) "v",Var (Just (16,37)-(16,38)) "x",Var (Just (16,40)-(16,41)) "y"]])
*)

(* typed spans
(15,18)-(15,42)
(16,20)-(16,44)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
