
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin s1
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;


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
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,19)-(15,21)
eval (s1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (15,19)-(15,36)) (Var (Just (15,20)-(15,24)) "eval") [Tuple (Just (15,25)-(15,35)) [Var (Just (15,26)-(15,28)) "s1",Var (Just (15,30)-(15,31)) "x",Var (Just (15,33)-(15,34)) "y"]]
*)

(* typed spans
(15,19)-(15,36)
*)

(* correct types
float
*)

(* bad types
expr
*)
