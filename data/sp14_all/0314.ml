
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
  | VarX  -> float_of_int x
  | VarY  -> float_of_int y
  | Sine e1 -> sin (pi * (eval (e1, x, y)))
  | Cosine e1 -> cos (pi * (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e1, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y)) then eval (e3, x, y);;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e1, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y);;

*)

(* changed spans
(15,13)-(15,27)
eval (e1 , x , y) < eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,19)-(17,43)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,45)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,23)-(19,66)
(eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,21)-(20,58)
eval
VarG

(20,21)-(20,58)
(e1 , x , y)
TupleG (fromList [VarG])

(20,21)-(20,58)
e1
VarG

(20,21)-(20,58)
x
VarG

(20,21)-(20,58)
y
VarG

(20,21)-(20,58)
(eval (e1 , x , y) +. eval (e1 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(22,6)-(22,67)
2.0
LitG

(22,9)-(22,46)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(22,6)-(22,67)
EMPTY
EmptyG

*)

(* changed exprs
Bop (Just (21,30)-(21,67)) Lt (App (Just (21,30)-(21,47)) (Var (Just (21,31)-(21,35)) "eval") [Tuple (Just (21,36)-(21,46)) [Var (Just (21,37)-(21,39)) "e1",Var (Just (21,41)-(21,42)) "x",Var (Just (21,44)-(21,45)) "y"]]) (App (Just (21,50)-(21,67)) (Var (Just (21,51)-(21,55)) "eval") [Tuple (Just (21,56)-(21,66)) [Var (Just (21,57)-(21,59)) "e2",Var (Just (21,61)-(21,62)) "x",Var (Just (21,64)-(21,65)) "y"]])
Bop (Just (17,19)-(17,44)) FTimes (Var (Just (17,20)-(17,22)) "pi") (App (Just (17,26)-(17,43)) (Var (Just (17,27)-(17,31)) "eval") [Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "e1",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]])
Bop (Just (18,21)-(18,46)) FTimes (Var (Just (18,22)-(18,24)) "pi") (App (Just (18,28)-(18,45)) (Var (Just (18,29)-(18,33)) "eval") [Tuple (Just (18,34)-(18,44)) [Var (Just (18,35)-(18,37)) "e1",Var (Just (18,39)-(18,40)) "x",Var (Just (18,42)-(18,43)) "y"]])
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e1",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Var (Just (18,29)-(18,33)) "eval"
Tuple (Just (18,34)-(18,44)) [Var (Just (18,35)-(18,37)) "e1",Var (Just (18,39)-(18,40)) "x",Var (Just (18,42)-(18,43)) "y"]
Var (Just (18,35)-(18,37)) "e1"
Var (Just (18,39)-(18,40)) "x"
Var (Just (18,42)-(18,43)) "y"
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e1",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Lit (Just (19,67)-(19,70)) (LD 2.0)
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
Var (Just (22,6)-(22,67)) "EMPTY"
*)

(* typed spans
(21,30)-(21,67)
(17,19)-(17,44)
(18,21)-(18,46)
(19,23)-(19,70)
(18,29)-(18,33)
(18,34)-(18,44)
(18,35)-(18,37)
(18,39)-(18,40)
(18,42)-(18,43)
(19,23)-(19,70)
(19,67)-(19,70)
(20,21)-(20,59)
*)

(* correct types
bool
float
float
float
(expr * float * float) -> float
(expr * float * float)
expr
float
float
float
float
float
*)

(* bad types
float
int
int
int
int
int
int
int
int
int
unit
bool
*)
