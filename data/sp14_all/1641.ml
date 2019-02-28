
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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;


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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y);;

*)

(* changed spans
(21,33)-(21,34)
(s , x , y)
TupleG (fromList [VarG])

(21,44)-(21,45)
(t , x , y)
TupleG (fromList [VarG])

(21,52)-(21,58)
x
VarG

(21,52)-(21,58)
y
VarG

(21,57)-(21,58)
(u , x , y)
TupleG (fromList [VarG])

(21,64)-(21,70)
x
VarG

(21,64)-(21,70)
y
VarG

(21,69)-(21,70)
(v , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (22,15)-(22,24)) [Var (Just (22,16)-(22,17)) "s",Var (Just (22,19)-(22,20)) "x",Var (Just (22,22)-(22,23)) "y"]
Tuple (Just (22,34)-(22,43)) [Var (Just (22,35)-(22,36)) "t",Var (Just (22,38)-(22,39)) "x",Var (Just (22,41)-(22,42)) "y"]
Var (Just (22,38)-(22,39)) "x"
Var (Just (22,41)-(22,42)) "y"
Tuple (Just (23,16)-(23,25)) [Var (Just (23,17)-(23,18)) "u",Var (Just (23,20)-(23,21)) "x",Var (Just (23,23)-(23,24)) "y"]
Var (Just (23,20)-(23,21)) "x"
Var (Just (23,23)-(23,24)) "y"
Tuple (Just (24,16)-(24,25)) [Var (Just (24,17)-(24,18)) "v",Var (Just (24,20)-(24,21)) "x",Var (Just (24,23)-(24,24)) "y"]
*)

(* typed spans
(22,15)-(22,24)
(22,34)-(22,43)
(22,38)-(22,39)
(22,41)-(22,42)
(23,16)-(23,25)
(23,20)-(23,21)
(23,23)-(23,24)
(24,16)-(24,25)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
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
float
float
expr
*)
