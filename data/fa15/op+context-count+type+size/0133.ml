
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) mod 30.0) +. ((eval (r, x, y)) mod (eval (s, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) /. 30.0) +. ((eval (r, x, y)) /. (eval (s, x, y)));;

*)

(* changed spans
(27,6)-(27,33)
(27,37)-(27,76)
*)

(* type error slice
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(27,6)-(27,33)
(27,6)-(27,33)
(27,6)-(27,33)
(27,6)-(27,76)
(27,6)-(27,76)
(27,7)-(27,23)
(27,8)-(27,12)
(27,28)-(27,32)
(27,37)-(27,76)
(27,37)-(27,76)
(27,37)-(27,76)
(27,38)-(27,54)
(27,39)-(27,43)
(27,59)-(27,75)
(27,60)-(27,64)
*)
