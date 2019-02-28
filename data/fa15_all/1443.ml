
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> buildAverage (x, y)
  | Times (e1,e2) -> buildTimes (x, y)
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,18)-(11,43)
EMPTY
EmptyG

(25,23)-(25,35)
eval
VarG

(25,23)-(25,42)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(25,37)-(25,38)
(e1 , x , y)
TupleG (fromList [VarG])

(26,21)-(26,31)
eval
VarG

(26,33)-(26,34)
(e2 , x , y)
TupleG (fromList [VarG])

(27,28)-(27,39)
eval
VarG

(27,28)-(27,52)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,41)-(27,42)
(e1 , x , y)
TupleG (fromList [VarG])

(27,47)-(27,48)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* typed spans
(19,25)-(19,29)
(19,23)-(19,70)
(19,30)-(19,40)
(19,46)-(19,50)
(19,51)-(19,61)
(20,22)-(20,26)
(20,21)-(20,59)
(20,27)-(20,37)
(20,42)-(20,59)
*)

(* typed spans
(expr * float * float) -> float
float
(expr * float * float)
(expr * float * float) -> float
(expr * float * float)
(expr * float * float) -> float
float
(expr * float * float)
float
*)

(* typed spans
(expr * expr) -> expr
expr
expr
(expr * expr) -> expr
expr
(expr * expr * expr * expr) -> expr
expr
expr
expr
*)
