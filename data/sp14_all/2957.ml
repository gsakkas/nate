
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
  | Sine e' -> sin (pi *. (eval e'))
  | Cosine e' -> cos (pi *. (eval e'))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) *. (eval e2)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1) < (eval e2) then eval e3 else eval e4;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(22,56)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (14,2)-(23,26)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Var (Just (15,13)-(15,14)) "x"),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Var (Just (16,13)-(16,14)) "y"),(ConPat (Just (17,4)-(17,11)) "Sine" (Just (VarPat (Just (17,9)-(17,11)) "e'")),Nothing,App (Just (17,15)-(17,44)) (Var (Just (17,15)-(17,18)) "sin") [Bop (Just (17,19)-(17,44)) FTimes (Var (Just (17,20)-(17,22)) "pi") (App (Just (17,26)-(17,43)) (Var (Just (17,27)-(17,31)) "eval") [Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "e'",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]])]),(ConPat (Just (18,4)-(18,18)) "Average" (Just (TuplePat (Just (18,13)-(18,18)) [VarPat (Just (18,13)-(18,15)) "e1",VarPat (Just (18,16)-(18,18)) "e2"])),Nothing,Bop (Just (18,23)-(18,70)) FDiv (Bop (Just (18,23)-(18,63)) FPlus (App (Just (18,24)-(18,41)) (Var (Just (18,25)-(18,29)) "eval") [Tuple (Just (18,30)-(18,40)) [Var (Just (18,31)-(18,33)) "e1",Var (Just (18,35)-(18,36)) "x",Var (Just (18,38)-(18,39)) "y"]]) (App (Just (18,45)-(18,62)) (Var (Just (18,46)-(18,50)) "eval") [Tuple (Just (18,51)-(18,61)) [Var (Just (18,52)-(18,54)) "e2",Var (Just (18,56)-(18,57)) "x",Var (Just (18,59)-(18,60)) "y"]])) (Lit (Just (18,67)-(18,70)) (LD 2.0))),(ConPat (Just (19,4)-(19,16)) "Times" (Just (TuplePat (Just (19,11)-(19,16)) [VarPat (Just (19,11)-(19,13)) "e1",VarPat (Just (19,14)-(19,16)) "e2"])),Nothing,Bop (Just (19,21)-(19,59)) FTimes (App (Just (19,21)-(19,38)) (Var (Just (19,22)-(19,26)) "eval") [Tuple (Just (19,27)-(19,37)) [Var (Just (19,28)-(19,30)) "e1",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,59)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,58)) [Var (Just (19,49)-(19,51)) "e2",Var (Just (19,53)-(19,54)) "x",Var (Just (19,56)-(19,57)) "y"]])),(ConPat (Just (20,4)-(20,23)) "Thresh" (Just (TuplePat (Just (20,12)-(20,23)) [VarPat (Just (20,12)-(20,14)) "e1",VarPat (Just (20,15)-(20,17)) "e2",VarPat (Just (20,18)-(20,20)) "e3",VarPat (Just (20,21)-(20,23)) "e4"])),Nothing,Ite (Just (21,6)-(23,26)) (Bop (Just (21,9)-(21,46)) Lt (App (Just (21,9)-(21,26)) (Var (Just (21,10)-(21,14)) "eval") [Tuple (Just (21,15)-(21,25)) [Var (Just (21,16)-(21,18)) "e1",Var (Just (21,20)-(21,21)) "x",Var (Just (21,23)-(21,24)) "y"]]) (App (Just (21,29)-(21,46)) (Var (Just (21,30)-(21,34)) "eval") [Tuple (Just (21,35)-(21,45)) [Var (Just (21,36)-(21,38)) "e2",Var (Just (21,40)-(21,41)) "x",Var (Just (21,43)-(21,44)) "y"]])) (App (Just (22,11)-(22,26)) (Var (Just (22,11)-(22,15)) "eval") [Tuple (Just (22,16)-(22,26)) [Var (Just (22,17)-(22,19)) "e3",Var (Just (22,21)-(22,22)) "x",Var (Just (22,24)-(22,25)) "y"]]) (App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e4",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]))]
*)

(* typed spans
(14,2)-(23,26)
*)

(* correct types
float
*)

(* bad types
float
*)
