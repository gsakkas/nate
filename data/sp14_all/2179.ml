
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
      else eval (d, x, y)
  | Poly (a,b,c) ->
      (eval ((a, x, y) *. (a, x, y))) + ((b, x, y) *. (c, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
      else eval (d, x, y)
  | Poly (a,b,c) ->
      ((eval (a, x, y)) *. (eval (a, x, y))) +.
        ((eval (b, x, y)) *. (eval (c, x, y)));;

*)

(* changed spans
(28,6)-(28,37)
eval (a , x , y) *. eval (a , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,6)-(28,64)
(eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (c , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(28,12)-(28,36)
EMPTY
EmptyG

(28,26)-(28,35)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,41)-(28,50)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,54)-(28,63)
eval (c , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
