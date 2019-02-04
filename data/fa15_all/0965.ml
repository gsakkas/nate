
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> y
  | Sine e -> buildSine e
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> buildThresh (a, b, a_less, b_less);;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

*)

(* changed spans
(11,14)-(11,24)
EMPTY
EmptyG

(11,18)-(11,24)
EMPTY
EmptyG

(11,23)-(11,24)
EMPTY
EmptyG

(13,17)-(13,67)
EMPTY
EmptyG

(13,38)-(13,67)
EMPTY
EmptyG

(13,46)-(13,47)
EMPTY
EmptyG

(13,49)-(13,50)
EMPTY
EmptyG

(13,52)-(13,58)
EMPTY
EmptyG

(13,60)-(13,66)
EMPTY
EmptyG

(15,11)-(15,20)
EMPTY
EmptyG

(15,16)-(15,20)
EMPTY
EmptyG

(20,2)-(27,68)
match e with
| buildX -> x
| buildY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> 0.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(21,13)-(21,19)
EMPTY
EmptyG

(21,13)-(21,22)
EMPTY
EmptyG

(21,20)-(21,22)
x
VarG

(23,14)-(23,23)
sin
VarG

(23,24)-(23,25)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(24,16)-(24,44)
y
VarG

(27,34)-(27,45)
EMPTY
EmptyG

(27,34)-(27,68)
EMPTY
EmptyG

(27,46)-(27,68)
EMPTY
EmptyG

(27,47)-(27,48)
EMPTY
EmptyG

(27,50)-(27,51)
EMPTY
EmptyG

(27,53)-(27,59)
EMPTY
EmptyG

(27,61)-(27,67)
0.0
LitG

*)
