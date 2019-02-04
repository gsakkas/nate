
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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) / 2)
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(19,23)-(19,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,44)-(19,67)
EMPTY
EmptyG

(19,65)-(19,66)
EMPTY
EmptyG

(20,21)-(20,38)
eval (t1 , x , y) *. eval (t2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,21)-(20,66)
EMPTY
EmptyG

(20,39)-(20,40)
2.0
LitG

(20,41)-(20,66)
EMPTY
EmptyG

(20,42)-(20,45)
EMPTY
EmptyG

(20,46)-(20,47)
EMPTY
EmptyG

(22,6)-(22,9)
EMPTY
EmptyG

(22,6)-(27,81)
EMPTY
EmptyG

(22,10)-(22,11)
EMPTY
EmptyG

(23,8)-(27,81)
EMPTY
EmptyG

(23,9)-(23,27)
eval (th1 , x , y) < eval (th2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,28)-(23,29)
if eval (th1 , x , y) < eval (th2 , x , y)
then eval (th3 , x , y)
else eval (th4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,11)-(27,80)
EMPTY
EmptyG

(24,12)-(24,16)
EMPTY
EmptyG

(24,17)-(24,18)
EMPTY
EmptyG

(25,14)-(27,79)
EMPTY
EmptyG

(25,34)-(25,35)
EMPTY
EmptyG

(26,17)-(27,78)
EMPTY
EmptyG

(26,18)-(26,21)
EMPTY
EmptyG

(26,22)-(26,23)
EMPTY
EmptyG

(27,20)-(27,77)
EMPTY
EmptyG

(27,40)-(27,41)
EMPTY
EmptyG

(27,42)-(27,76)
EMPTY
EmptyG

(27,43)-(27,46)
EMPTY
EmptyG

(27,47)-(27,48)
EMPTY
EmptyG

(27,49)-(27,75)
EMPTY
EmptyG

(27,69)-(27,70)
EMPTY
EmptyG

(27,71)-(27,74)
EMPTY
EmptyG

*)
