
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
  | OneOver e -> if (eval (e, x, y)) > 1 then 1 / (eval (e, x, y)) else 1 / 3
  | OneOverAvg (e1,e2,e3) ->
      if (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y))) > 1
      then 1 / (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y)))
      else (-1) / 3;;


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
(27,46)-(27,66)
1.0
LitG

(27,50)-(27,66)
1.0 /. eval (e , x , y)
BopG LitG (AppG (fromList [EmptyG]))

(27,72)-(27,77)
1.0 /. 3.0
BopG LitG LitG

(29,9)-(29,70)
(eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(30,11)-(30,76)
1.0
LitG

(30,17)-(30,34)
1.0 /. ((eval (e1 , x , y) +. eval (e2 , x , y)) +. eval (e3 , x , y))
BopG LitG (BopG EmptyG EmptyG)

(31,11)-(31,19)
(- 1.0) /. 3.0
BopG (UopG EmptyG) LitG

*)

(* changed exprs
Lit (Just (28,28)-(28,31)) (LD 1.0)
Bop (Just (28,37)-(28,60)) FDiv (Lit (Just (28,37)-(28,40)) (LD 1.0)) (App (Just (28,44)-(28,60)) (Var (Just (28,45)-(28,49)) "eval") [Tuple (Just (28,50)-(28,59)) [Var (Just (28,51)-(28,52)) "e",Var (Just (28,54)-(28,55)) "x",Var (Just (28,57)-(28,58)) "y"]])
Bop (Just (28,66)-(28,76)) FDiv (Lit (Just (28,66)-(28,69)) (LD 1.0)) (Lit (Just (28,73)-(28,76)) (LD 3.0))
Bop (Just (31,8)-(31,71)) FPlus (Bop (Just (31,9)-(31,49)) FPlus (App (Just (31,10)-(31,27)) (Var (Just (31,11)-(31,15)) "eval") [Tuple (Just (31,16)-(31,26)) [Var (Just (31,17)-(31,19)) "e1",Var (Just (31,21)-(31,22)) "x",Var (Just (31,24)-(31,25)) "y"]]) (App (Just (31,31)-(31,48)) (Var (Just (31,32)-(31,36)) "eval") [Tuple (Just (31,37)-(31,47)) [Var (Just (31,38)-(31,40)) "e2",Var (Just (31,42)-(31,43)) "x",Var (Just (31,45)-(31,46)) "y"]])) (App (Just (31,53)-(31,70)) (Var (Just (31,54)-(31,58)) "eval") [Tuple (Just (31,59)-(31,69)) [Var (Just (31,60)-(31,62)) "e3",Var (Just (31,64)-(31,65)) "x",Var (Just (31,67)-(31,68)) "y"]])
Lit (Just (31,74)-(31,77)) (LD 1.0)
Bop (Just (33,8)-(34,73)) FDiv (Lit (Just (33,8)-(33,11)) (LD 1.0)) (Bop (Just (34,10)-(34,73)) FPlus (Bop (Just (34,11)-(34,51)) FPlus (App (Just (34,12)-(34,29)) (Var (Just (34,13)-(34,17)) "eval") [Tuple (Just (34,18)-(34,28)) [Var (Just (34,19)-(34,21)) "e1",Var (Just (34,23)-(34,24)) "x",Var (Just (34,26)-(34,27)) "y"]]) (App (Just (34,33)-(34,50)) (Var (Just (34,34)-(34,38)) "eval") [Tuple (Just (34,39)-(34,49)) [Var (Just (34,40)-(34,42)) "e2",Var (Just (34,44)-(34,45)) "x",Var (Just (34,47)-(34,48)) "y"]])) (App (Just (34,55)-(34,72)) (Var (Just (34,56)-(34,60)) "eval") [Tuple (Just (34,61)-(34,71)) [Var (Just (34,62)-(34,64)) "e3",Var (Just (34,66)-(34,67)) "x",Var (Just (34,69)-(34,70)) "y"]]))
Bop (Just (35,11)-(35,24)) FDiv (Uop (Just (35,11)-(35,17)) Neg (Lit (Just (35,13)-(35,16)) (LD 1.0))) (Lit (Just (35,21)-(35,24)) (LD 3.0))
*)

(* typed spans
(28,28)-(28,31)
(28,37)-(28,60)
(28,66)-(28,76)
(31,8)-(31,71)
(31,74)-(31,77)
(33,8)-(34,73)
(35,11)-(35,24)
*)

(* correct types
float
float
float
float
float
float
float
*)

(* bad types
int
float
int
int
int
float
int
*)
