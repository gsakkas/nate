
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2) *. (eval (e2, x, y))) /. 3) *.
         (eval (e3, x, y)))
        /. 4
  | Creative e1 -> (-1) *. (eval e1);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2.0) *. (eval (e2, x, y))) /. 3.0) *.
         (eval (e3, x, y)))
        /. 4.0
  | Creative e1 -> (-1.0) *. (eval (e1, x, y));;

*)

(* changed spans
(28,31)-(28,32)
2.0
LitG

(28,59)-(28,60)
3.0
LitG

(30,11)-(30,12)
4.0
LitG

(31,19)-(31,23)
(- 1.0)
UopG LitG

(31,33)-(31,35)
(e1 , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Lit (Just (28,31)-(28,34)) (LD 2.0)
Lit (Just (28,61)-(28,64)) (LD 3.0)
Lit (Just (30,11)-(30,14)) (LD 4.0)
Uop (Just (31,19)-(31,25)) Neg (Lit (Just (31,21)-(31,24)) (LD 1.0))
Tuple (Just (31,35)-(31,45)) [Var (Just (31,36)-(31,38)) "e1",Var (Just (31,40)-(31,41)) "x",Var (Just (31,43)-(31,44)) "y"]
*)

(* typed spans
(28,31)-(28,34)
(28,61)-(28,64)
(30,11)-(30,14)
(31,19)-(31,25)
(31,35)-(31,45)
*)

(* correct types
float
float
float
int
(expr * float * float)
*)

(* bad types
int
int
int
int
expr
*)
