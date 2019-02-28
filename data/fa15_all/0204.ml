
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,17)-(11,67)
EMPTY
EmptyG

(23,28)-(23,39)
eval
VarG

(23,28)-(23,56)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,41)-(23,43)
(e1 , x , y)
TupleG (fromList [VarG])

(23,45)-(23,47)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,49)-(23,51)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,53)-(23,55)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* typed spans
(22,10)-(22,14)
(22,6)-(24,26)
(22,15)-(22,25)
(22,29)-(22,46)
(23,11)-(23,26)
(24,11)-(24,26)
*)

(* typed spans
(expr * float * float) -> float
float
(expr * float * float)
float
float
float
*)

(* typed spans
(expr * expr * expr * expr) -> expr
expr
expr
expr
expr
expr
*)
