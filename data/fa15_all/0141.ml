
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


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
(11,21)-(26,79)
EMPTY
EmptyG

(36,23)-(36,66)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(36,24)-(36,41)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(36,65)-(36,66)
2.0
LitG

(37,21)-(37,38)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(37,22)-(37,34)
eval
VarG

(37,35)-(37,37)
(e1 , x , y)
TupleG (fromList [VarG])

(37,41)-(37,66)
x
VarG

(37,48)-(37,65)
y
VarG

(37,49)-(37,61)
eval
VarG

(37,62)-(37,64)
(e2 , x , y)
TupleG (fromList [VarG])

(39,6)-(44,79)
x
VarG

(40,9)-(40,26)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,10)-(40,22)
eval
VarG

(40,23)-(40,25)
(e1 , x , y)
TupleG (fromList [VarG])

(41,11)-(44,78)
x
VarG

(42,15)-(42,32)
y
VarG

(42,16)-(42,28)
eval
VarG

(42,29)-(42,31)
(e2 , x , y)
TupleG (fromList [VarG])

(43,17)-(44,76)
x
VarG

(44,21)-(44,38)
y
VarG

(44,22)-(44,34)
eval
VarG

(44,35)-(44,37)
(e3 , x , y)
TupleG (fromList [VarG])

(44,41)-(44,74)
x
VarG

(44,49)-(44,66)
y
VarG

(44,50)-(44,62)
eval
VarG

(44,63)-(44,65)
(e4 , x , y)
TupleG (fromList [VarG])

(44,69)-(44,72)
x
VarG

*)

(* typed spans
(19,23)-(19,70)
(19,23)-(19,63)
(19,67)-(19,70)
(20,21)-(20,59)
(20,22)-(20,26)
(20,27)-(20,37)
(20,32)-(20,33)
(20,35)-(20,36)
(20,43)-(20,47)
(20,48)-(20,58)
(20,53)-(20,54)
(22,6)-(24,26)
(22,10)-(22,14)
(22,15)-(22,25)
(22,20)-(22,21)
(22,23)-(22,24)
(22,30)-(22,34)
(22,35)-(22,45)
(22,40)-(22,41)
(22,43)-(22,44)
(23,11)-(23,15)
(23,16)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(24,11)-(24,15)
(24,16)-(24,26)
(24,21)-(24,22)
*)

(* typed spans
float
float
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
*)

(* typed spans
int
float
int
string
expr -> string
expr
string
string
expr -> string
expr
string
string
expr -> string
expr
string
string
expr -> string
expr
string
string
expr -> string
expr
string
string
expr -> string
expr
string
*)
