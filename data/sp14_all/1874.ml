
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval e1) > (eval e2) then eval e3 else - (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (-1.0) *. (eval (e3, x, y));;

*)

(* changed spans
(31,15)-(31,17)
(e1 , x , y)
TupleG (fromList [VarG])

(31,27)-(31,29)
(e2 , x , y)
TupleG (fromList [VarG])

(31,36)-(31,43)
x
VarG

(31,36)-(31,43)
y
VarG

(31,41)-(31,43)
(e3 , x , y)
TupleG (fromList [VarG])

(31,49)-(31,60)
x
VarG

(31,49)-(31,60)
y
VarG

(31,49)-(31,60)
(- 1.0) *. eval (e3 , x , y)
BopG (UopG EmptyG) (AppG (fromList [EmptyG]))

(31,51)-(31,60)
1.0
LitG

(31,57)-(31,59)
(e3 , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (31,15)-(31,25)) [Var (Just (31,16)-(31,18)) "e1",Var (Just (31,20)-(31,21)) "x",Var (Just (31,23)-(31,24)) "y"]
Tuple (Just (31,35)-(31,45)) [Var (Just (31,36)-(31,38)) "e2",Var (Just (31,40)-(31,41)) "x",Var (Just (31,43)-(31,44)) "y"]
Var (Just (31,40)-(31,41)) "x"
Var (Just (31,43)-(31,44)) "y"
Tuple (Just (32,16)-(32,26)) [Var (Just (32,17)-(32,19)) "e3",Var (Just (32,21)-(32,22)) "x",Var (Just (32,24)-(32,25)) "y"]
Var (Just (32,21)-(32,22)) "x"
Var (Just (32,24)-(32,25)) "y"
Bop (Just (33,11)-(33,38)) FTimes (Uop (Just (33,11)-(33,17)) Neg (Lit (Just (33,13)-(33,16)) (LD 1.0))) (App (Just (33,21)-(33,38)) (Var (Just (33,22)-(33,26)) "eval") [Tuple (Just (33,27)-(33,37)) [Var (Just (33,28)-(33,30)) "e3",Var (Just (33,32)-(33,33)) "x",Var (Just (33,35)-(33,36)) "y"]])
Lit (Just (33,13)-(33,16)) (LD 1.0)
Tuple (Just (33,27)-(33,37)) [Var (Just (33,28)-(33,30)) "e3",Var (Just (33,32)-(33,33)) "x",Var (Just (33,35)-(33,36)) "y"]
*)

(* typed spans
(31,15)-(31,25)
(31,35)-(31,45)
(31,40)-(31,41)
(31,43)-(31,44)
(32,16)-(32,26)
(32,21)-(32,22)
(32,24)-(32,25)
(33,11)-(33,38)
(33,13)-(33,16)
(33,27)-(33,37)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
(expr * float * float)
float
float
float
float
(expr * float * float)
*)

(* bad types
expr
expr
int
int
expr
int
int
int
int
expr
*)
