
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if
        (((-1.0) < x) < 1.0) && ((x > (-1.0)) && ((y < 1.0) && (y > (-1.0))))
      then x *. y
      else (eval (a, x, y)) ** (eval (b, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(27,6)-(30,47)
EMPTY
EmptyG

(28,8)-(28,28)
EMPTY
EmptyG

(28,8)-(28,77)
EMPTY
EmptyG

(28,9)-(28,21)
EMPTY
EmptyG

(28,10)-(28,16)
EMPTY
EmptyG

(28,12)-(28,15)
EMPTY
EmptyG

(28,19)-(28,20)
EMPTY
EmptyG

(28,24)-(28,27)
EMPTY
EmptyG

(28,32)-(28,77)
EMPTY
EmptyG

(28,33)-(28,45)
EMPTY
EmptyG

(28,34)-(28,35)
EMPTY
EmptyG

(28,38)-(28,44)
EMPTY
EmptyG

(28,40)-(28,43)
EMPTY
EmptyG

(28,49)-(28,76)
EMPTY
EmptyG

(28,50)-(28,59)
EMPTY
EmptyG

(28,51)-(28,52)
EMPTY
EmptyG

(28,55)-(28,58)
EMPTY
EmptyG

(28,63)-(28,75)
EMPTY
EmptyG

(28,64)-(28,65)
EMPTY
EmptyG

(28,68)-(28,74)
EMPTY
EmptyG

(28,70)-(28,73)
EMPTY
EmptyG

(29,11)-(29,12)
EMPTY
EmptyG

(29,11)-(29,17)
EMPTY
EmptyG

(29,16)-(29,17)
EMPTY
EmptyG

(30,11)-(30,47)
EMPTY
EmptyG

(30,28)-(30,30)
eval (a , x , y) +. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
