
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (eval (sine, x, y))
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
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
(11,14)-(26,81)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(12,2)-(26,81)
match e with
| VarX -> x
| VarY -> y
| Sine sine -> sin (pi *. eval (sine , x , y))
| Cosine cosine -> cos (pi *. eval (cosine , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (th1 , th2 , th3 , th4) -> if eval (th1 , x , y) < eval (th2 , x , y)
                                    then eval (th3 , x , y)
                                    else eval (th4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(15,21)-(15,40)
pi *. eval (sine , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(16,18)-(16,56)
EMPTY
EmptyG

(16,32)-(16,36)
pi *. eval (cosine , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(16,38)-(16,41)
cosine
VarG

(16,52)-(16,55)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,14)-(18,31)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(18,34)-(18,70)
EMPTY
EmptyG

(18,62)-(18,68)
2.0
LitG

(19,21)-(19,38)
eval (t1 , x , y) *. eval (t2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(19,41)-(19,66)
EMPTY
EmptyG

(21,6)-(26,81)
if eval (th1 , x , y) < eval (th2 , x , y)
then eval (th3 , x , y)
else eval (th4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,9)-(22,27)
eval (th1 , x , y) < eval (th2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,11)-(26,80)
EMPTY
EmptyG

(25,17)-(26,78)
EMPTY
EmptyG

(26,42)-(26,76)
EMPTY
EmptyG

(26,71)-(26,74)
EMPTY
EmptyG

*)

(* typed spans
(11,9)-(11,26)
(14,2)-(24,27)
(17,21)-(17,48)
(18,25)-(18,54)
(18,39)-(18,45)
(19,23)-(19,70)
(19,23)-(19,63)
(19,67)-(19,70)
(20,21)-(20,59)
(22,6)-(24,27)
(22,9)-(22,48)
*)

(* typed spans
float
float
float
float
expr
float
float
float
float
float
bool
*)

(* typed spans
(expr * float * float) -> float
float
float
(expr * float * float) -> float
expr
string
float
string
float
string
float
*)
