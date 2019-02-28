
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr;;

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
  | Op1 e1 -> (eval (e1, x, y)) / ((eval (e1, x, y)) *. (eval (e1, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr;;

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
  | Op1 e1 -> (eval (e1, x, y)) /. ((eval (e1, x, y)) *. (eval (e1, x, y)));;

*)

(* changed spans
(26,14)-(26,74)
eval (e1 , x , y) /. (eval (e1 , x , y) *. eval (e1 , x , y))
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (26,14)-(26,75)) FDiv (App (Just (26,14)-(26,31)) (Var (Just (26,15)-(26,19)) "eval") [Tuple (Just (26,20)-(26,30)) [Var (Just (26,21)-(26,23)) "e1",Var (Just (26,25)-(26,26)) "x",Var (Just (26,28)-(26,29)) "y"]]) (Bop (Just (26,35)-(26,75)) FTimes (App (Just (26,36)-(26,53)) (Var (Just (26,37)-(26,41)) "eval") [Tuple (Just (26,42)-(26,52)) [Var (Just (26,43)-(26,45)) "e1",Var (Just (26,47)-(26,48)) "x",Var (Just (26,50)-(26,51)) "y"]]) (App (Just (26,57)-(26,74)) (Var (Just (26,58)-(26,62)) "eval") [Tuple (Just (26,63)-(26,73)) [Var (Just (26,64)-(26,66)) "e1",Var (Just (26,68)-(26,69)) "x",Var (Just (26,71)-(26,72)) "y"]]))
*)

(* typed spans
(26,14)-(26,75)
*)

(* correct types
float
*)

(* bad types
int
*)
