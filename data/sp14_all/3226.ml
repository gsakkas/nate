
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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;

*)

(* changed spans
(35,17)-(35,54)
cos (pi *. eval (ex , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(37,33)-(37,34)
(eval (ex1 , x , y) +. eval (ex2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(37,15)-(37,27)
eval
VarG

(37,15)-(37,27)
(ex1 , x , y)
TupleG (fromList [VarG])

(37,35)-(37,72)
x
VarG

(37,62)-(37,63)
y
VarG

(37,44)-(37,56)
eval
VarG

(37,44)-(37,56)
(ex2 , x , y)
TupleG (fromList [VarG])

(38,23)-(38,70)
x
VarG

(38,42)-(38,43)
y
VarG

(38,42)-(38,43)
2.0
LitG

(38,42)-(38,43)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(38,24)-(38,36)
eval
VarG

(38,24)-(38,36)
(ex1 , x , y)
TupleG (fromList [VarG])

(38,44)-(38,70)
x
VarG

(38,45)-(38,48)
y
VarG

(38,52)-(38,64)
eval
VarG

(38,52)-(38,64)
(ex2 , x , y)
TupleG (fromList [VarG])

(40,6)-(45,81)
x
VarG

(41,28)-(41,29)
y
VarG

(41,28)-(41,29)
if eval (ex1 , x , y) < eval (ex2 , x , y)
then eval (ex3 , x , y)
else eval (ex4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(41,10)-(41,22)
eval
VarG

(41,10)-(41,22)
(ex1 , x , y)
TupleG (fromList [VarG])

(42,11)-(45,80)
x
VarG

(43,34)-(43,35)
y
VarG

(43,16)-(43,28)
eval
VarG

(43,16)-(43,28)
(ex2 , x , y)
TupleG (fromList [VarG])

(44,17)-(45,78)
x
VarG

(45,40)-(45,41)
y
VarG

(45,22)-(45,34)
eval
VarG

(45,22)-(45,34)
(ex3 , x , y)
TupleG (fromList [VarG])

(45,42)-(45,76)
x
VarG

(45,69)-(45,70)
y
VarG

(45,51)-(45,63)
eval
VarG

(45,51)-(45,63)
(ex4 , x , y)
TupleG (fromList [VarG])

(45,71)-(45,74)
x
VarG

(45,71)-(45,74)
y
VarG

*)

(* changed exprs
App (Just (18,17)-(18,46)) (Var (Just (18,17)-(18,20)) "cos") [Bop (Just (18,21)-(18,46)) FTimes (Var (Just (18,22)-(18,24)) "pi") (App (Just (18,28)-(18,45)) (Var (Just (18,29)-(18,33)) "eval") [Tuple (Just (18,34)-(18,44)) [Var (Just (18,35)-(18,37)) "ex",Var (Just (18,39)-(18,40)) "x",Var (Just (18,42)-(18,43)) "y"]])]
Bop (Just (19,25)-(19,73)) FDiv (Bop (Just (19,25)-(19,67)) FPlus (App (Just (19,26)-(19,44)) (Var (Just (19,27)-(19,31)) "eval") [Tuple (Just (19,32)-(19,43)) [Var (Just (19,33)-(19,36)) "ex1",Var (Just (19,38)-(19,39)) "x",Var (Just (19,41)-(19,42)) "y"]]) (App (Just (19,48)-(19,66)) (Var (Just (19,49)-(19,53)) "eval") [Tuple (Just (19,54)-(19,65)) [Var (Just (19,55)-(19,58)) "ex2",Var (Just (19,60)-(19,61)) "x",Var (Just (19,63)-(19,64)) "y"]])) (Lit (Just (19,71)-(19,73)) (LD 2.0))
Var (Just (19,27)-(19,31)) "eval"
Tuple (Just (19,32)-(19,43)) [Var (Just (19,33)-(19,36)) "ex1",Var (Just (19,38)-(19,39)) "x",Var (Just (19,41)-(19,42)) "y"]
Var (Just (19,38)-(19,39)) "x"
Var (Just (19,41)-(19,42)) "y"
Var (Just (19,49)-(19,53)) "eval"
Tuple (Just (19,54)-(19,65)) [Var (Just (19,55)-(19,58)) "ex2",Var (Just (19,60)-(19,61)) "x",Var (Just (19,63)-(19,64)) "y"]
Var (Just (19,60)-(19,61)) "x"
Var (Just (19,63)-(19,64)) "y"
Lit (Just (19,71)-(19,73)) (LD 2.0)
Bop (Just (20,23)-(20,63)) FTimes (App (Just (20,23)-(20,41)) (Var (Just (20,24)-(20,28)) "eval") [Tuple (Just (20,29)-(20,40)) [Var (Just (20,30)-(20,33)) "ex1",Var (Just (20,35)-(20,36)) "x",Var (Just (20,38)-(20,39)) "y"]]) (App (Just (20,45)-(20,63)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,62)) [Var (Just (20,52)-(20,55)) "ex2",Var (Just (20,57)-(20,58)) "x",Var (Just (20,60)-(20,61)) "y"]])
Var (Just (20,24)-(20,28)) "eval"
Tuple (Just (20,29)-(20,40)) [Var (Just (20,30)-(20,33)) "ex1",Var (Just (20,35)-(20,36)) "x",Var (Just (20,38)-(20,39)) "y"]
Var (Just (20,35)-(20,36)) "x"
Var (Just (20,38)-(20,39)) "y"
Var (Just (20,46)-(20,50)) "eval"
Tuple (Just (20,51)-(20,62)) [Var (Just (20,52)-(20,55)) "ex2",Var (Just (20,57)-(20,58)) "x",Var (Just (20,60)-(20,61)) "y"]
Var (Just (20,57)-(20,58)) "x"
Var (Just (20,60)-(20,61)) "y"
Ite (Just (22,6)-(24,27)) (Bop (Just (22,9)-(22,48)) Lt (App (Just (22,9)-(22,27)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,26)) [Var (Just (22,16)-(22,19)) "ex1",Var (Just (22,21)-(22,22)) "x",Var (Just (22,24)-(22,25)) "y"]]) (App (Just (22,30)-(22,48)) (Var (Just (22,31)-(22,35)) "eval") [Tuple (Just (22,36)-(22,47)) [Var (Just (22,37)-(22,40)) "ex2",Var (Just (22,42)-(22,43)) "x",Var (Just (22,45)-(22,46)) "y"]])) (App (Just (23,11)-(23,27)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,27)) [Var (Just (23,17)-(23,20)) "ex3",Var (Just (23,22)-(23,23)) "x",Var (Just (23,25)-(23,26)) "y"]]) (App (Just (24,11)-(24,27)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,27)) [Var (Just (24,17)-(24,20)) "ex4",Var (Just (24,22)-(24,23)) "x",Var (Just (24,25)-(24,26)) "y"]])
Var (Just (22,10)-(22,14)) "eval"
Tuple (Just (22,15)-(22,26)) [Var (Just (22,16)-(22,19)) "ex1",Var (Just (22,21)-(22,22)) "x",Var (Just (22,24)-(22,25)) "y"]
Var (Just (22,21)-(22,22)) "x"
Var (Just (22,24)-(22,25)) "y"
Var (Just (22,31)-(22,35)) "eval"
Tuple (Just (22,36)-(22,47)) [Var (Just (22,37)-(22,40)) "ex2",Var (Just (22,42)-(22,43)) "x",Var (Just (22,45)-(22,46)) "y"]
Var (Just (22,42)-(22,43)) "x"
Var (Just (22,45)-(22,46)) "y"
Var (Just (23,11)-(23,15)) "eval"
Tuple (Just (23,16)-(23,27)) [Var (Just (23,17)-(23,20)) "ex3",Var (Just (23,22)-(23,23)) "x",Var (Just (23,25)-(23,26)) "y"]
Var (Just (23,22)-(23,23)) "x"
Var (Just (23,25)-(23,26)) "y"
Var (Just (24,11)-(24,15)) "eval"
Tuple (Just (24,16)-(24,27)) [Var (Just (24,17)-(24,20)) "ex4",Var (Just (24,22)-(24,23)) "x",Var (Just (24,25)-(24,26)) "y"]
Var (Just (24,22)-(24,23)) "x"
Var (Just (24,25)-(24,26)) "y"
*)

