
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Log of expr
  | SumOfSquares of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Log e1 -> let b = eval (e1, x, y) in if b > 1.0 then log b else 0.0
  | SumOfSquares (e1,e2,e3) ->
      (((eval (e1, x, y)) ** 2.0) + ((eval (e2, x, y)) ** 2.0)) +
        ((eval (e3, x, y)) ** 2.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Log of expr
  | SumOfSquares of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Log e1 -> let b = eval (e1, x, y) in if b > 1.0 then log b else 0.0
  | SumOfSquares (e1,e2,e3) ->
      (((eval (e1, x, y)) ** 2.0) +. ((eval (e2, x, y)) ** 2.0)) +.
        ((eval (e3, x, y)) ** 2.0);;

*)

(* changed spans
(29,6)-(30,34)
((eval (e1 , x , y) ** 2.0) +. (eval (e2 , x , y) ** 2.0)) +. (eval (e3 , x , y) ** 2.0)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,6)-(30,34)) FPlus (Bop (Just (29,6)-(29,64)) FPlus (App (Just (29,7)-(29,33)) (Var (Just (29,26)-(29,28)) "**") [App (Just (29,8)-(29,25)) (Var (Just (29,9)-(29,13)) "eval") [Tuple (Just (29,14)-(29,24)) [Var (Just (29,15)-(29,17)) "e1",Var (Just (29,19)-(29,20)) "x",Var (Just (29,22)-(29,23)) "y"]],Lit (Just (29,29)-(29,32)) (LD 2.0)]) (App (Just (29,37)-(29,63)) (Var (Just (29,56)-(29,58)) "**") [App (Just (29,38)-(29,55)) (Var (Just (29,39)-(29,43)) "eval") [Tuple (Just (29,44)-(29,54)) [Var (Just (29,45)-(29,47)) "e2",Var (Just (29,49)-(29,50)) "x",Var (Just (29,52)-(29,53)) "y"]],Lit (Just (29,59)-(29,62)) (LD 2.0)])) (App (Just (30,8)-(30,34)) (Var (Just (30,27)-(30,29)) "**") [App (Just (30,9)-(30,26)) (Var (Just (30,10)-(30,14)) "eval") [Tuple (Just (30,15)-(30,25)) [Var (Just (30,16)-(30,18)) "e3",Var (Just (30,20)-(30,21)) "x",Var (Just (30,23)-(30,24)) "y"]],Lit (Just (30,30)-(30,33)) (LD 2.0)])
*)

(* typed spans
(29,6)-(30,34)
*)

(* correct types
float
*)

(* bad types
int
*)
