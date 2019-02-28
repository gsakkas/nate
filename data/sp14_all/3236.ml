
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval ex1) *. ((eval ex1) + (eval ex2))) *
          (((eval ex1) + (eval ex2)) + (eval ex3)))
         * ((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)))
        *
        (((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)) + (eval ex5));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval (ex1, x, y)) *. ((eval (ex1, x, y)) +. (eval (ex2, x, y)))) *.
          (((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y))))
         *.
         ((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y))))
        *.
        (((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y)))
           +. (eval (ex5, x, y)));;

*)

(* changed spans
(28,6)-(32,78)
(((eval (ex1 , x , y) *. (eval (ex1 , x , y) +. eval (ex2 , x , y))) *. ((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y))) *. (((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y))) *. ((((eval (ex1 , x , y) +. eval (ex2 , x , y)) +. eval (ex3 , x , y)) +. eval (ex4 , x , y)) +. eval (ex5 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (28,6)-(36,33)) FTimes (Bop (Just (28,6)-(32,35)) FTimes (Bop (Just (28,7)-(29,77)) FTimes (Bop (Just (28,8)-(28,74)) FTimes (App (Just (28,9)-(28,27)) (Var (Just (28,10)-(28,14)) "eval") [Tuple (Just (28,15)-(28,26)) [Var (Just (28,16)-(28,19)) "ex1",Var (Just (28,21)-(28,22)) "x",Var (Just (28,24)-(28,25)) "y"]]) (Bop (Just (28,31)-(28,73)) FPlus (App (Just (28,32)-(28,50)) (Var (Just (28,33)-(28,37)) "eval") [Tuple (Just (28,38)-(28,49)) [Var (Just (28,39)-(28,42)) "ex1",Var (Just (28,44)-(28,45)) "x",Var (Just (28,47)-(28,48)) "y"]]) (App (Just (28,54)-(28,72)) (Var (Just (28,55)-(28,59)) "eval") [Tuple (Just (28,60)-(28,71)) [Var (Just (28,61)-(28,64)) "ex2",Var (Just (28,66)-(28,67)) "x",Var (Just (28,69)-(28,70)) "y"]]))) (Bop (Just (29,10)-(29,76)) FPlus (Bop (Just (29,11)-(29,53)) FPlus (App (Just (29,12)-(29,30)) (Var (Just (29,13)-(29,17)) "eval") [Tuple (Just (29,18)-(29,29)) [Var (Just (29,19)-(29,22)) "ex1",Var (Just (29,24)-(29,25)) "x",Var (Just (29,27)-(29,28)) "y"]]) (App (Just (29,34)-(29,52)) (Var (Just (29,35)-(29,39)) "eval") [Tuple (Just (29,40)-(29,51)) [Var (Just (29,41)-(29,44)) "ex2",Var (Just (29,46)-(29,47)) "x",Var (Just (29,49)-(29,50)) "y"]])) (App (Just (29,57)-(29,75)) (Var (Just (29,58)-(29,62)) "eval") [Tuple (Just (29,63)-(29,74)) [Var (Just (29,64)-(29,67)) "ex3",Var (Just (29,69)-(29,70)) "x",Var (Just (29,72)-(29,73)) "y"]]))) (Bop (Just (31,9)-(32,34)) FPlus (Bop (Just (31,10)-(31,76)) FPlus (Bop (Just (31,11)-(31,53)) FPlus (App (Just (31,12)-(31,30)) (Var (Just (31,13)-(31,17)) "eval") [Tuple (Just (31,18)-(31,29)) [Var (Just (31,19)-(31,22)) "ex1",Var (Just (31,24)-(31,25)) "x",Var (Just (31,27)-(31,28)) "y"]]) (App (Just (31,34)-(31,52)) (Var (Just (31,35)-(31,39)) "eval") [Tuple (Just (31,40)-(31,51)) [Var (Just (31,41)-(31,44)) "ex2",Var (Just (31,46)-(31,47)) "x",Var (Just (31,49)-(31,50)) "y"]])) (App (Just (31,57)-(31,75)) (Var (Just (31,58)-(31,62)) "eval") [Tuple (Just (31,63)-(31,74)) [Var (Just (31,64)-(31,67)) "ex3",Var (Just (31,69)-(31,70)) "x",Var (Just (31,72)-(31,73)) "y"]])) (App (Just (32,15)-(32,33)) (Var (Just (32,16)-(32,20)) "eval") [Tuple (Just (32,21)-(32,32)) [Var (Just (32,22)-(32,25)) "ex4",Var (Just (32,27)-(32,28)) "x",Var (Just (32,30)-(32,31)) "y"]]))) (Bop (Just (34,8)-(36,33)) FPlus (Bop (Just (34,9)-(35,34)) FPlus (Bop (Just (34,10)-(34,76)) FPlus (Bop (Just (34,11)-(34,53)) FPlus (App (Just (34,12)-(34,30)) (Var (Just (34,13)-(34,17)) "eval") [Tuple (Just (34,18)-(34,29)) [Var (Just (34,19)-(34,22)) "ex1",Var (Just (34,24)-(34,25)) "x",Var (Just (34,27)-(34,28)) "y"]]) (App (Just (34,34)-(34,52)) (Var (Just (34,35)-(34,39)) "eval") [Tuple (Just (34,40)-(34,51)) [Var (Just (34,41)-(34,44)) "ex2",Var (Just (34,46)-(34,47)) "x",Var (Just (34,49)-(34,50)) "y"]])) (App (Just (34,57)-(34,75)) (Var (Just (34,58)-(34,62)) "eval") [Tuple (Just (34,63)-(34,74)) [Var (Just (34,64)-(34,67)) "ex3",Var (Just (34,69)-(34,70)) "x",Var (Just (34,72)-(34,73)) "y"]])) (App (Just (35,15)-(35,33)) (Var (Just (35,16)-(35,20)) "eval") [Tuple (Just (35,21)-(35,32)) [Var (Just (35,22)-(35,25)) "ex4",Var (Just (35,27)-(35,28)) "x",Var (Just (35,30)-(35,31)) "y"]])) (App (Just (36,14)-(36,32)) (Var (Just (36,15)-(36,19)) "eval") [Tuple (Just (36,20)-(36,31)) [Var (Just (36,21)-(36,24)) "ex5",Var (Just (36,26)-(36,27)) "x",Var (Just (36,29)-(36,30)) "y"]]))
*)

(* typed spans
(28,6)-(36,33)
*)

(* correct types
float
*)

(* bad types
int
*)