(* typed spans
(18,17)-(18,46)
(19,25)-(19,73)
(19,27)-(19,31)
(19,32)-(19,43)
(19,38)-(19,39)
(19,41)-(19,42)
(19,49)-(19,53)
(19,54)-(19,65)
(19,60)-(19,61)
(19,63)-(19,64)
(19,71)-(19,73)
(20,23)-(20,63)
(20,24)-(20,28)
(20,29)-(20,40)
(20,35)-(20,36)
(20,38)-(20,39)
(20,46)-(20,50)
(20,51)-(20,62)
(20,57)-(20,58)
(20,60)-(20,61)
(22,6)-(24,27)
(22,10)-(22,14)
(22,15)-(22,26)
(22,21)-(22,22)
(22,24)-(22,25)
(22,31)-(22,35)
(22,36)-(22,47)
(22,42)-(22,43)
(22,45)-(22,46)
(23,11)-(23,15)
(23,16)-(23,27)
(23,22)-(23,23)
(23,25)-(23,26)
(24,11)-(24,15)
(24,16)-(24,27)
(24,22)-(24,23)
(24,25)-(24,26)
*)

(* correct types
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
*)

(* bad types
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
string -> string -> string
string -> string -> string
expr -> string
expr -> string
string
string
expr -> string
expr -> string
string
string -> string -> string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string
*)
