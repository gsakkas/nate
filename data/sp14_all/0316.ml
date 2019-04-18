
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
  | buildX -> x
  | buildY -> y
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e1, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then eval (e3, x, y);;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y);;

*)

(* changed spans
(14,3)-(22,68)
match e with
| VarX -> x
| VarY -> y
| Sine e1 -> sin (pi *. eval (e1 , x , y))
| Cosine e1 -> cos (pi *. eval (e1 , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) when eval (e1 , x , y) < eval (e2 , x , y) -> eval (e3 , x , y)
CaseG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])

(15,15)-(15,16)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,15)-(16,16)
x
VarG

(17,16)-(17,44)
y
VarG

(18,18)-(18,46)
sin (pi *. eval (e1 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(19,24)-(19,67)
cos (pi *. eval (e1 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(20,22)-(20,59)
(eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(22,7)-(22,68)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(17,16)-(17,19)
(17,16)-(17,44)
(17,20)-(17,44)
(17,21)-(17,23)
(17,26)-(17,43)
(17,27)-(17,31)
(18,18)-(18,21)
(18,18)-(18,46)
(18,22)-(18,46)
(18,23)-(18,25)
(22,7)-(22,68)
(22,53)-(22,57)
(22,53)-(22,68)
(22,68)-(22,68)
*)
