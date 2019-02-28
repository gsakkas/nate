
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
  | Thresh (w,x,y,z) -> if (eval w) < (eval x) then eval y else eval z
  | Times (x,y) -> (eval x) * (eval y)
  | Average (x,y) -> ((eval x) * (eval y)) / 2
  | Cosine x -> cos (pi * (eval x))
  | Sine x -> sin (pi * (eval x))
  | VarX  -> x
  | VarY  -> y;;


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
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(14,2)-(21,14)
match e with
| Thresh (w , t , u , z) -> if eval (w , x , y) < eval (t , x , y)
                            then eval (u , x , y)
                            else eval (z , x , y)
| Times (t , u) -> eval (t , x , y) *. eval (u , x , y)
| Average (t , u) -> (eval (t , x , y) *. eval (u , x , y)) /. 2.0
| Cosine t -> cos (pi *. eval (t , x , y))
| Sine t -> sin (pi *. eval (t , x , y))
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (14,2)-(24,14)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,19)) "Thresh" (Just (TuplePat (Just (15,12)-(15,19)) [VarPat (Just (15,12)-(15,13)) "w",VarPat (Just (15,14)-(15,15)) "t",VarPat (Just (15,16)-(15,17)) "u",VarPat (Just (15,18)-(15,19)) "z"])),Nothing,Ite (Just (16,6)-(18,25)) (Bop (Just (16,9)-(16,44)) Lt (App (Just (16,9)-(16,25)) (Var (Just (16,10)-(16,14)) "eval") [Tuple (Just (16,15)-(16,24)) [Var (Just (16,16)-(16,17)) "w",Var (Just (16,19)-(16,20)) "x",Var (Just (16,22)-(16,23)) "y"]]) (App (Just (16,28)-(16,44)) (Var (Just (16,29)-(16,33)) "eval") [Tuple (Just (16,34)-(16,43)) [Var (Just (16,35)-(16,36)) "t",Var (Just (16,38)-(16,39)) "x",Var (Just (16,41)-(16,42)) "y"]])) (App (Just (17,11)-(17,25)) (Var (Just (17,11)-(17,15)) "eval") [Tuple (Just (17,16)-(17,25)) [Var (Just (17,17)-(17,18)) "u",Var (Just (17,20)-(17,21)) "x",Var (Just (17,23)-(17,24)) "y"]]) (App (Just (18,11)-(18,25)) (Var (Just (18,11)-(18,15)) "eval") [Tuple (Just (18,16)-(18,25)) [Var (Just (18,17)-(18,18)) "z",Var (Just (18,20)-(18,21)) "x",Var (Just (18,23)-(18,24)) "y"]])),(ConPat (Just (19,4)-(19,14)) "Times" (Just (TuplePat (Just (19,11)-(19,14)) [VarPat (Just (19,11)-(19,12)) "t",VarPat (Just (19,13)-(19,14)) "u"])),Nothing,Bop (Just (19,19)-(19,55)) FTimes (App (Just (19,19)-(19,35)) (Var (Just (19,20)-(19,24)) "eval") [Tuple (Just (19,25)-(19,34)) [Var (Just (19,26)-(19,27)) "t",Var (Just (19,29)-(19,30)) "x",Var (Just (19,32)-(19,33)) "y"]]) (App (Just (19,39)-(19,55)) (Var (Just (19,40)-(19,44)) "eval") [Tuple (Just (19,45)-(19,54)) [Var (Just (19,46)-(19,47)) "u",Var (Just (19,49)-(19,50)) "x",Var (Just (19,52)-(19,53)) "y"]])),(ConPat (Just (20,4)-(20,16)) "Average" (Just (TuplePat (Just (20,13)-(20,16)) [VarPat (Just (20,13)-(20,14)) "t",VarPat (Just (20,15)-(20,16)) "u"])),Nothing,Bop (Just (20,21)-(20,66)) FDiv (Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,22)-(20,38)) (Var (Just (20,23)-(20,27)) "eval") [Tuple (Just (20,28)-(20,37)) [Var (Just (20,29)-(20,30)) "t",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,58)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,57)) [Var (Just (20,49)-(20,50)) "u",Var (Just (20,52)-(20,53)) "x",Var (Just (20,55)-(20,56)) "y"]])) (Lit (Just (20,63)-(20,66)) (LD 2.0))),(ConPat (Just (21,4)-(21,12)) "Cosine" (Just (VarPat (Just (21,11)-(21,12)) "t")),Nothing,App (Just (21,16)-(21,44)) (Var (Just (21,16)-(21,19)) "cos") [Bop (Just (21,20)-(21,44)) FTimes (Var (Just (21,21)-(21,23)) "pi") (App (Just (21,27)-(21,43)) (Var (Just (21,28)-(21,32)) "eval") [Tuple (Just (21,33)-(21,42)) [Var (Just (21,34)-(21,35)) "t",Var (Just (21,37)-(21,38)) "x",Var (Just (21,40)-(21,41)) "y"]])]),(ConPat (Just (22,4)-(22,10)) "Sine" (Just (VarPat (Just (22,9)-(22,10)) "t")),Nothing,App (Just (22,14)-(22,42)) (Var (Just (22,14)-(22,17)) "sin") [Bop (Just (22,18)-(22,42)) FTimes (Var (Just (22,19)-(22,21)) "pi") (App (Just (22,25)-(22,41)) (Var (Just (22,26)-(22,30)) "eval") [Tuple (Just (22,31)-(22,40)) [Var (Just (22,32)-(22,33)) "t",Var (Just (22,35)-(22,36)) "x",Var (Just (22,38)-(22,39)) "y"]])]),(ConPat (Just (23,4)-(23,8)) "VarX" Nothing,Nothing,Var (Just (23,13)-(23,14)) "x"),(ConPat (Just (24,4)-(24,8)) "VarY" Nothing,Nothing,Var (Just (24,13)-(24,14)) "y")]
*)

(* typed spans
(14,2)-(24,14)
*)

(* correct types
float
*)

(* bad types
int
*)
