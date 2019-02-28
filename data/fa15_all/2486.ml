
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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2
  | Times (e1,e2) -> (eval e1) *. (eval e2);;


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
  | VarY  -> x
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(19,30)-(19,32)
(e1 , x , y)
TupleG (fromList [VarG])

(19,43)-(19,45)
(e2 , x , y)
TupleG (fromList [VarG])

(19,51)-(19,52)
x
VarG

(20,21)-(20,43)
y
VarG

(20,21)-(20,43)
2.0
LitG

(20,27)-(20,29)
(e1 , x , y)
TupleG (fromList [VarG])

(20,34)-(20,43)
x
VarG

(20,34)-(20,43)
y
VarG

(20,40)-(20,42)
(e2 , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]
Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]
Var (Just (19,56)-(19,57)) "x"
Var (Just (19,59)-(19,60)) "y"
Lit (Just (19,67)-(19,70)) (LD 2.0)
Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]
Var (Just (20,32)-(20,33)) "x"
Var (Just (20,35)-(20,36)) "y"
Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]
*)

(* typed spans
(19,30)-(19,40)
(19,51)-(19,61)
(19,56)-(19,57)
(19,59)-(19,60)
(19,67)-(19,70)
(20,27)-(20,37)
(20,32)-(20,33)
(20,35)-(20,36)
(20,48)-(20,58)
*)

(* correct types
(expr * float * 'a)
(expr * float * 'a)
float
'a
float
(expr * float * 'a)
float
'a
(expr * float * 'a)
*)

(* bad types
expr
expr
int
float
float
expr
float
float
expr
*)
