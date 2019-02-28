
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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) *. 0.5
  | Times (a,b) -> (eval (a, x, y)) /. (eval (b, x, y))
  | Thresh (a,b,a_less,b_less) ->
      let x1 = eval (a, x, y) in
      let x2 = eval (b, x, y) in
      if x1 < x2 then ((eval a_less), x, y) else ((eval b_less), x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) *. 0.5
  | Times (a,b) -> (eval (a, x, y)) /. (eval (b, x, y))
  | Thresh (a,b,a_less,b_less) ->
      let x1 = eval (a, x, y) in
      let x2 = eval (b, x, y) in
      if x1 < x2 then eval (a_less, x, y) else eval (b_less, x, y);;

*)

(* changed spans
(24,22)-(24,43)
eval (a_less , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,49)-(24,70)
eval (b_less , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,49)-(24,70)
eval
VarG

(24,49)-(24,70)
(b_less , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
App (Just (24,22)-(24,41)) (Var (Just (24,22)-(24,26)) "eval") [Tuple (Just (24,27)-(24,41)) [Var (Just (24,28)-(24,34)) "a_less",Var (Just (24,36)-(24,37)) "x",Var (Just (24,39)-(24,40)) "y"]]
App (Just (24,47)-(24,66)) (Var (Just (24,47)-(24,51)) "eval") [Tuple (Just (24,52)-(24,66)) [Var (Just (24,53)-(24,59)) "b_less",Var (Just (24,61)-(24,62)) "x",Var (Just (24,64)-(24,65)) "y"]]
Var (Just (24,47)-(24,51)) "eval"
Tuple (Just (24,52)-(24,66)) [Var (Just (24,53)-(24,59)) "b_less",Var (Just (24,61)-(24,62)) "x",Var (Just (24,64)-(24,65)) "y"]
*)

(* typed spans
(24,22)-(24,41)
(24,47)-(24,66)
(24,47)-(24,51)
(24,52)-(24,66)
*)

(* correct types
float
float
(expr * float * float) -> float
(expr * float * float)
*)

(* bad types
('a * float * float)
('a * float * float)
('a * float * float)
('a * float * float)
*)
