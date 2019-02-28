
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos * (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> buildAverage (x, y)
  | Times (e1,e2) -> buildTimes (x, y)
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(24,16)-(24,46)
cos (pi *. eval (e , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(24,42)-(24,43)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(25,36)-(25,42)
eval
VarG

(25,36)-(25,42)
(e1 , x , y)
TupleG (fromList [VarG])

(26,32)-(26,38)
eval
VarG

(26,32)-(26,38)
(e2 , x , y)
TupleG (fromList [VarG])

(26,36)-(26,37)
2.0
LitG

(26,36)-(26,37)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,40)-(27,52)
eval
VarG

(27,40)-(27,52)
(e1 , x , y)
TupleG (fromList [VarG])

(27,44)-(27,45)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,50)-(27,51)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
App (Just (18,16)-(18,44)) (Var (Just (18,16)-(18,19)) "cos") [Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "e",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])]
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Var (Just (19,25)-(19,29)) "eval"
Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]
Var (Just (19,46)-(19,50)) "eval"
Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]
Lit (Just (19,67)-(19,70)) (LD 2.0)
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
Var (Just (20,22)-(20,26)) "eval"
Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]
App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]]
Ite (Just (22,6)-(24,26)) (Bop (Just (22,9)-(22,46)) Lt (App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "e1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]]) (App (Just (22,29)-(22,46)) (Var (Just (22,30)-(22,34)) "eval") [Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "e2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]])) (App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]) (App (Just (24,11)-(24,26)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "e4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]])
*)

(* typed spans
(18,16)-(18,44)
(19,23)-(19,70)
(19,25)-(19,29)
(19,30)-(19,40)
(19,46)-(19,50)
(19,51)-(19,61)
(19,67)-(19,70)
(20,21)-(20,59)
(20,22)-(20,26)
(20,27)-(20,37)
(20,42)-(20,59)
(22,6)-(24,26)
*)

(* correct types
float
float
(expr * float * float) -> float
(expr * float * float)
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
int
expr
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
expr
expr
(expr * expr * expr * expr)
(expr * expr * expr * expr)
expr
expr
*)
