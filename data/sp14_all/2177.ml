
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
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin eval (a, x, y)
  | Cosine a -> cos eval (a, x, y)
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,14)-(15,32)
sin (eval (a , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

(16,16)-(16,34)
cos (eval (a , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (15,14)-(15,34)) (Var (Just (15,14)-(15,17)) "sin") [App (Just (15,18)-(15,34)) (Var (Just (15,19)-(15,23)) "eval") [Tuple (Just (15,24)-(15,33)) [Var (Just (15,25)-(15,26)) "a",Var (Just (15,28)-(15,29)) "x",Var (Just (15,31)-(15,32)) "y"]]]
App (Just (16,16)-(16,36)) (Var (Just (16,16)-(16,19)) "cos") [App (Just (16,20)-(16,36)) (Var (Just (16,21)-(16,25)) "eval") [Tuple (Just (16,26)-(16,35)) [Var (Just (16,27)-(16,28)) "a",Var (Just (16,30)-(16,31)) "x",Var (Just (16,33)-(16,34)) "y"]]]
*)

(* typed spans
(15,14)-(15,34)
(16,16)-(16,36)
*)

(* correct types
float
float
*)

(* bad types
float
float
*)
