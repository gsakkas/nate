
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
Tuple (Just (22,15)-(22,24)) [Var (Just (22,16)-(22,17)) "a",Var (Just (22,19)-(22,20)) "x",Var (Just (22,22)-(22,23)) "y"]
Tuple (Just (22,34)-(22,43)) [Var (Just (22,35)-(22,36)) "b",Var (Just (22,38)-(22,39)) "x",Var (Just (22,41)-(22,42)) "y"]
Tuple (Just (23,16)-(23,30)) [Var (Just (23,17)-(23,23)) "a_less",Var (Just (23,25)-(23,26)) "x",Var (Just (23,28)-(23,29)) "y"]
Tuple (Just (24,16)-(24,30)) [Var (Just (24,17)-(24,23)) "b_less",Var (Just (24,25)-(24,26)) "x",Var (Just (24,28)-(24,29)) "y"]
*)

(* typed spans
(22,15)-(22,24)
(22,34)-(22,43)
(23,16)-(23,30)
(24,16)-(24,30)
*)

(* correct types
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
*)

(* bad types
(expr * float * float)
(expr * float * float)
(expr * float * float)
(expr * float * float)
*)
