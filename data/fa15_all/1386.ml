
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      sqrt (abs_float (1.0 -. ((eval (circ1, x, y)) ** 2.0)))
  | Oscillate m4 ->
      let x = eval (m4, x, y) in
      x /. (sqrt (((eval (m4, x, y)) ** 2) +. (x ** 2)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      sqrt (abs_float (1.0 -. ((eval (circ1, x, y)) ** 2.0)))
  | Oscillate m4 ->
      let x = eval (m4, x, y) in
      x /. (sqrt (((eval (m4, x, y)) ** 2.0) +. (x ** 2.0)));;

*)

(* changed spans
(31,40)-(31,41)
2.0
LitG

(31,52)-(31,53)
2.0
LitG

*)

(* changed exprs
Lit (Just (31,40)-(31,43)) (LD 2.0)
Lit (Just (31,54)-(31,57)) (LD 2.0)
*)

(* typed spans
(31,40)-(31,43)
(31,54)-(31,57)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
