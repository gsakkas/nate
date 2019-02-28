
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
  | Sine var1 -> sin (pi * (eval (var1, x, y)))
  | Cosine var2 -> cos (pi * (eval (var2, x, y)))
  | Average (var3,var4) -> ((eval (var3, x, y)) + (eval (var4, x, y))) / 2
  | Times (var5,var6) -> (eval (var5, x, y)) * (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;


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
  | Sine var1 -> sin (pi *. (eval (var1, x, y)))
  | Cosine var2 -> cos (pi *. (eval (var2, x, y)))
  | Average (var3,var4) ->
      ((eval (var3, x, y)) +. (eval (var4, x, y))) /. 2.0
  | Times (var5,var6) -> (eval (var5, x, y)) *. (eval (var6, x, y))
  | Thresh (var7,var8,var9,var0) ->
      if (eval (var7, x, y)) < (eval (var8, x, y))
      then eval (var9, x, y)
      else eval (var0, x, y);;

*)

(* changed spans
(17,21)-(17,47)
pi *. eval (var1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,23)-(18,49)
pi *. eval (var2 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,27)-(19,74)
(eval (var3 , x , y) +. eval (var4 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,25)-(20,66)
2.0
LitG

(20,25)-(20,44)
eval (var5 , x , y) *. eval (var6 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (17,21)-(17,48)) FTimes (Var (Just (17,22)-(17,24)) "pi") (App (Just (17,28)-(17,47)) (Var (Just (17,29)-(17,33)) "eval") [Tuple (Just (17,34)-(17,46)) [Var (Just (17,35)-(17,39)) "var1",Var (Just (17,41)-(17,42)) "x",Var (Just (17,44)-(17,45)) "y"]])
Bop (Just (18,23)-(18,50)) FTimes (Var (Just (18,24)-(18,26)) "pi") (App (Just (18,30)-(18,49)) (Var (Just (18,31)-(18,35)) "eval") [Tuple (Just (18,36)-(18,48)) [Var (Just (18,37)-(18,41)) "var2",Var (Just (18,43)-(18,44)) "x",Var (Just (18,46)-(18,47)) "y"]])
Bop (Just (20,6)-(20,57)) FDiv (Bop (Just (20,6)-(20,50)) FPlus (App (Just (20,7)-(20,26)) (Var (Just (20,8)-(20,12)) "eval") [Tuple (Just (20,13)-(20,25)) [Var (Just (20,14)-(20,18)) "var3",Var (Just (20,20)-(20,21)) "x",Var (Just (20,23)-(20,24)) "y"]]) (App (Just (20,30)-(20,49)) (Var (Just (20,31)-(20,35)) "eval") [Tuple (Just (20,36)-(20,48)) [Var (Just (20,37)-(20,41)) "var4",Var (Just (20,43)-(20,44)) "x",Var (Just (20,46)-(20,47)) "y"]])) (Lit (Just (20,54)-(20,57)) (LD 2.0))
Lit (Just (20,54)-(20,57)) (LD 2.0)
Bop (Just (21,25)-(21,67)) FTimes (App (Just (21,25)-(21,44)) (Var (Just (21,26)-(21,30)) "eval") [Tuple (Just (21,31)-(21,43)) [Var (Just (21,32)-(21,36)) "var5",Var (Just (21,38)-(21,39)) "x",Var (Just (21,41)-(21,42)) "y"]]) (App (Just (21,48)-(21,67)) (Var (Just (21,49)-(21,53)) "eval") [Tuple (Just (21,54)-(21,66)) [Var (Just (21,55)-(21,59)) "var6",Var (Just (21,61)-(21,62)) "x",Var (Just (21,64)-(21,65)) "y"]])
*)

(* typed spans
(17,21)-(17,48)
(18,23)-(18,50)
(20,6)-(20,57)
(20,54)-(20,57)
(21,25)-(21,67)
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
