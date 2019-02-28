
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
  | Golden e' -> cos (((eval (e', x, y)) *. x) * y)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;


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
  | Golden e' -> cos (((eval (e', x, y)) *. x) *. y)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;

*)

(* changed spans
(27,21)-(27,51)
(eval (e' , x , y) *. x) *. y
BopG (BopG EmptyG EmptyG) VarG

*)

(* changed exprs
Bop (Just (27,21)-(27,52)) FTimes (Bop (Just (27,22)-(27,46)) FTimes (App (Just (27,23)-(27,40)) (Var (Just (27,24)-(27,28)) "eval") [Tuple (Just (27,29)-(27,39)) [Var (Just (27,30)-(27,32)) "e'",Var (Just (27,34)-(27,35)) "x",Var (Just (27,37)-(27,38)) "y"]]) (Var (Just (27,44)-(27,45)) "x")) (Var (Just (27,50)-(27,51)) "y")
*)

(* typed spans
(27,21)-(27,52)
*)

(* correct types
float
*)

(* bad types
int
*)
