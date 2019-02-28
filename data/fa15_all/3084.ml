
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi * (eval (x1, x, y)))
  | Cosine x2 -> cos (pi * (eval (x2, x, y)))
  | Average (x3,x4) -> ((eval (x3, x, y)) +. (eval (x4, x, y))) / 2
  | Times (x5,x6) -> (eval (x5, x, y)) * (eval (x6, x, y))
  | Thresh (x7,x8,x9,x0) ->
      if (eval (x7, x, y)) < (eval (x8, x, y))
      then eval (x9, x, y)
      else eval (x0, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x2 -> cos (pi *. (eval (x2, x, y)))
  | Average (x3,x4) -> ((eval (x3, x, y)) +. (eval (x4, x, y))) /. 2.
  | Times (x5,x6) -> (eval (x5, x, y)) *. (eval (x6, x, y))
  | Thresh (x7,x8,x9,x0) ->
      if (eval (x7, x, y)) < (eval (x8, x, y))
      then eval (x9, x, y)
      else eval (x0, x, y);;

*)

(* changed spans
(17,19)-(17,43)
pi *. eval (x1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,45)
pi *. eval (x2 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,23)-(19,67)
(eval (x3 , x , y) +. eval (x4 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,21)-(20,58)
2.0
LitG

(20,21)-(20,38)
eval (x5 , x , y) *. eval (x6 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,19)-(17,44)) FTimes (Var (Just (17,20)-(17,22)) "pi") (App (Just (17,26)-(17,43)) (Var (Just (17,27)-(17,31)) "eval") [Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "x1",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]])
Bop (Just (18,21)-(18,46)) FTimes (Var (Just (18,22)-(18,24)) "pi") (App (Just (18,28)-(18,45)) (Var (Just (18,29)-(18,33)) "eval") [Tuple (Just (18,34)-(18,44)) [Var (Just (18,35)-(18,37)) "x2",Var (Just (18,39)-(18,40)) "x",Var (Just (18,42)-(18,43)) "y"]])
Bop (Just (19,23)-(19,69)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "x3",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "x4",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,69)) (LD 2.0))
Lit (Just (19,67)-(19,69)) (LD 2.0)
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "x5",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "x6",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
*)

(* typed spans
(17,19)-(17,44)
(18,21)-(18,46)
(19,23)-(19,69)
(19,67)-(19,69)
(20,21)-(20,59)
*)

(* correct types
float
float
float
float
float
*)

(* bad types
int
int
int
int
int
*)
