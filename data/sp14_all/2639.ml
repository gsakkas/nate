
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

let rec factorial x acc = if x = 0 then acc else factorial (x - 1) (x * acc);;

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
  | Sum3 (e1,e2,e3) -> ((eval e1) + (eval e2)) + (eval e3);;


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
(13,18)-(13,76)
EMPTY
EmptyG

(13,20)-(13,76)
EMPTY
EmptyG

(13,26)-(13,76)
EMPTY
EmptyG

(13,29)-(13,30)
EMPTY
EmptyG

(13,29)-(13,34)
EMPTY
EmptyG

(13,33)-(13,34)
EMPTY
EmptyG

(13,40)-(13,43)
EMPTY
EmptyG

(13,49)-(13,58)
EMPTY
EmptyG

(13,49)-(13,76)
EMPTY
EmptyG

(13,59)-(13,66)
EMPTY
EmptyG

(13,60)-(13,61)
EMPTY
EmptyG

(13,64)-(13,65)
EMPTY
EmptyG

(13,67)-(13,76)
EMPTY
EmptyG

(13,68)-(13,69)
EMPTY
EmptyG

(13,72)-(13,75)
EMPTY
EmptyG

(18,2)-(30,58)
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

(29,20)-(29,29)
EMPTY
EmptyG

(29,20)-(29,39)
EMPTY
EmptyG

(29,30)-(29,39)
EMPTY
EmptyG

(29,31)-(29,35)
EMPTY
EmptyG

(29,36)-(29,38)
EMPTY
EmptyG

(30,23)-(30,46)
EMPTY
EmptyG

(30,23)-(30,58)
EMPTY
EmptyG

(30,24)-(30,33)
EMPTY
EmptyG

(30,25)-(30,29)
EMPTY
EmptyG

(30,30)-(30,32)
EMPTY
EmptyG

(30,36)-(30,45)
EMPTY
EmptyG

(30,37)-(30,41)
EMPTY
EmptyG

(30,42)-(30,44)
EMPTY
EmptyG

(30,49)-(30,58)
EMPTY
EmptyG

(30,50)-(30,54)
EMPTY
EmptyG

(30,55)-(30,57)
EMPTY
EmptyG

*)
