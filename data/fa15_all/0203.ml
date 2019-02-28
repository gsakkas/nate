
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> buildTimes ((eval e1), (eval e2))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


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
(24,21)-(24,54)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,50)-(24,52)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(25,40)-(25,56)
eval
VarG

(25,40)-(25,56)
(e1 , x , y)
TupleG (fromList [VarG])

(25,41)-(25,43)
x
VarG

(25,41)-(25,43)
y
VarG

(25,41)-(25,43)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,45)-(25,47)
x
VarG

(25,45)-(25,47)
y
VarG

(25,45)-(25,47)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,49)-(25,51)
x
VarG

(25,49)-(25,51)
y
VarG

(25,49)-(25,51)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,53)-(25,55)
x
VarG

(25,53)-(25,55)
y
VarG

*)

(* changed exprs
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
Ite (Just (22,6)-(24,26)) (Bop (Just (22,9)-(22,46)) Lt (App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "e1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]]) (App (Just (22,29)-(22,46)) (Var (Just (22,30)-(22,34)) "eval") [Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "e2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]])) (App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]) (App (Just (24,11)-(24,26)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "e4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]])
Var (Just (22,10)-(22,14)) "eval"
Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "e1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]
Var (Just (22,20)-(22,21)) "x"
Var (Just (22,23)-(22,24)) "y"
App (Just (22,29)-(22,46)) (Var (Just (22,30)-(22,34)) "eval") [Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "e2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]]
Var (Just (22,40)-(22,41)) "x"
Var (Just (22,43)-(22,44)) "y"
App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]
Var (Just (23,21)-(23,22)) "x"
Var (Just (23,24)-(23,25)) "y"
App (Just (24,11)-(24,26)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "e4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]]
Var (Just (24,21)-(24,22)) "x"
Var (Just (24,24)-(24,25)) "y"
*)

(* typed spans
(20,21)-(20,59)
(22,6)-(24,26)
(22,10)-(22,14)
(22,15)-(22,25)
(22,20)-(22,21)
(22,23)-(22,24)
(22,29)-(22,46)
(22,40)-(22,41)
(22,43)-(22,44)
(23,11)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(24,11)-(24,26)
(24,21)-(24,22)
(24,24)-(24,25)
*)

(* correct types
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
float
float
float
float
float
float
float
float
float
*)

(* bad types
expr
expr
(expr * expr * expr * expr)
(expr * expr * expr * expr)
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
*)
