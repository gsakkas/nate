
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
  | Sine ex -> sin (pi *. (eval (ex x y)));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)));;

*)

(* changed spans
(17,32)-(17,40)
(ex , x , y)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "ex",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]
*)

(* typed spans
(17,32)-(17,42)
*)

(* correct types
(expr * float * float)
*)

(* bad types
(expr * float * float)
*)
