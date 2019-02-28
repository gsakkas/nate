
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
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval x1) +. (eval x2)) /. 2.;;


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
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.;;

*)

(* changed spans
(19,30)-(19,32)
(x1 , x , y)
TupleG (fromList [VarG])

(19,43)-(19,45)
(x2 , x , y)
TupleG (fromList [VarG])

(19,51)-(19,53)
x
VarG

(19,51)-(19,53)
y
VarG

*)

(* changed exprs
Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "x1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]
Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "x2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]
Var (Just (19,56)-(19,57)) "x"
Var (Just (19,59)-(19,60)) "y"
*)

(* typed spans
(19,30)-(19,40)
(19,51)-(19,61)
(19,56)-(19,57)
(19,59)-(19,60)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
*)

(* bad types
expr
expr
float
float
*)
