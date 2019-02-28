
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1 /. (((eval (e1, x, y)) - (eval (e2, x, y))) - (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) -. (eval (e2, x, y))) -. (eval (e3, x, y)));;

*)

(* changed spans
(29,11)-(29,72)
1.0
LitG

(29,13)-(29,30)
(eval (e1 , x , y) -. eval (e2 , x , y)) -. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lit (Just (29,6)-(29,9)) (LD 1.0)
Bop (Just (29,13)-(29,76)) FMinus (Bop (Just (29,14)-(29,54)) FMinus (App (Just (29,15)-(29,32)) (Var (Just (29,16)-(29,20)) "eval") [Tuple (Just (29,21)-(29,31)) [Var (Just (29,22)-(29,24)) "e1",Var (Just (29,26)-(29,27)) "x",Var (Just (29,29)-(29,30)) "y"]]) (App (Just (29,36)-(29,53)) (Var (Just (29,37)-(29,41)) "eval") [Tuple (Just (29,42)-(29,52)) [Var (Just (29,43)-(29,45)) "e2",Var (Just (29,47)-(29,48)) "x",Var (Just (29,50)-(29,51)) "y"]])) (App (Just (29,58)-(29,75)) (Var (Just (29,59)-(29,63)) "eval") [Tuple (Just (29,64)-(29,74)) [Var (Just (29,65)-(29,67)) "e3",Var (Just (29,69)-(29,70)) "x",Var (Just (29,72)-(29,73)) "y"]])
*)

(* typed spans
(29,6)-(29,9)
(29,13)-(29,76)
*)

(* correct types
float
float
*)

(* bad types
int
float
*)
