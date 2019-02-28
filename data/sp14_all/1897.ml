
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos (pi *. (eval e))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
  | Times (e1,e2) -> (eval e1) *. (eval e2)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1) < (eval e2) then eval e3 else eval e4;;


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
  | Average (e1,e2) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e, x, y)) < (eval (e, x, y))
      then eval (e, x, y)
      else eval (e, x, y);;

*)

(* changed spans
(17,31)-(17,32)
(e , x , y)
TupleG (fromList [VarG])

(18,33)-(18,34)
(e , x , y)
TupleG (fromList [VarG])

(19,23)-(19,52)
x
VarG

(19,23)-(19,52)
y
VarG

(19,30)-(19,32)
(e , x , y)
TupleG (fromList [VarG])

(19,51)-(19,52)
(e , x , y)
TupleG (fromList [VarG])

(20,21)-(20,43)
2.0
LitG

(20,27)-(20,29)
(e , x , y)
TupleG (fromList [VarG])

(20,40)-(20,42)
(e , x , y)
TupleG (fromList [VarG])

(22,15)-(22,17)
(e , x , y)
TupleG (fromList [VarG])

(22,27)-(22,29)
(e , x , y)
TupleG (fromList [VarG])

(22,41)-(22,43)
(e , x , y)
TupleG (fromList [VarG])

(22,54)-(22,56)
(e , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "e",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]
Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "e",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]
Var (Just (18,37)-(18,38)) "x"
Var (Just (18,40)-(18,41)) "y"
Tuple (Just (19,30)-(19,39)) [Var (Just (19,31)-(19,32)) "e",Var (Just (19,34)-(19,35)) "x",Var (Just (19,37)-(19,38)) "y"]
Tuple (Just (19,50)-(19,59)) [Var (Just (19,51)-(19,52)) "e",Var (Just (19,54)-(19,55)) "x",Var (Just (19,57)-(19,58)) "y"]
Lit (Just (19,65)-(19,67)) (LD 2.0)
Tuple (Just (20,27)-(20,36)) [Var (Just (20,28)-(20,29)) "e",Var (Just (20,31)-(20,32)) "x",Var (Just (20,34)-(20,35)) "y"]
Tuple (Just (20,47)-(20,56)) [Var (Just (20,48)-(20,49)) "e",Var (Just (20,51)-(20,52)) "x",Var (Just (20,54)-(20,55)) "y"]
Tuple (Just (22,15)-(22,24)) [Var (Just (22,16)-(22,17)) "e",Var (Just (22,19)-(22,20)) "x",Var (Just (22,22)-(22,23)) "y"]
Tuple (Just (22,34)-(22,43)) [Var (Just (22,35)-(22,36)) "e",Var (Just (22,38)-(22,39)) "x",Var (Just (22,41)-(22,42)) "y"]
Tuple (Just (23,16)-(23,25)) [Var (Just (23,17)-(23,18)) "e",Var (Just (23,20)-(23,21)) "x",Var (Just (23,23)-(23,24)) "y"]
Tuple (Just (24,16)-(24,25)) [Var (Just (24,17)-(24,18)) "e",Var (Just (24,20)-(24,21)) "x",Var (Just (24,23)-(24,24)) "y"]
*)

(* typed spans
(17,31)-(17,40)
(18,33)-(18,42)
(18,37)-(18,38)
(18,40)-(18,41)
(19,30)-(19,39)
(19,50)-(19,59)
(19,65)-(19,67)
(20,27)-(20,36)
(20,47)-(20,56)
(22,15)-(22,24)
(22,34)-(22,43)
(23,16)-(23,25)
(24,16)-(24,25)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
(expr * float * float)
(expr * float * float)
float
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
*)

(* bad types
expr
expr
float
float
expr
int
float
expr
expr
expr
expr
expr
expr
*)
