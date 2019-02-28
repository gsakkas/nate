
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval a in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval a in
      let bResult = eval b in if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval a in
      let bResult = eval b in
      let cResult = eval c in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0. else 1. /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;

*)

(* changed spans
(29,24)-(29,25)
(a , x , y)
TupleG (fromList [VarG])

(29,49)-(29,50)
0.0
LitG

(29,56)-(29,57)
1.0
LitG

(31,25)-(31,26)
(a , x , y)
TupleG (fromList [VarG])

(32,6)-(32,76)
x
VarG

(32,6)-(32,76)
y
VarG

(32,25)-(32,26)
(b , x , y)
TupleG (fromList [VarG])

(32,30)-(32,76)
x
VarG

(32,30)-(32,76)
y
VarG

(34,25)-(34,26)
(a , x , y)
TupleG (fromList [VarG])

(35,6)-(39,57)
x
VarG

(35,6)-(39,57)
y
VarG

(35,25)-(35,26)
(b , x , y)
TupleG (fromList [VarG])

(36,6)-(39,57)
x
VarG

(36,6)-(39,57)
y
VarG

(36,25)-(36,26)
(c , x , y)
TupleG (fromList [VarG])

(37,6)-(39,57)
x
VarG

(37,6)-(39,57)
y
VarG

*)

(* changed exprs
Tuple (Just (29,24)-(29,33)) [Var (Just (29,25)-(29,26)) "a",Var (Just (29,28)-(29,29)) "x",Var (Just (29,31)-(29,32)) "y"]
Lit (Just (29,57)-(29,59)) (LD 0.0)
Lit (Just (29,65)-(29,67)) (LD 1.0)
Tuple (Just (31,25)-(31,34)) [Var (Just (31,26)-(31,27)) "a",Var (Just (31,29)-(31,30)) "x",Var (Just (31,32)-(31,33)) "y"]
Var (Just (31,29)-(31,30)) "x"
Var (Just (31,32)-(31,33)) "y"
Tuple (Just (32,25)-(32,34)) [Var (Just (32,26)-(32,27)) "b",Var (Just (32,29)-(32,30)) "x",Var (Just (32,32)-(32,33)) "y"]
Var (Just (32,29)-(32,30)) "x"
Var (Just (32,32)-(32,33)) "y"
Tuple (Just (35,25)-(35,34)) [Var (Just (35,26)-(35,27)) "a",Var (Just (35,29)-(35,30)) "x",Var (Just (35,32)-(35,33)) "y"]
Var (Just (35,29)-(35,30)) "x"
Var (Just (35,32)-(35,33)) "y"
Tuple (Just (36,25)-(36,34)) [Var (Just (36,26)-(36,27)) "b",Var (Just (36,29)-(36,30)) "x",Var (Just (36,32)-(36,33)) "y"]
Var (Just (36,29)-(36,30)) "x"
Var (Just (36,32)-(36,33)) "y"
Tuple (Just (37,25)-(37,34)) [Var (Just (37,26)-(37,27)) "c",Var (Just (37,29)-(37,30)) "x",Var (Just (37,32)-(37,33)) "y"]
Var (Just (37,29)-(37,30)) "x"
Var (Just (37,32)-(37,33)) "y"
*)

(* typed spans
(29,24)-(29,33)
(29,57)-(29,59)
(29,65)-(29,67)
(31,25)-(31,34)
(31,29)-(31,30)
(31,32)-(31,33)
(32,25)-(32,34)
(32,29)-(32,30)
(32,32)-(32,33)
(35,25)-(35,34)
(35,29)-(35,30)
(35,32)-(35,33)
(36,25)-(36,34)
(36,29)-(36,30)
(36,32)-(36,33)
(37,25)-(37,34)
(37,29)-(37,30)
(37,32)-(37,33)
*)

(* correct types
(expr * float * float)
float
float
(expr * float * float)
float
float
(expr * float * float)
float
float
(expr * float * float)
float
float
(expr * float * float)
float
float
(expr * float * float)
float
float
*)

(* bad types
expr
int
int
expr
float
float
expr
float
float
expr
float
float
expr
float
float
expr
float
float
*)
