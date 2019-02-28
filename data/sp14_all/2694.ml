
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         + (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +.
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         +. (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;

*)

(* changed spans
(29,6)-(31,56)
(eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (29,6)-(31,57)) FPlus (Bop (Just (29,7)-(30,55)) FPlus (App (Just (29,8)-(29,52)) (Var (Just (29,9)-(29,13)) "eval") [Tuple (Just (29,14)-(29,51)) [Var (Just (29,15)-(29,16)) "a",App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,22)) "sin") [Bop (Just (29,23)-(29,32)) FTimes (Var (Just (29,24)-(29,26)) "pi") (Var (Just (29,30)-(29,31)) "x")],App (Just (29,35)-(29,50)) (Var (Just (29,36)-(29,39)) "sin") [Bop (Just (29,40)-(29,49)) FTimes (Var (Just (29,41)-(29,43)) "pi") (Var (Just (29,47)-(29,48)) "y")]]]) (App (Just (30,10)-(30,54)) (Var (Just (30,11)-(30,15)) "eval") [Tuple (Just (30,16)-(30,53)) [Var (Just (30,17)-(30,18)) "b",App (Just (30,20)-(30,35)) (Var (Just (30,21)-(30,24)) "sin") [Bop (Just (30,25)-(30,34)) FTimes (Var (Just (30,26)-(30,28)) "pi") (Var (Just (30,32)-(30,33)) "x")],App (Just (30,37)-(30,52)) (Var (Just (30,38)-(30,41)) "sin") [Bop (Just (30,42)-(30,51)) FTimes (Var (Just (30,43)-(30,45)) "pi") (Var (Just (30,49)-(30,50)) "y")]]])) (App (Just (31,12)-(31,56)) (Var (Just (31,13)-(31,17)) "eval") [Tuple (Just (31,18)-(31,55)) [Var (Just (31,19)-(31,20)) "c",App (Just (31,22)-(31,37)) (Var (Just (31,23)-(31,26)) "sin") [Bop (Just (31,27)-(31,36)) FTimes (Var (Just (31,28)-(31,30)) "pi") (Var (Just (31,34)-(31,35)) "x")],App (Just (31,39)-(31,54)) (Var (Just (31,40)-(31,43)) "sin") [Bop (Just (31,44)-(31,53)) FTimes (Var (Just (31,45)-(31,47)) "pi") (Var (Just (31,51)-(31,52)) "y")]]])
*)

(* typed spans
(29,6)-(31,57)
*)

(* correct types
float
*)

(* bad types
int
*)
