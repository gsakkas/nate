
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) -> 1.0 /. (((eval e1) +. (eval e2)) +. (eval e3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)))
  | Op2 (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;

*)

(* changed spans
(28,37)-(28,39)
(e1 , x , y)
TupleG (fromList [VarG])

(28,50)-(28,52)
(e2 , x , y)
TupleG (fromList [VarG])

(28,58)-(28,67)
x
VarG

(28,58)-(28,67)
y
VarG

(28,64)-(28,66)
(e3 , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (29,21)-(29,31)) [Var (Just (29,22)-(29,24)) "e1",Var (Just (29,26)-(29,27)) "x",Var (Just (29,29)-(29,30)) "y"]
Tuple (Just (29,42)-(29,52)) [Var (Just (29,43)-(29,45)) "e2",Var (Just (29,47)-(29,48)) "x",Var (Just (29,50)-(29,51)) "y"]
Var (Just (29,47)-(29,48)) "x"
Var (Just (29,50)-(29,51)) "y"
Tuple (Just (29,64)-(29,74)) [Var (Just (29,65)-(29,67)) "e3",Var (Just (29,69)-(29,70)) "x",Var (Just (29,72)-(29,73)) "y"]
*)

(* typed spans
(29,21)-(29,31)
(29,42)-(29,52)
(29,47)-(29,48)
(29,50)-(29,51)
(29,64)-(29,74)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
(expr * float * float)
*)

(* bad types
expr
expr
float
float
expr
*)
