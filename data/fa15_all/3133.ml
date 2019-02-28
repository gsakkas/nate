
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

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
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 / (eval (e, x, y)) else 1 / 3
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) / 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

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
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 /. 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) /. 3.0;;

*)

(* changed spans
(28,37)-(28,59)
1.0 /. eval (e , x , y)
BopG LitG (AppG (fromList [EmptyG]))

(28,65)-(28,70)
1.0 /. 3.0
BopG LitG LitG

(35,11)-(35,23)
(- 1.0) /. 3.0
BopG (UopG EmptyG) LitG

*)

(* changed exprs
Bop (Just (28,37)-(28,60)) FDiv (Lit (Just (28,37)-(28,40)) (LD 1.0)) (App (Just (28,44)-(28,60)) (Var (Just (28,45)-(28,49)) "eval") [Tuple (Just (28,50)-(28,59)) [Var (Just (28,51)-(28,52)) "e",Var (Just (28,54)-(28,55)) "x",Var (Just (28,57)-(28,58)) "y"]])
Bop (Just (28,66)-(28,76)) FDiv (Lit (Just (28,66)-(28,69)) (LD 1.0)) (Lit (Just (28,73)-(28,76)) (LD 3.0))
Bop (Just (35,11)-(35,24)) FDiv (Uop (Just (35,11)-(35,17)) Neg (Lit (Just (35,13)-(35,16)) (LD 1.0))) (Lit (Just (35,21)-(35,24)) (LD 3.0))
*)

(* typed spans
(28,37)-(28,60)
(28,66)-(28,76)
(35,11)-(35,24)
*)

(* correct types
float
float
float
*)

(* bad types
int
int
int
*)
