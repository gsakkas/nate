
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Abs v ->
      if (eval (v, x, y)) < 0
      then (eval (v, x, y)) *. (-1)
      else eval (v, x, y)
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then eval ((c *. (-1)), x, y)
      else eval (c, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mid of expr* expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Mid (p,q) ->
      let diff =
        if ((eval (p, x, y)) -. (eval (q, x, y))) < 0.0
        then (eval (p, x, y)) -. ((eval (q, x, y)) *. (-1.0))
        else (eval (p, x, y)) -. (eval (q, x, y)) in
      diff /. 2.0
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then (eval (c, x, y)) *. (-1.0)
      else eval (c, x, y);;

*)

(* changed spans
(16,2)-(34,25)
match e with
| VarX -> x
| VarY -> y
| Sine q -> sin (pi *. eval (q , x , y))
| Cosine q -> cos (pi *. eval (q , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
| Mid (p , q) -> (let diff =
                    if (eval (p , x , y) -. eval (q , x , y)) < 0.0
                    then eval (p , x , y) -. (eval (q , x , y) *. (- 1.0))
                    else eval (p , x , y) -. eval (q , x , y) in
                  diff /. 2.0)
| Flip (a , b , c) -> if eval (a , x , y) > eval (b , x , y)
                      then eval (c , x , y) *. (- 1.0)
                      else eval (c , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (16,2)-(36,25)) (Var (Just (16,8)-(16,9)) "e") [(ConPat (Just (17,4)-(17,8)) "VarX" Nothing,Nothing,Var (Just (17,13)-(17,14)) "x"),(ConPat (Just (18,4)-(18,8)) "VarY" Nothing,Nothing,Var (Just (18,13)-(18,14)) "y"),(ConPat (Just (19,4)-(19,10)) "Sine" (Just (VarPat (Just (19,9)-(19,10)) "q")),Nothing,App (Just (19,14)-(19,42)) (Var (Just (19,14)-(19,17)) "sin") [Bop (Just (19,18)-(19,42)) FTimes (Var (Just (19,19)-(19,21)) "pi") (App (Just (19,25)-(19,41)) (Var (Just (19,26)-(19,30)) "eval") [Tuple (Just (19,31)-(19,40)) [Var (Just (19,32)-(19,33)) "q",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]])]),(ConPat (Just (20,4)-(20,12)) "Cosine" (Just (VarPat (Just (20,11)-(20,12)) "q")),Nothing,App (Just (20,16)-(20,44)) (Var (Just (20,16)-(20,19)) "cos") [Bop (Just (20,20)-(20,44)) FTimes (Var (Just (20,21)-(20,23)) "pi") (App (Just (20,27)-(20,43)) (Var (Just (20,28)-(20,32)) "eval") [Tuple (Just (20,33)-(20,42)) [Var (Just (20,34)-(20,35)) "q",Var (Just (20,37)-(20,38)) "x",Var (Just (20,40)-(20,41)) "y"]])]),(ConPat (Just (21,4)-(21,18)) "Average" (Just (TuplePat (Just (21,13)-(21,18)) [VarPat (Just (21,13)-(21,15)) "e1",VarPat (Just (21,16)-(21,18)) "e2"])),Nothing,Bop (Just (21,23)-(21,70)) FDiv (Bop (Just (21,23)-(21,63)) FPlus (App (Just (21,24)-(21,41)) (Var (Just (21,25)-(21,29)) "eval") [Tuple (Just (21,30)-(21,40)) [Var (Just (21,31)-(21,33)) "e1",Var (Just (21,35)-(21,36)) "x",Var (Just (21,38)-(21,39)) "y"]]) (App (Just (21,45)-(21,62)) (Var (Just (21,46)-(21,50)) "eval") [Tuple (Just (21,51)-(21,61)) [Var (Just (21,52)-(21,54)) "e2",Var (Just (21,56)-(21,57)) "x",Var (Just (21,59)-(21,60)) "y"]])) (Lit (Just (21,67)-(21,70)) (LD 2.0))),(ConPat (Just (22,4)-(22,16)) "Times" (Just (TuplePat (Just (22,11)-(22,16)) [VarPat (Just (22,11)-(22,13)) "e1",VarPat (Just (22,14)-(22,16)) "e2"])),Nothing,Bop (Just (22,21)-(22,59)) FTimes (App (Just (22,21)-(22,38)) (Var (Just (22,22)-(22,26)) "eval") [Tuple (Just (22,27)-(22,37)) [Var (Just (22,28)-(22,30)) "e1",Var (Just (22,32)-(22,33)) "x",Var (Just (22,35)-(22,36)) "y"]]) (App (Just (22,42)-(22,59)) (Var (Just (22,43)-(22,47)) "eval") [Tuple (Just (22,48)-(22,58)) [Var (Just (22,49)-(22,51)) "e2",Var (Just (22,53)-(22,54)) "x",Var (Just (22,56)-(22,57)) "y"]])),(ConPat (Just (23,4)-(23,29)) "Thresh" (Just (TuplePat (Just (23,12)-(23,29)) [VarPat (Just (23,12)-(23,13)) "a",VarPat (Just (23,14)-(23,15)) "b",VarPat (Just (23,16)-(23,22)) "a_less",VarPat (Just (23,23)-(23,29)) "b_less"])),Nothing,Ite (Just (24,6)-(26,30)) (Bop (Just (24,9)-(24,44)) Lt (App (Just (24,9)-(24,25)) (Var (Just (24,10)-(24,14)) "eval") [Tuple (Just (24,15)-(24,24)) [Var (Just (24,16)-(24,17)) "a",Var (Just (24,19)-(24,20)) "x",Var (Just (24,22)-(24,23)) "y"]]) (App (Just (24,28)-(24,44)) (Var (Just (24,29)-(24,33)) "eval") [Tuple (Just (24,34)-(24,43)) [Var (Just (24,35)-(24,36)) "b",Var (Just (24,38)-(24,39)) "x",Var (Just (24,41)-(24,42)) "y"]])) (App (Just (25,11)-(25,30)) (Var (Just (25,11)-(25,15)) "eval") [Tuple (Just (25,16)-(25,30)) [Var (Just (25,17)-(25,23)) "a_less",Var (Just (25,25)-(25,26)) "x",Var (Just (25,28)-(25,29)) "y"]]) (App (Just (26,11)-(26,30)) (Var (Just (26,11)-(26,15)) "eval") [Tuple (Just (26,16)-(26,30)) [Var (Just (26,17)-(26,23)) "b_less",Var (Just (26,25)-(26,26)) "x",Var (Just (26,28)-(26,29)) "y"]])),(ConPat (Just (27,4)-(27,12)) "Mid" (Just (TuplePat (Just (27,9)-(27,12)) [VarPat (Just (27,9)-(27,10)) "p",VarPat (Just (27,11)-(27,12)) "q"])),Nothing,Let (Just (28,6)-(32,17)) NonRec [(VarPat (Just (28,10)-(28,14)) "diff",Ite (Just (29,8)-(31,49)) (Bop (Just (29,11)-(29,55)) Lt (Bop (Just (29,11)-(29,49)) FMinus (App (Just (29,12)-(29,28)) (Var (Just (29,13)-(29,17)) "eval") [Tuple (Just (29,18)-(29,27)) [Var (Just (29,19)-(29,20)) "p",Var (Just (29,22)-(29,23)) "x",Var (Just (29,25)-(29,26)) "y"]]) (App (Just (29,32)-(29,48)) (Var (Just (29,33)-(29,37)) "eval") [Tuple (Just (29,38)-(29,47)) [Var (Just (29,39)-(29,40)) "q",Var (Just (29,42)-(29,43)) "x",Var (Just (29,45)-(29,46)) "y"]])) (Lit (Just (29,52)-(29,55)) (LD 0.0))) (Bop (Just (30,13)-(30,61)) FMinus (App (Just (30,13)-(30,29)) (Var (Just (30,14)-(30,18)) "eval") [Tuple (Just (30,19)-(30,28)) [Var (Just (30,20)-(30,21)) "p",Var (Just (30,23)-(30,24)) "x",Var (Just (30,26)-(30,27)) "y"]]) (Bop (Just (30,33)-(30,61)) FTimes (App (Just (30,34)-(30,50)) (Var (Just (30,35)-(30,39)) "eval") [Tuple (Just (30,40)-(30,49)) [Var (Just (30,41)-(30,42)) "q",Var (Just (30,44)-(30,45)) "x",Var (Just (30,47)-(30,48)) "y"]]) (Uop (Just (30,54)-(30,60)) Neg (Lit (Just (30,56)-(30,59)) (LD 1.0))))) (Bop (Just (31,13)-(31,49)) FMinus (App (Just (31,13)-(31,29)) (Var (Just (31,14)-(31,18)) "eval") [Tuple (Just (31,19)-(31,28)) [Var (Just (31,20)-(31,21)) "p",Var (Just (31,23)-(31,24)) "x",Var (Just (31,26)-(31,27)) "y"]]) (App (Just (31,33)-(31,49)) (Var (Just (31,34)-(31,38)) "eval") [Tuple (Just (31,39)-(31,48)) [Var (Just (31,40)-(31,41)) "q",Var (Just (31,43)-(31,44)) "x",Var (Just (31,46)-(31,47)) "y"]])))] (Bop (Just (32,6)-(32,17)) FDiv (Var (Just (32,6)-(32,10)) "diff") (Lit (Just (32,14)-(32,17)) (LD 2.0)))),(ConPat (Just (33,4)-(33,15)) "Flip" (Just (TuplePat (Just (33,10)-(33,15)) [VarPat (Just (33,10)-(33,11)) "a",VarPat (Just (33,12)-(33,13)) "b",VarPat (Just (33,14)-(33,15)) "c"])),Nothing,Ite (Just (34,6)-(36,25)) (Bop (Just (34,9)-(34,44)) Gt (App (Just (34,9)-(34,25)) (Var (Just (34,10)-(34,14)) "eval") [Tuple (Just (34,15)-(34,24)) [Var (Just (34,16)-(34,17)) "a",Var (Just (34,19)-(34,20)) "x",Var (Just (34,22)-(34,23)) "y"]]) (App (Just (34,28)-(34,44)) (Var (Just (34,29)-(34,33)) "eval") [Tuple (Just (34,34)-(34,43)) [Var (Just (34,35)-(34,36)) "b",Var (Just (34,38)-(34,39)) "x",Var (Just (34,41)-(34,42)) "y"]])) (Bop (Just (35,11)-(35,37)) FTimes (App (Just (35,11)-(35,27)) (Var (Just (35,12)-(35,16)) "eval") [Tuple (Just (35,17)-(35,26)) [Var (Just (35,18)-(35,19)) "c",Var (Just (35,21)-(35,22)) "x",Var (Just (35,24)-(35,25)) "y"]]) (Uop (Just (35,31)-(35,37)) Neg (Lit (Just (35,33)-(35,36)) (LD 1.0)))) (App (Just (36,11)-(36,25)) (Var (Just (36,11)-(36,15)) "eval") [Tuple (Just (36,16)-(36,25)) [Var (Just (36,17)-(36,18)) "c",Var (Just (36,20)-(36,21)) "x",Var (Just (36,23)-(36,24)) "y"]]))]
*)

(* typed spans
(16,2)-(36,25)
*)

(* correct types
float
*)

(* bad types
float
*)
