
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cotangent e -> 1.0 /. (tan (eval (e, x, y)))
  | Volume (l,w,h) ->
      ((eval (l, x, y)) * (eval (w, x, y))) * (eval (h, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cotangent e -> 1.0 /. (tan (eval (e, x, y)))
  | Volume (l,w,h) ->
      ((eval (l, x, y)) *. (eval (w, x, y))) *. (eval (h, x, y));;

*)

(* changed spans
(29,6)-(29,62)
(eval (l , x , y) *. eval (w , x , y)) *. eval (h , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,6)-(29,64)) FTimes (Bop (Just (29,6)-(29,44)) FTimes (App (Just (29,7)-(29,23)) (Var (Just (29,8)-(29,12)) "eval") [Tuple (Just (29,13)-(29,22)) [Var (Just (29,14)-(29,15)) "l",Var (Just (29,17)-(29,18)) "x",Var (Just (29,20)-(29,21)) "y"]]) (App (Just (29,27)-(29,43)) (Var (Just (29,28)-(29,32)) "eval") [Tuple (Just (29,33)-(29,42)) [Var (Just (29,34)-(29,35)) "w",Var (Just (29,37)-(29,38)) "x",Var (Just (29,40)-(29,41)) "y"]])) (App (Just (29,48)-(29,64)) (Var (Just (29,49)-(29,53)) "eval") [Tuple (Just (29,54)-(29,63)) [Var (Just (29,55)-(29,56)) "h",Var (Just (29,58)-(29,59)) "x",Var (Just (29,61)-(29,62)) "y"]])
*)

(* typed spans
(29,6)-(29,64)
*)

(* correct types
float
*)

(* bad types
int
*)
