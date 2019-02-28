
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
  | Sine e' -> sin (pi *. (eval e' x y))
  | Cosine e' -> cos (pi *. (eval e' x y))
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) /. 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a x y)) < (eval (b x y))
      then eval (a_less x y)
      else eval (b_less x y);;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(17,26)-(17,39)
eval (e' , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,28)-(18,41)
eval (e' , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,24)-(19,37)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,41)-(19,54)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,59)-(19,60)
2.0
LitG

(20,21)-(20,34)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,38)-(20,51)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,15)-(22,22)
(a , x , y)
TupleG (fromList [VarG])

(22,32)-(22,39)
(b , x , y)
TupleG (fromList [VarG])

(23,16)-(23,28)
(a_less , x , y)
TupleG (fromList [VarG])

(24,16)-(24,28)
(b_less , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
App (Just (17,26)-(17,43)) (Var (Just (17,27)-(17,31)) "eval") [Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "e'",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]]
App (Just (18,28)-(18,45)) (Var (Just (18,29)-(18,33)) "eval") [Tuple (Just (18,34)-(18,44)) [Var (Just (18,35)-(18,37)) "e'",Var (Just (18,39)-(18,40)) "x",Var (Just (18,42)-(18,43)) "y"]]
App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]
App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]]
Lit (Just (19,67)-(19,70)) (LD 2.0)
App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]
App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]]
Tuple (Just (22,15)-(22,24)) [Var (Just (22,16)-(22,17)) "a",Var (Just (22,19)-(22,20)) "x",Var (Just (22,22)-(22,23)) "y"]
Tuple (Just (22,34)-(22,43)) [Var (Just (22,35)-(22,36)) "b",Var (Just (22,38)-(22,39)) "x",Var (Just (22,41)-(22,42)) "y"]
Tuple (Just (23,16)-(23,30)) [Var (Just (23,17)-(23,23)) "a_less",Var (Just (23,25)-(23,26)) "x",Var (Just (23,28)-(23,29)) "y"]
Tuple (Just (24,16)-(24,30)) [Var (Just (24,17)-(24,23)) "b_less",Var (Just (24,25)-(24,26)) "x",Var (Just (24,28)-(24,29)) "y"]
*)

(* typed spans
(17,26)-(17,43)
(18,28)-(18,45)
(19,24)-(19,41)
(19,45)-(19,62)
(19,67)-(19,70)
(20,21)-(20,38)
(20,42)-(20,59)
(22,15)-(22,24)
(22,34)-(22,43)
(23,16)-(23,30)
(24,16)-(24,30)
*)

(* correct types
float
float
float
float
float
float
float
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
*)

(* bad types
float
float
float
float
int
float
float
expr
expr
expr
expr
*)
