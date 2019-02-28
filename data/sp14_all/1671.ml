
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin ((eval e1), x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(12,58)-(12,75)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,58)-(12,75)) (Var (Just (12,59)-(12,63)) "eval") [Tuple (Just (12,64)-(12,74)) [Var (Just (12,65)-(12,67)) "e1",Var (Just (12,69)-(12,70)) "x",Var (Just (12,72)-(12,73)) "y"]]
*)

(* typed spans
(12,58)-(12,75)
*)

(* correct types
float
*)

(* bad types
('a * 'b * 'b)
*)
