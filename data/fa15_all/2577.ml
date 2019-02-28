
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(11,14)-(23,25)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(12,2)-(23,25)
match e with
| VarX -> x
| VarY -> y
| Sine a -> sin (pi *. eval (a , x , y))
| Cosine a -> cos (pi *. eval (a , x , y))
| Average (a , b) -> (eval (a , x , y) +. eval (b , x , y)) /. 2.0
| Times (a , b) -> eval (a , x , y) *. eval (b , x , y)
| Thresh (a , b , c , d) -> if eval (a , x , y) < eval (b , x , y)
                            then eval (c , x , y)
                            else eval (d , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(12,2)-(23,25)
e
VarG

(12,2)-(23,25)
x
VarG

(12,2)-(23,25)
y
VarG

(12,2)-(23,25)
sin (pi *. eval (a , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(12,2)-(23,25)
sin
VarG

(12,2)-(23,25)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(17,21)-(17,23)
pi *. eval (a , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,21)-(18,62)
(eval (a , x , y) +. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(19,19)-(19,54)
2.0
LitG

(19,19)-(19,35)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (11,9)-(11,26)) FTimes (Lit (Just (11,9)-(11,12)) (LD 4.0)) (App (Just (11,16)-(11,26)) (Var (Just (11,17)-(11,21)) "atan") [Lit (Just (11,22)-(11,25)) (LD 1.0)])
Case (Just (14,2)-(24,25)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Var (Just (15,13)-(15,14)) "x"),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Var (Just (16,13)-(16,14)) "y"),(ConPat (Just (17,4)-(17,10)) "Sine" (Just (VarPat (Just (17,9)-(17,10)) "a")),Nothing,App (Just (17,14)-(17,42)) (Var (Just (17,14)-(17,17)) "sin") [Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "a",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])]),(ConPat (Just (18,4)-(18,12)) "Cosine" (Just (VarPat (Just (18,11)-(18,12)) "a")),Nothing,App (Just (18,16)-(18,44)) (Var (Just (18,16)-(18,19)) "cos") [Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "a",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])]),(ConPat (Just (19,4)-(19,16)) "Average" (Just (TuplePat (Just (19,13)-(19,16)) [VarPat (Just (19,13)-(19,14)) "a",VarPat (Just (19,15)-(19,16)) "b"])),Nothing,Bop (Just (19,21)-(19,66)) FDiv (Bop (Just (19,21)-(19,59)) FPlus (App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "a",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "b",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]])) (Lit (Just (19,63)-(19,66)) (LD 2.0))),(ConPat (Just (20,4)-(20,14)) "Times" (Just (TuplePat (Just (20,11)-(20,14)) [VarPat (Just (20,11)-(20,12)) "a",VarPat (Just (20,13)-(20,14)) "b"])),Nothing,Bop (Just (20,19)-(20,55)) FTimes (App (Just (20,19)-(20,35)) (Var (Just (20,20)-(20,24)) "eval") [Tuple (Just (20,25)-(20,34)) [Var (Just (20,26)-(20,27)) "a",Var (Just (20,29)-(20,30)) "x",Var (Just (20,32)-(20,33)) "y"]]) (App (Just (20,39)-(20,55)) (Var (Just (20,40)-(20,44)) "eval") [Tuple (Just (20,45)-(20,54)) [Var (Just (20,46)-(20,47)) "b",Var (Just (20,49)-(20,50)) "x",Var (Just (20,52)-(20,53)) "y"]])),(ConPat (Just (21,4)-(21,19)) "Thresh" (Just (TuplePat (Just (21,12)-(21,19)) [VarPat (Just (21,12)-(21,13)) "a",VarPat (Just (21,14)-(21,15)) "b",VarPat (Just (21,16)-(21,17)) "c",VarPat (Just (21,18)-(21,19)) "d"])),Nothing,Ite (Just (22,6)-(24,25)) (Bop (Just (22,9)-(22,44)) Lt (App (Just (22,9)-(22,25)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,24)) [Var (Just (22,16)-(22,17)) "a",Var (Just (22,19)-(22,20)) "x",Var (Just (22,22)-(22,23)) "y"]]) (App (Just (22,28)-(22,44)) (Var (Just (22,29)-(22,33)) "eval") [Tuple (Just (22,34)-(22,43)) [Var (Just (22,35)-(22,36)) "b",Var (Just (22,38)-(22,39)) "x",Var (Just (22,41)-(22,42)) "y"]])) (App (Just (23,11)-(23,25)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,25)) [Var (Just (23,17)-(23,18)) "c",Var (Just (23,20)-(23,21)) "x",Var (Just (23,23)-(23,24)) "y"]]) (App (Just (24,11)-(24,25)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,25)) [Var (Just (24,17)-(24,18)) "d",Var (Just (24,20)-(24,21)) "x",Var (Just (24,23)-(24,24)) "y"]]))]
Var (Just (14,8)-(14,9)) "e"
Var (Just (15,13)-(15,14)) "x"
Var (Just (16,13)-(16,14)) "y"
App (Just (17,14)-(17,42)) (Var (Just (17,14)-(17,17)) "sin") [Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "a",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])]
Var (Just (17,14)-(17,17)) "sin"
Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "a",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])
Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "a",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])
Bop (Just (19,21)-(19,66)) FDiv (Bop (Just (19,21)-(19,59)) FPlus (App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "a",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "b",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]])) (Lit (Just (19,63)-(19,66)) (LD 2.0))
Lit (Just (19,63)-(19,66)) (LD 2.0)
Bop (Just (20,19)-(20,55)) FTimes (App (Just (20,19)-(20,35)) (Var (Just (20,20)-(20,24)) "eval") [Tuple (Just (20,25)-(20,34)) [Var (Just (20,26)-(20,27)) "a",Var (Just (20,29)-(20,30)) "x",Var (Just (20,32)-(20,33)) "y"]]) (App (Just (20,39)-(20,55)) (Var (Just (20,40)-(20,44)) "eval") [Tuple (Just (20,45)-(20,54)) [Var (Just (20,46)-(20,47)) "b",Var (Just (20,49)-(20,50)) "x",Var (Just (20,52)-(20,53)) "y"]])
*)

(* typed spans
(11,9)-(11,26)
(14,2)-(24,25)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,42)
(17,14)-(17,17)
(17,18)-(17,42)
(18,20)-(18,44)
(19,21)-(19,66)
(19,63)-(19,66)
(20,19)-(20,55)
*)

(* correct types
float
float
expr
float
float
float
float -> float
float
float
float
float
float
*)

(* bad types
(expr * int * int) -> int
int
int
int
int
int
int
int
float
int
int
int
*)
