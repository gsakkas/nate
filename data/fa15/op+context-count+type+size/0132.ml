
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
      ((eval (t, x, y)) / 30) +. ((eval (r, x, y)) / (eval (s, x, y)));;


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
(27,9)-(27,29)
(27,27)-(27,29)
(27,36)-(27,49)
(27,36)-(27,68)
*)

(* type error slice
(18,20)-(18,40)
(18,27)-(18,31)
(18,27)-(18,40)
(27,9)-(27,13)
(27,9)-(27,22)
(27,9)-(27,29)
(27,9)-(27,29)
(27,9)-(27,68)
(27,9)-(27,68)
(27,36)-(27,40)
(27,36)-(27,49)
(27,36)-(27,68)
(27,36)-(27,68)
(27,36)-(27,68)
(27,55)-(27,59)
(27,55)-(27,68)
*)
