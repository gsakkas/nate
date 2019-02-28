
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sin_Avg of expr* expr* expr;;

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
  | Sin_Avg (a,b,c) ->
      eval
        ((eval (a, (sin (pi * x)), (sin (pi * y)))),
          (eval (b, (sin (pi * x)), (sin (pi * y)))),
          (eval (c, (sin (pi * x)), (sin (pi * y)))));;


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
(16,2)-(32,53)
match e with
| VarX -> x
| VarY -> y
| Sine a -> eval (a , sin (pi *. x) , sin (pi *. y))
| Cosine a -> eval (a , cos (pi *. x) , cos (pi *. y))
| Average (a , b) -> (eval (a , x , y) +. eval (b , x , y)) /. 2.0
| Times (a , b) -> eval (a , x , y) *. eval (b , x , y)
| Thresh (a , b , c , d) -> if eval (a , x , y) < eval (b , x , y)
                            then eval (c , x , y)
                            else eval (d , x , y)
| Tan a -> eval (a , tan (pi *. x) , tan (pi *. y))
| Sine_Avg (a , b , c) -> ((eval (a , sin (pi *. x) , sin (pi *. y)) +. eval (b , sin (pi *. x) , sin (pi *. y))) +. eval (c , sin (pi *. x) , sin (pi *. y))) /. 3.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (16,2)-(32,14)) (Var (Just (16,8)-(16,9)) "e") [(ConPat (Just (17,4)-(17,8)) "VarX" Nothing,Nothing,Var (Just (17,13)-(17,14)) "x"),(ConPat (Just (18,4)-(18,8)) "VarY" Nothing,Nothing,Var (Just (18,13)-(18,14)) "y"),(ConPat (Just (19,4)-(19,10)) "Sine" (Just (VarPat (Just (19,9)-(19,10)) "a")),Nothing,App (Just (19,14)-(19,56)) (Var (Just (19,14)-(19,18)) "eval") [Tuple (Just (19,19)-(19,56)) [Var (Just (19,20)-(19,21)) "a",App (Just (19,23)-(19,38)) (Var (Just (19,24)-(19,27)) "sin") [Bop (Just (19,28)-(19,37)) FTimes (Var (Just (19,29)-(19,31)) "pi") (Var (Just (19,35)-(19,36)) "x")],App (Just (19,40)-(19,55)) (Var (Just (19,41)-(19,44)) "sin") [Bop (Just (19,45)-(19,54)) FTimes (Var (Just (19,46)-(19,48)) "pi") (Var (Just (19,52)-(19,53)) "y")]]]),(ConPat (Just (20,4)-(20,12)) "Cosine" (Just (VarPat (Just (20,11)-(20,12)) "a")),Nothing,App (Just (20,16)-(20,58)) (Var (Just (20,16)-(20,20)) "eval") [Tuple (Just (20,21)-(20,58)) [Var (Just (20,22)-(20,23)) "a",App (Just (20,25)-(20,40)) (Var (Just (20,26)-(20,29)) "cos") [Bop (Just (20,30)-(20,39)) FTimes (Var (Just (20,31)-(20,33)) "pi") (Var (Just (20,37)-(20,38)) "x")],App (Just (20,42)-(20,57)) (Var (Just (20,43)-(20,46)) "cos") [Bop (Just (20,47)-(20,56)) FTimes (Var (Just (20,48)-(20,50)) "pi") (Var (Just (20,54)-(20,55)) "y")]]]),(ConPat (Just (21,4)-(21,16)) "Average" (Just (TuplePat (Just (21,13)-(21,16)) [VarPat (Just (21,13)-(21,14)) "a",VarPat (Just (21,15)-(21,16)) "b"])),Nothing,Bop (Just (21,21)-(21,66)) FDiv (Bop (Just (21,21)-(21,59)) FPlus (App (Just (21,22)-(21,38)) (Var (Just (21,23)-(21,27)) "eval") [Tuple (Just (21,28)-(21,37)) [Var (Just (21,29)-(21,30)) "a",Var (Just (21,32)-(21,33)) "x",Var (Just (21,35)-(21,36)) "y"]]) (App (Just (21,42)-(21,58)) (Var (Just (21,43)-(21,47)) "eval") [Tuple (Just (21,48)-(21,57)) [Var (Just (21,49)-(21,50)) "b",Var (Just (21,52)-(21,53)) "x",Var (Just (21,55)-(21,56)) "y"]])) (Lit (Just (21,63)-(21,66)) (LD 2.0))),(ConPat (Just (22,4)-(22,14)) "Times" (Just (TuplePat (Just (22,11)-(22,14)) [VarPat (Just (22,11)-(22,12)) "a",VarPat (Just (22,13)-(22,14)) "b"])),Nothing,Bop (Just (22,19)-(22,55)) FTimes (App (Just (22,19)-(22,35)) (Var (Just (22,20)-(22,24)) "eval") [Tuple (Just (22,25)-(22,34)) [Var (Just (22,26)-(22,27)) "a",Var (Just (22,29)-(22,30)) "x",Var (Just (22,32)-(22,33)) "y"]]) (App (Just (22,39)-(22,55)) (Var (Just (22,40)-(22,44)) "eval") [Tuple (Just (22,45)-(22,54)) [Var (Just (22,46)-(22,47)) "b",Var (Just (22,49)-(22,50)) "x",Var (Just (22,52)-(22,53)) "y"]])),(ConPat (Just (23,4)-(23,19)) "Thresh" (Just (TuplePat (Just (23,12)-(23,19)) [VarPat (Just (23,12)-(23,13)) "a",VarPat (Just (23,14)-(23,15)) "b",VarPat (Just (23,16)-(23,17)) "c",VarPat (Just (23,18)-(23,19)) "d"])),Nothing,Ite (Just (24,6)-(26,25)) (Bop (Just (24,9)-(24,44)) Lt (App (Just (24,9)-(24,25)) (Var (Just (24,10)-(24,14)) "eval") [Tuple (Just (24,15)-(24,24)) [Var (Just (24,16)-(24,17)) "a",Var (Just (24,19)-(24,20)) "x",Var (Just (24,22)-(24,23)) "y"]]) (App (Just (24,28)-(24,44)) (Var (Just (24,29)-(24,33)) "eval") [Tuple (Just (24,34)-(24,43)) [Var (Just (24,35)-(24,36)) "b",Var (Just (24,38)-(24,39)) "x",Var (Just (24,41)-(24,42)) "y"]])) (App (Just (25,11)-(25,25)) (Var (Just (25,11)-(25,15)) "eval") [Tuple (Just (25,16)-(25,25)) [Var (Just (25,17)-(25,18)) "c",Var (Just (25,20)-(25,21)) "x",Var (Just (25,23)-(25,24)) "y"]]) (App (Just (26,11)-(26,25)) (Var (Just (26,11)-(26,15)) "eval") [Tuple (Just (26,16)-(26,25)) [Var (Just (26,17)-(26,18)) "d",Var (Just (26,20)-(26,21)) "x",Var (Just (26,23)-(26,24)) "y"]])),(ConPat (Just (27,4)-(27,9)) "Tan" (Just (VarPat (Just (27,8)-(27,9)) "a")),Nothing,App (Just (27,13)-(27,55)) (Var (Just (27,13)-(27,17)) "eval") [Tuple (Just (27,18)-(27,55)) [Var (Just (27,19)-(27,20)) "a",App (Just (27,22)-(27,37)) (Var (Just (27,23)-(27,26)) "tan") [Bop (Just (27,27)-(27,36)) FTimes (Var (Just (27,28)-(27,30)) "pi") (Var (Just (27,34)-(27,35)) "x")],App (Just (27,39)-(27,54)) (Var (Just (27,40)-(27,43)) "tan") [Bop (Just (27,44)-(27,53)) FTimes (Var (Just (27,45)-(27,47)) "pi") (Var (Just (27,51)-(27,52)) "y")]]]),(ConPat (Just (28,4)-(28,19)) "Sine_Avg" (Just (TuplePat (Just (28,14)-(28,19)) [VarPat (Just (28,14)-(28,15)) "a",VarPat (Just (28,16)-(28,17)) "b",VarPat (Just (28,18)-(28,19)) "c"])),Nothing,Bop (Just (29,6)-(32,14)) FDiv (Bop (Just (29,6)-(31,57)) FPlus (Bop (Just (29,7)-(30,55)) FPlus (App (Just (29,8)-(29,52)) (Var (Just (29,9)-(29,13)) "eval") [Tuple (Just (29,14)-(29,51)) [Var (Just (29,15)-(29,16)) "a",App (Just (29,18)-(29,33)) (Var (Just (29,19)-(29,22)) "sin") [Bop (Just (29,23)-(29,32)) FTimes (Var (Just (29,24)-(29,26)) "pi") (Var (Just (29,30)-(29,31)) "x")],App (Just (29,35)-(29,50)) (Var (Just (29,36)-(29,39)) "sin") [Bop (Just (29,40)-(29,49)) FTimes (Var (Just (29,41)-(29,43)) "pi") (Var (Just (29,47)-(29,48)) "y")]]]) (App (Just (30,10)-(30,54)) (Var (Just (30,11)-(30,15)) "eval") [Tuple (Just (30,16)-(30,53)) [Var (Just (30,17)-(30,18)) "b",App (Just (30,20)-(30,35)) (Var (Just (30,21)-(30,24)) "sin") [Bop (Just (30,25)-(30,34)) FTimes (Var (Just (30,26)-(30,28)) "pi") (Var (Just (30,32)-(30,33)) "x")],App (Just (30,37)-(30,52)) (Var (Just (30,38)-(30,41)) "sin") [Bop (Just (30,42)-(30,51)) FTimes (Var (Just (30,43)-(30,45)) "pi") (Var (Just (30,49)-(30,50)) "y")]]])) (App (Just (31,12)-(31,56)) (Var (Just (31,13)-(31,17)) "eval") [Tuple (Just (31,18)-(31,55)) [Var (Just (31,19)-(31,20)) "c",App (Just (31,22)-(31,37)) (Var (Just (31,23)-(31,26)) "sin") [Bop (Just (31,27)-(31,36)) FTimes (Var (Just (31,28)-(31,30)) "pi") (Var (Just (31,34)-(31,35)) "x")],App (Just (31,39)-(31,54)) (Var (Just (31,40)-(31,43)) "sin") [Bop (Just (31,44)-(31,53)) FTimes (Var (Just (31,45)-(31,47)) "pi") (Var (Just (31,51)-(31,52)) "y")]]])) (Lit (Just (32,11)-(32,14)) (LD 3.0)))]
*)

(* typed spans
(16,2)-(32,14)
*)

(* correct types
float
*)

(* bad types
float
*)
