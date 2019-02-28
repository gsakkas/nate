
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> ((eval (c, x, y)) +. (eval (d, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y)
  | Funny (k,l,m) ->
      ((eval (k, x, y)) +. (eval (l, x, y))) +. (eval (m, x, y))
  | Funny1 n -> (sqrt (abs_float (eval (n, x, y)))) / 1000.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> ((eval (c, x, y)) +. (eval (d, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y)
  | Funny (k,l,m) ->
      ((eval (k, x, y)) +. (eval (l, x, y))) +. (eval (m, x, y))
  | Funny1 n -> (sqrt (abs_float (eval (n, x, y)))) /. 1000.0;;

*)

(* changed spans
(29,16)-(29,60)
sqrt (abs_float (eval (n , x , y))) /. 1000.0
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (29,16)-(29,61)) FDiv (App (Just (29,16)-(29,51)) (Var (Just (29,17)-(29,21)) "sqrt") [App (Just (29,22)-(29,50)) (Var (Just (29,23)-(29,32)) "abs_float") [App (Just (29,33)-(29,49)) (Var (Just (29,34)-(29,38)) "eval") [Tuple (Just (29,39)-(29,48)) [Var (Just (29,40)-(29,41)) "n",Var (Just (29,43)-(29,44)) "x",Var (Just (29,46)-(29,47)) "y"]]]]) (Lit (Just (29,55)-(29,61)) (LD 1000.0))
*)

(* typed spans
(29,16)-(29,61)
*)

(* correct types
float
*)

(* bad types
int
*)
