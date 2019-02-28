
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
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
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
(37,23)-(37,70)
eval (ex1 , x , y) *. eval (ex2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,28)-(40,29)
if eval (ex1 , x , y) < eval (ex2 , x , y)
then eval (ex3 , x , y)
else eval (ex4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(40,10)-(40,22)
eval
VarG

(40,10)-(40,22)
(ex1 , x , y)
TupleG (fromList [VarG])

(41,11)-(44,80)
x
VarG

(42,34)-(42,35)
y
VarG

(42,16)-(42,28)
eval
VarG

(42,16)-(42,28)
(ex2 , x , y)
TupleG (fromList [VarG])

(43,17)-(44,78)
x
VarG

(44,40)-(44,41)
y
VarG

(44,22)-(44,34)
eval
VarG

(44,22)-(44,34)
(ex3 , x , y)
TupleG (fromList [VarG])

(44,42)-(44,76)
x
VarG

(44,69)-(44,70)
y
VarG

(44,51)-(44,63)
eval
VarG

(44,51)-(44,63)
(ex4 , x , y)
TupleG (fromList [VarG])

(44,71)-(44,74)
x
VarG

(44,71)-(44,74)
y
VarG

*)

(* changed exprs
Bop (Just (20,23)-(20,63)) FTimes (App (Just (20,23)-(20,41)) (Var (Just (20,24)-(20,28)) "eval") [Tuple (Just (20,29)-(20,40)) [Var (Just (20,30)-(20,33)) "ex1",Var (Just (20,35)-(20,36)) "x",Var (Just (20,38)-(20,39)) "y"]]) (App (Just (20,45)-(20,63)) (Var (Just (20,46)-(20,50)) "eval") [Tuple (Just (20,51)-(20,62)) [Var (Just (20,52)-(20,55)) "ex2",Var (Just (20,57)-(20,58)) "x",Var (Just (20,60)-(20,61)) "y"]])
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
(20,23)-(20,63)
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
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string
*)
