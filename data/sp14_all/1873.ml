
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
  | Crazy (e1,e2,e3) -> if e1 > e2 then e3 else - e3;;


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
(30,27)-(30,29)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,32)-(30,34)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,40)-(30,42)
x
VarG

(30,40)-(30,42)
y
VarG

(30,40)-(30,42)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,48)-(30,52)
x
VarG

(30,48)-(30,52)
y
VarG

(30,48)-(30,52)
(- 1.0) *. eval (e3 , x , y)
BopG (UopG EmptyG) (AppG (fromList [EmptyG]))

(30,50)-(30,52)
1.0
LitG

(30,50)-(30,52)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (31,9)-(31,26)) (Var (Just (31,10)-(31,14)) "eval") [Tuple (Just (31,15)-(31,25)) [Var (Just (31,16)-(31,18)) "e1",Var (Just (31,20)-(31,21)) "x",Var (Just (31,23)-(31,24)) "y"]]
App (Just (31,29)-(31,46)) (Var (Just (31,30)-(31,34)) "eval") [Tuple (Just (31,35)-(31,45)) [Var (Just (31,36)-(31,38)) "e2",Var (Just (31,40)-(31,41)) "x",Var (Just (31,43)-(31,44)) "y"]]
Var (Just (31,40)-(31,41)) "x"
Var (Just (31,43)-(31,44)) "y"
App (Just (32,11)-(32,26)) (Var (Just (32,11)-(32,15)) "eval") [Tuple (Just (32,16)-(32,26)) [Var (Just (32,17)-(32,19)) "e3",Var (Just (32,21)-(32,22)) "x",Var (Just (32,24)-(32,25)) "y"]]
Var (Just (32,21)-(32,22)) "x"
Var (Just (32,24)-(32,25)) "y"
Bop (Just (33,11)-(33,38)) FTimes (Uop (Just (33,11)-(33,17)) Neg (Lit (Just (33,13)-(33,16)) (LD 1.0))) (App (Just (33,21)-(33,38)) (Var (Just (33,22)-(33,26)) "eval") [Tuple (Just (33,27)-(33,37)) [Var (Just (33,28)-(33,30)) "e3",Var (Just (33,32)-(33,33)) "x",Var (Just (33,35)-(33,36)) "y"]])
Lit (Just (33,13)-(33,16)) (LD 1.0)
App (Just (33,21)-(33,38)) (Var (Just (33,22)-(33,26)) "eval") [Tuple (Just (33,27)-(33,37)) [Var (Just (33,28)-(33,30)) "e3",Var (Just (33,32)-(33,33)) "x",Var (Just (33,35)-(33,36)) "y"]]
*)

(* typed spans
(31,9)-(31,26)
(31,29)-(31,46)
(31,40)-(31,41)
(31,43)-(31,44)
(32,11)-(32,26)
(32,21)-(32,22)
(32,24)-(32,25)
(33,11)-(33,38)
(33,13)-(33,16)
(33,21)-(33,38)
*)

(* correct types
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
expr
expr
expr
int
int
int
expr
expr
*)
