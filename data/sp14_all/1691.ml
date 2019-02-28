
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Plus (v,w) -> (eval (v, x, y)) +. (eval (w, x, y))
  | Cube (a,b,c) -> ((eval a) *. (eval b)) *. (eval c)
  | VarX  -> x
  | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Plus (v,w) -> (eval (v, x, y)) +. (eval (w, x, y))
  | Cube (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(26,27)-(26,28)
(a , x , y)
TupleG (fromList [VarG])

(26,39)-(26,40)
(b , x , y)
TupleG (fromList [VarG])

(26,46)-(26,54)
x
VarG

(26,46)-(26,54)
y
VarG

(26,52)-(26,53)
(c , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (27,13)-(27,22)) [Var (Just (27,14)-(27,15)) "a",Var (Just (27,17)-(27,18)) "x",Var (Just (27,20)-(27,21)) "y"]
Tuple (Just (27,33)-(27,42)) [Var (Just (27,34)-(27,35)) "b",Var (Just (27,37)-(27,38)) "x",Var (Just (27,40)-(27,41)) "y"]
Var (Just (27,37)-(27,38)) "x"
Var (Just (27,40)-(27,41)) "y"
Tuple (Just (27,54)-(27,63)) [Var (Just (27,55)-(27,56)) "c",Var (Just (27,58)-(27,59)) "x",Var (Just (27,61)-(27,62)) "y"]
*)

(* typed spans
(27,13)-(27,22)
(27,33)-(27,42)
(27,37)-(27,38)
(27,40)-(27,41)
(27,54)-(27,63)
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
