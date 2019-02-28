
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) + (cos (pi *. (eval (e, x, y))))) *
        (cos (pi *. (eval (e, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr* expr
  | Timmy2 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Timmy1 (e1,e2,e3) ->
      ((sin (pi *. (eval (e, x, y)))) +. (cos (pi *. (eval (e, x, y))))) *.
        (cos (pi *. (eval (e, x, y))))
  | Timmy2 (e1,e2) ->
      (sin (pi *. (eval (e, x, y)))) /. (cos (pi *. (eval (e, x, y))));;

*)

(* changed spans
(16,2)-(29,38)
match e with
| VarX -> x
| VarY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
| Timmy1 (e1 , e2 , e3) -> (sin (pi *. eval (e , x , y)) +. cos (pi *. eval (e , x , y))) *. cos (pi *. eval (e , x , y))
| Timmy2 (e1 , e2) -> sin (pi *. eval (e , x , y)) /. cos (pi *. eval (e , x , y))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (16,2)-(31,70)) (Var (Just (16,8)-(16,9)) "e") [(ConPat (Just (17,4)-(17,8)) "VarX" Nothing,Nothing,Var (Just (17,13)-(17,14)) "x"),(ConPat (Just (18,4)-(18,8)) "VarY" Nothing,Nothing,Var (Just (18,13)-(18,14)) "y"),(ConPat (Just (19,4)-(19,10)) "Sine" (Just (VarPat (Just (19,9)-(19,10)) "e")),Nothing,App (Just (19,14)-(19,42)) (Var (Just (19,14)-(19,17)) "sin") [Bop (Just (19,18)-(19,42)) FTimes (Var (Just (19,19)-(19,21)) "pi") (App (Just (19,25)-(19,41)) (Var (Just (19,26)-(19,30)) "eval") [Tuple (Just (19,31)-(19,40)) [Var (Just (19,32)-(19,33)) "e",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]])]),(ConPat (Just (20,4)-(20,12)) "Cosine" (Just (VarPat (Just (20,11)-(20,12)) "e")),Nothing,App (Just (20,16)-(20,44)) (Var (Just (20,16)-(20,19)) "cos") [Bop (Just (20,20)-(20,44)) FTimes (Var (Just (20,21)-(20,23)) "pi") (App (Just (20,27)-(20,43)) (Var (Just (20,28)-(20,32)) "eval") [Tuple (Just (20,33)-(20,42)) [Var (Just (20,34)-(20,35)) "e",Var (Just (20,37)-(20,38)) "x",Var (Just (20,40)-(20,41)) "y"]])]),(ConPat (Just (21,4)-(21,18)) "Average" (Just (TuplePat (Just (21,13)-(21,18)) [VarPat (Just (21,13)-(21,15)) "e1",VarPat (Just (21,16)-(21,18)) "e2"])),Nothing,Bop (Just (21,23)-(21,70)) FDiv (Bop (Just (21,23)-(21,63)) FPlus (App (Just (21,24)-(21,41)) (Var (Just (21,25)-(21,29)) "eval") [Tuple (Just (21,30)-(21,40)) [Var (Just (21,31)-(21,33)) "e1",Var (Just (21,35)-(21,36)) "x",Var (Just (21,38)-(21,39)) "y"]]) (App (Just (21,45)-(21,62)) (Var (Just (21,46)-(21,50)) "eval") [Tuple (Just (21,51)-(21,61)) [Var (Just (21,52)-(21,54)) "e2",Var (Just (21,56)-(21,57)) "x",Var (Just (21,59)-(21,60)) "y"]])) (Lit (Just (21,67)-(21,70)) (LD 2.0))),(ConPat (Just (22,4)-(22,16)) "Times" (Just (TuplePat (Just (22,11)-(22,16)) [VarPat (Just (22,11)-(22,13)) "e1",VarPat (Just (22,14)-(22,16)) "e2"])),Nothing,Bop (Just (22,21)-(22,59)) FTimes (App (Just (22,21)-(22,38)) (Var (Just (22,22)-(22,26)) "eval") [Tuple (Just (22,27)-(22,37)) [Var (Just (22,28)-(22,30)) "e1",Var (Just (22,32)-(22,33)) "x",Var (Just (22,35)-(22,36)) "y"]]) (App (Just (22,42)-(22,59)) (Var (Just (22,43)-(22,47)) "eval") [Tuple (Just (22,48)-(22,58)) [Var (Just (22,49)-(22,51)) "e2",Var (Just (22,53)-(22,54)) "x",Var (Just (22,56)-(22,57)) "y"]])),(ConPat (Just (23,4)-(23,23)) "Thresh" (Just (TuplePat (Just (23,12)-(23,23)) [VarPat (Just (23,12)-(23,14)) "e1",VarPat (Just (23,15)-(23,17)) "e2",VarPat (Just (23,18)-(23,20)) "e3",VarPat (Just (23,21)-(23,23)) "e4"])),Nothing,Ite (Just (24,6)-(26,26)) (Bop (Just (24,9)-(24,46)) Lt (App (Just (24,9)-(24,26)) (Var (Just (24,10)-(24,14)) "eval") [Tuple (Just (24,15)-(24,25)) [Var (Just (24,16)-(24,18)) "e1",Var (Just (24,20)-(24,21)) "x",Var (Just (24,23)-(24,24)) "y"]]) (App (Just (24,29)-(24,46)) (Var (Just (24,30)-(24,34)) "eval") [Tuple (Just (24,35)-(24,45)) [Var (Just (24,36)-(24,38)) "e2",Var (Just (24,40)-(24,41)) "x",Var (Just (24,43)-(24,44)) "y"]])) (App (Just (25,11)-(25,26)) (Var (Just (25,11)-(25,15)) "eval") [Tuple (Just (25,16)-(25,26)) [Var (Just (25,17)-(25,19)) "e3",Var (Just (25,21)-(25,22)) "x",Var (Just (25,24)-(25,25)) "y"]]) (App (Just (26,11)-(26,26)) (Var (Just (26,11)-(26,15)) "eval") [Tuple (Just (26,16)-(26,26)) [Var (Just (26,17)-(26,19)) "e4",Var (Just (26,21)-(26,22)) "x",Var (Just (26,24)-(26,25)) "y"]])),(ConPat (Just (27,4)-(27,20)) "Timmy1" (Just (TuplePat (Just (27,12)-(27,20)) [VarPat (Just (27,12)-(27,14)) "e1",VarPat (Just (27,15)-(27,17)) "e2",VarPat (Just (27,18)-(27,20)) "e3"])),Nothing,Bop (Just (28,6)-(29,38)) FTimes (Bop (Just (28,6)-(28,72)) FPlus (App (Just (28,7)-(28,37)) (Var (Just (28,8)-(28,11)) "sin") [Bop (Just (28,12)-(28,36)) FTimes (Var (Just (28,13)-(28,15)) "pi") (App (Just (28,19)-(28,35)) (Var (Just (28,20)-(28,24)) "eval") [Tuple (Just (28,25)-(28,34)) [Var (Just (28,26)-(28,27)) "e",Var (Just (28,29)-(28,30)) "x",Var (Just (28,32)-(28,33)) "y"]])]) (App (Just (28,41)-(28,71)) (Var (Just (28,42)-(28,45)) "cos") [Bop (Just (28,46)-(28,70)) FTimes (Var (Just (28,47)-(28,49)) "pi") (App (Just (28,53)-(28,69)) (Var (Just (28,54)-(28,58)) "eval") [Tuple (Just (28,59)-(28,68)) [Var (Just (28,60)-(28,61)) "e",Var (Just (28,63)-(28,64)) "x",Var (Just (28,66)-(28,67)) "y"]])])) (App (Just (29,8)-(29,38)) (Var (Just (29,9)-(29,12)) "cos") [Bop (Just (29,13)-(29,37)) FTimes (Var (Just (29,14)-(29,16)) "pi") (App (Just (29,20)-(29,36)) (Var (Just (29,21)-(29,25)) "eval") [Tuple (Just (29,26)-(29,35)) [Var (Just (29,27)-(29,28)) "e",Var (Just (29,30)-(29,31)) "x",Var (Just (29,33)-(29,34)) "y"]])])),(ConPat (Just (30,4)-(30,17)) "Timmy2" (Just (TuplePat (Just (30,12)-(30,17)) [VarPat (Just (30,12)-(30,14)) "e1",VarPat (Just (30,15)-(30,17)) "e2"])),Nothing,Bop (Just (31,6)-(31,70)) FDiv (App (Just (31,6)-(31,36)) (Var (Just (31,7)-(31,10)) "sin") [Bop (Just (31,11)-(31,35)) FTimes (Var (Just (31,12)-(31,14)) "pi") (App (Just (31,18)-(31,34)) (Var (Just (31,19)-(31,23)) "eval") [Tuple (Just (31,24)-(31,33)) [Var (Just (31,25)-(31,26)) "e",Var (Just (31,28)-(31,29)) "x",Var (Just (31,31)-(31,32)) "y"]])]) (App (Just (31,40)-(31,70)) (Var (Just (31,41)-(31,44)) "cos") [Bop (Just (31,45)-(31,69)) FTimes (Var (Just (31,46)-(31,48)) "pi") (App (Just (31,52)-(31,68)) (Var (Just (31,53)-(31,57)) "eval") [Tuple (Just (31,58)-(31,67)) [Var (Just (31,59)-(31,60)) "e",Var (Just (31,62)-(31,63)) "x",Var (Just (31,65)-(31,66)) "y"]])]))]
*)

(* typed spans
(16,2)-(31,70)
*)

(* correct types
float
*)

(* bad types
float
*)
