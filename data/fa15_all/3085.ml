
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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Average (x3,x4) -> ((eval (x3, x, y)) +. (eval (x4, x, y))) / 2
  | Times (x5,x6) -> (eval (x5, x, y)) *. (eval (x6, x, y))
  | Thresh (x7,x8,x9,x0) ->
      if (eval (x7, x, y)) < (eval (x8, x, y))
      then eval (x9, x, y)
      else eval (x0, x, y);;


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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Average (x3,x4) -> ((eval (x3, x, y)) +. (eval (x4, x, y))) /. 2.
  | Times (x5,x6) -> (eval (x5, x, y)) *. (eval (x6, x, y))
  | Thresh (x7,x8,x9,x0) ->
      if (eval (x7, x, y)) < (eval (x8, x, y))
      then eval (x9, x, y)
      else eval (x0, x, y);;

*)

(* changed spans
(19,24)-(19,68)
(eval (x3 , x , y) +. eval (x4 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(14,3)-(24,27)
(17,16)-(17,19)
(17,16)-(17,45)
(19,24)-(19,64)
(19,24)-(19,68)
*)
