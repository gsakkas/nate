
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let rec factorial x acc =
  if x = 0.0 then acc else factorial (x -. 1.0) (x *. acc);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Factorial e' -> factorial (eval e')
  | Sum3 (e1,e2,e3) -> ((eval e1) +. (eval e2)) +. (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(13,18)-(14,58)
EMPTY
EmptyG

(13,20)-(14,58)
EMPTY
EmptyG

(14,2)-(14,58)
EMPTY
EmptyG

(14,5)-(14,6)
EMPTY
EmptyG

(14,5)-(14,12)
EMPTY
EmptyG

(14,9)-(14,12)
EMPTY
EmptyG

(14,18)-(14,21)
EMPTY
EmptyG

(14,27)-(14,36)
EMPTY
EmptyG

(14,27)-(14,58)
EMPTY
EmptyG

(14,37)-(14,47)
EMPTY
EmptyG

(14,38)-(14,39)
EMPTY
EmptyG

(14,43)-(14,46)
EMPTY
EmptyG

(14,49)-(14,50)
EMPTY
EmptyG

(14,54)-(14,57)
EMPTY
EmptyG

(16,9)-(16,26)
EMPTY
EmptyG

(19,2)-(31,60)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Cosine e' -> cos (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(30,20)-(30,29)
EMPTY
EmptyG

(30,20)-(30,39)
EMPTY
EmptyG

(30,30)-(30,39)
EMPTY
EmptyG

(30,31)-(30,35)
EMPTY
EmptyG

(30,36)-(30,38)
EMPTY
EmptyG

(31,23)-(31,47)
EMPTY
EmptyG

(31,23)-(31,60)
EMPTY
EmptyG

(31,24)-(31,33)
EMPTY
EmptyG

(31,25)-(31,29)
EMPTY
EmptyG

(31,30)-(31,32)
EMPTY
EmptyG

(31,37)-(31,46)
EMPTY
EmptyG

(31,38)-(31,42)
EMPTY
EmptyG

(31,43)-(31,45)
EMPTY
EmptyG

(31,51)-(31,60)
EMPTY
EmptyG

(31,52)-(31,56)
EMPTY
EmptyG

(31,57)-(31,59)
EMPTY
EmptyG

*)
