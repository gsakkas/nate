
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Root of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> eval (e ** 2)
  | Root e -> eval (e ** (1 / 2));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Root of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Squared e -> (eval (e, x, y)) ** 2.
  | Root e -> (eval (e, x, y)) ** 0.5;;

*)

(* changed spans
(27,17)-(27,30)
eval (e , x , y) ** 2.0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(28,22)-(28,24)
eval (e , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,25)-(28,32)
x
VarG

(28,30)-(28,31)
y
VarG

(28,30)-(28,31)
0.5
LitG

*)

(* changed exprs
App (Just (27,17)-(27,39)) (Var (Just (27,34)-(27,36)) "**") [App (Just (27,17)-(27,33)) (Var (Just (27,18)-(27,22)) "eval") [Tuple (Just (27,23)-(27,32)) [Var (Just (27,24)-(27,25)) "e",Var (Just (27,27)-(27,28)) "x",Var (Just (27,30)-(27,31)) "y"]],Lit (Just (27,37)-(27,39)) (LD 2.0)]
App (Just (28,14)-(28,30)) (Var (Just (28,15)-(28,19)) "eval") [Tuple (Just (28,20)-(28,29)) [Var (Just (28,21)-(28,22)) "e",Var (Just (28,24)-(28,25)) "x",Var (Just (28,27)-(28,28)) "y"]]
Var (Just (28,24)-(28,25)) "x"
Var (Just (28,27)-(28,28)) "y"
Lit (Just (28,34)-(28,37)) (LD 0.5)
*)

(* typed spans
(27,17)-(27,39)
(28,14)-(28,30)
(28,24)-(28,25)
(28,27)-(28,28)
(28,34)-(28,37)
*)

(* correct types
float
float
float
float
float
*)

(* bad types
float
float -> float -> float
int
int
int
*)
