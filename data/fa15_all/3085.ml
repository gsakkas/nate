
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
(19,23)-(19,67)
(eval (x3 , x , y) +. eval (x4 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (19,23)-(19,69)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "x3",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "x4",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,69)) (LD 2.0))
*)

(* typed spans
(19,23)-(19,69)
*)

(* correct types
float
*)

(* bad types
int
*)
