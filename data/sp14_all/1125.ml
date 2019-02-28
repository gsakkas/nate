
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
  | Sine e' -> sin (pi *. (eval e'))
  | Cosine e' -> cos (pi *. (eval e'))
  | Average (x',y') -> (x +. y) /. 2.0
  | Times (x',y') -> x *. y;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (x',y') -> (x +. y) /. 2.0
  | Times (x',y') -> x *. y;;

*)

(* changed spans
(15,32)-(15,34)
(e' , x , y)
TupleG (fromList [VarG])

(16,34)-(16,36)
(e' , x , y)
TupleG (fromList [VarG])

(17,23)-(17,38)
x
VarG

(17,23)-(17,38)
y
VarG

*)

(* changed exprs
Tuple (Just (15,32)-(15,42)) [Var (Just (15,33)-(15,35)) "e'",Var (Just (15,37)-(15,38)) "x",Var (Just (15,40)-(15,41)) "y"]
Tuple (Just (16,34)-(16,44)) [Var (Just (16,35)-(16,37)) "e'",Var (Just (16,39)-(16,40)) "x",Var (Just (16,42)-(16,43)) "y"]
Var (Just (16,39)-(16,40)) "x"
Var (Just (16,42)-(16,43)) "y"
*)

(* typed spans
(15,32)-(15,42)
(16,34)-(16,44)
(16,39)-(16,40)
(16,42)-(16,43)
*)

(* correct types
(expr * float * float)
(expr * float * float)
float
float
*)

(* bad types
expr
expr
float
float
*)
