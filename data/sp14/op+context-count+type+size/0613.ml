
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) / 2.0
  | Times (v,w) -> (eval (v, x, y)) * (eval (v, x, y))
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

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,21)-(15,65)
(16,19)-(16,54)
*)

(* type error slice
(13,14)-(13,17)
(13,14)-(13,34)
(13,18)-(13,34)
(13,19)-(13,23)
(15,21)-(15,59)
(15,21)-(15,65)
(15,21)-(15,65)
(15,62)-(15,65)
(16,19)-(16,35)
(16,19)-(16,54)
(16,19)-(16,54)
(16,20)-(16,24)
(16,38)-(16,54)
(16,39)-(16,43)
*)
