
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
      sin
        (((1.0 /. (eval (e1, x, y))) + (1.0 /. (eval (e2, x, y)))) +
           (1.0 /. (eval (e3, x, y))));;


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
      sin
        (((1.0 /. (eval (e1, x, y))) +. (1.0 /. (eval (e2, x, y)))) +.
           (1.0 /. (eval (e3, x, y))));;

*)

(* changed spans
(30,8)-(31,38)
((1.0 /. eval (e1 , x , y)) +. (1.0 /. eval (e2 , x , y))) +. (1.0 /. eval (e3 , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (30,8)-(31,38)) FPlus (Bop (Just (30,9)-(30,67)) FPlus (Bop (Just (30,10)-(30,36)) FDiv (Lit (Just (30,11)-(30,14)) (LD 1.0)) (App (Just (30,18)-(30,35)) (Var (Just (30,19)-(30,23)) "eval") [Tuple (Just (30,24)-(30,34)) [Var (Just (30,25)-(30,27)) "e1",Var (Just (30,29)-(30,30)) "x",Var (Just (30,32)-(30,33)) "y"]])) (Bop (Just (30,40)-(30,66)) FDiv (Lit (Just (30,41)-(30,44)) (LD 1.0)) (App (Just (30,48)-(30,65)) (Var (Just (30,49)-(30,53)) "eval") [Tuple (Just (30,54)-(30,64)) [Var (Just (30,55)-(30,57)) "e2",Var (Just (30,59)-(30,60)) "x",Var (Just (30,62)-(30,63)) "y"]]))) (Bop (Just (31,11)-(31,37)) FDiv (Lit (Just (31,12)-(31,15)) (LD 1.0)) (App (Just (31,19)-(31,36)) (Var (Just (31,20)-(31,24)) "eval") [Tuple (Just (31,25)-(31,35)) [Var (Just (31,26)-(31,28)) "e3",Var (Just (31,30)-(31,31)) "x",Var (Just (31,33)-(31,34)) "y"]]))
*)

(* typed spans
(30,8)-(31,38)
*)

(* correct types
float
*)

(* bad types
int
*)
