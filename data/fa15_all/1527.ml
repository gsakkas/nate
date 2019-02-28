
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
  | Sine e1 -> sin (pi *. (eval e1))
  | Cosine e1 -> cos (pi *. (eval e1))
  | Average (e1,e2) -> (e1 +. e2) /. 2.0
  | Times (e1,e2) -> (exprToString e1) *. (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      if (exprToString e1) < (exprToString e2)
      then exprToString e3
      else exprToString e4;;


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

(34,32)-(34,34)
(e1 , x , y)
TupleG (fromList [VarG])

(35,17)-(35,38)
y
VarG

(35,34)-(35,36)
(e1 , x , y)
TupleG (fromList [VarG])

(36,23)-(36,40)
y
VarG

(36,24)-(36,26)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(36,30)-(36,32)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(36,37)-(36,40)
y
VarG

(37,22)-(37,34)
eval
VarG

(37,35)-(37,37)
(e1 , x , y)
TupleG (fromList [VarG])

(37,42)-(37,59)
y
VarG

(37,43)-(37,55)
eval
VarG

(37,56)-(37,58)
(e2 , x , y)
TupleG (fromList [VarG])

(39,6)-(41,26)
y
VarG

(39,10)-(39,22)
eval
VarG

(39,23)-(39,25)
(e1 , x , y)
TupleG (fromList [VarG])

(39,29)-(39,46)
y
VarG

(39,30)-(39,42)
eval
VarG

(39,43)-(39,45)
(e2 , x , y)
TupleG (fromList [VarG])

(40,11)-(40,23)
eval
VarG

(40,11)-(40,26)
y
VarG

(40,24)-(40,26)
(e3 , x , y)
TupleG (fromList [VarG])

(41,11)-(41,23)
eval
VarG

(41,11)-(41,26)
y
VarG

(41,24)-(41,26)
(e4 , x , y)
TupleG (fromList [VarG])

*)

(* typed spans
(17,32)-(17,42)
(17,40)-(17,41)
(18,34)-(18,44)
(18,42)-(18,43)
(19,24)-(19,41)
(19,45)-(19,62)
(19,59)-(19,60)
(20,22)-(20,26)
(20,27)-(20,37)
(20,35)-(20,36)
(20,43)-(20,47)
(20,48)-(20,58)
(20,56)-(20,57)
(22,10)-(22,14)
(22,15)-(22,25)
(22,23)-(22,24)
(22,30)-(22,34)
(22,35)-(22,45)
(23,11)-(23,15)
(22,43)-(22,44)
(23,16)-(23,26)
(24,11)-(24,15)
(23,24)-(23,25)
(24,16)-(24,26)
*)

(* typed spans
(expr * float * float)
float
(expr * float * float)
float
float
float
float
(expr * float * float) -> float
(expr * float * float)
float
(expr * float * float) -> float
(expr * float * float)
float
(expr * float * float) -> float
(expr * float * float)
float
(expr * float * float) -> float
(expr * float * float)
(expr * float * float) -> float
float
(expr * float * float)
(expr * float * float) -> float
float
(expr * float * float)
*)

(* typed spans
expr
float
expr
float
expr
expr
float
expr -> string
expr
string
expr -> string
expr
string
expr -> string
expr
string
expr -> string
expr
expr -> string
string
expr
expr -> string
string
expr
*)
