
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

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
  | Golden e' -> cos ((((eval (e', x, y)) ** 2) -. (eval (e', x, y))) -. 1)
  | MeanPi (e1,e2,e3) ->
      cos
        ((((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) /.
           pi);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

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
  | Golden e' ->
      cos ((((eval (e', x, y)) ** 2.0) -. (eval (e', x, y))) -. 1.0)
  | MeanPi (e1,e2,e3) ->
      cos
        ((((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) /.
           pi);;

*)

(* changed spans
(27,45)-(27,46)
2.0
LitG

(27,73)-(27,74)
1.0
LitG

*)

(* changed exprs
Lit (Just (28,34)-(28,37)) (LD 2.0)
Lit (Just (28,64)-(28,67)) (LD 1.0)
*)

(* typed spans
(28,34)-(28,37)
(28,64)-(28,67)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
