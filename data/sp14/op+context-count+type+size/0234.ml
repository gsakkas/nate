
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval e1) > (eval e2) then eval e3 else - (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (-1.0) *. (eval (e3, x, y));;

*)

(* changed spans
(31,15)-(31,17)
(31,21)-(31,30)
(31,27)-(31,29)
(31,36)-(31,40)
(31,36)-(31,43)
(31,41)-(31,43)
(31,49)-(31,60)
(31,51)-(31,60)
(31,57)-(31,59)
*)

(* type error slice
(16,2)-(31,60)
(16,2)-(31,60)
(16,2)-(31,60)
(19,19)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(31,6)-(31,60)
(31,6)-(31,60)
(31,9)-(31,18)
(31,10)-(31,14)
(31,15)-(31,17)
(31,21)-(31,30)
(31,22)-(31,26)
(31,27)-(31,29)
(31,36)-(31,40)
(31,36)-(31,43)
(31,41)-(31,43)
(31,49)-(31,60)
(31,51)-(31,60)
(31,52)-(31,56)
(31,57)-(31,59)
*)
