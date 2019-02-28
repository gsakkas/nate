
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let rec factorial x acc =
  if x = 0.0 then acc else factorial (x -. 1.0) (x *. acc);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Factorial e' -> factorial (eval e')
  | Sum3 (e1,e2,e3) -> ((eval e1) +. (eval e2)) +. (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(13,18)-(14,58)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(19,2)-(31,60)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Cosine e' -> cos (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> if eval (a , x , y) < eval (b , x , y)
                                      then eval (a_less , x , y)
                                      else eval (b_less , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Bop (Just (13,9)-(13,26)) FTimes (Lit (Just (13,9)-(13,12)) (LD 4.0)) (App (Just (13,16)-(13,26)) (Var (Just (13,17)-(13,21)) "atan") [Lit (Just (13,22)-(13,25)) (LD 1.0)])
Case (Just (16,2)-(26,30)) (Var (Just (16,8)-(16,9)) "e") [(ConPat (Just (17,4)-(17,8)) "VarX" Nothing,Nothing,Var (Just (17,13)-(17,14)) "x"),(ConPat (Just (18,4)-(18,8)) "VarY" Nothing,Nothing,Var (Just (18,13)-(18,14)) "y"),(ConPat (Just (19,4)-(19,11)) "Sine" (Just (VarPat (Just (19,9)-(19,11)) "e'")),Nothing,App (Just (19,15)-(19,44)) (Var (Just (19,15)-(19,18)) "sin") [Bop (Just (19,19)-(19,44)) FTimes (Var (Just (19,20)-(19,22)) "pi") (App (Just (19,26)-(19,43)) (Var (Just (19,27)-(19,31)) "eval") [Tuple (Just (19,32)-(19,42)) [Var (Just (19,33)-(19,35)) "e'",Var (Just (19,37)-(19,38)) "x",Var (Just (19,40)-(19,41)) "y"]])]),(ConPat (Just (20,4)-(20,13)) "Cosine" (Just (VarPat (Just (20,11)-(20,13)) "e'")),Nothing,App (Just (20,17)-(20,46)) (Var (Just (20,17)-(20,20)) "cos") [Bop (Just (20,21)-(20,46)) FTimes (Var (Just (20,22)-(20,24)) "pi") (App (Just (20,28)-(20,45)) (Var (Just (20,29)-(20,33)) "eval") [Tuple (Just (20,34)-(20,44)) [Var (Just (20,35)-(20,37)) "e'",Var (Just (20,39)-(20,40)) "x",Var (Just (20,42)-(20,43)) "y"]])]),(ConPat (Just (21,4)-(21,18)) "Average" (Just (TuplePat (Just (21,13)-(21,18)) [VarPat (Just (21,13)-(21,15)) "e1",VarPat (Just (21,16)-(21,18)) "e2"])),Nothing,Bop (Just (21,23)-(21,70)) FDiv (Bop (Just (21,23)-(21,63)) FPlus (App (Just (21,24)-(21,41)) (Var (Just (21,25)-(21,29)) "eval") [Tuple (Just (21,30)-(21,40)) [Var (Just (21,31)-(21,33)) "e1",Var (Just (21,35)-(21,36)) "x",Var (Just (21,38)-(21,39)) "y"]]) (App (Just (21,45)-(21,62)) (Var (Just (21,46)-(21,50)) "eval") [Tuple (Just (21,51)-(21,61)) [Var (Just (21,52)-(21,54)) "e2",Var (Just (21,56)-(21,57)) "x",Var (Just (21,59)-(21,60)) "y"]])) (Lit (Just (21,67)-(21,70)) (LD 2.0))),(ConPat (Just (22,4)-(22,16)) "Times" (Just (TuplePat (Just (22,11)-(22,16)) [VarPat (Just (22,11)-(22,13)) "e1",VarPat (Just (22,14)-(22,16)) "e2"])),Nothing,Bop (Just (22,21)-(22,59)) FTimes (App (Just (22,21)-(22,38)) (Var (Just (22,22)-(22,26)) "eval") [Tuple (Just (22,27)-(22,37)) [Var (Just (22,28)-(22,30)) "e1",Var (Just (22,32)-(22,33)) "x",Var (Just (22,35)-(22,36)) "y"]]) (App (Just (22,42)-(22,59)) (Var (Just (22,43)-(22,47)) "eval") [Tuple (Just (22,48)-(22,58)) [Var (Just (22,49)-(22,51)) "e2",Var (Just (22,53)-(22,54)) "x",Var (Just (22,56)-(22,57)) "y"]])),(ConPat (Just (23,4)-(23,29)) "Thresh" (Just (TuplePat (Just (23,12)-(23,29)) [VarPat (Just (23,12)-(23,13)) "a",VarPat (Just (23,14)-(23,15)) "b",VarPat (Just (23,16)-(23,22)) "a_less",VarPat (Just (23,23)-(23,29)) "b_less"])),Nothing,Ite (Just (24,6)-(26,30)) (Bop (Just (24,9)-(24,44)) Lt (App (Just (24,9)-(24,25)) (Var (Just (24,10)-(24,14)) "eval") [Tuple (Just (24,15)-(24,24)) [Var (Just (24,16)-(24,17)) "a",Var (Just (24,19)-(24,20)) "x",Var (Just (24,22)-(24,23)) "y"]]) (App (Just (24,28)-(24,44)) (Var (Just (24,29)-(24,33)) "eval") [Tuple (Just (24,34)-(24,43)) [Var (Just (24,35)-(24,36)) "b",Var (Just (24,38)-(24,39)) "x",Var (Just (24,41)-(24,42)) "y"]])) (App (Just (25,11)-(25,30)) (Var (Just (25,11)-(25,15)) "eval") [Tuple (Just (25,16)-(25,30)) [Var (Just (25,17)-(25,23)) "a_less",Var (Just (25,25)-(25,26)) "x",Var (Just (25,28)-(25,29)) "y"]]) (App (Just (26,11)-(26,30)) (Var (Just (26,11)-(26,15)) "eval") [Tuple (Just (26,16)-(26,30)) [Var (Just (26,17)-(26,23)) "b_less",Var (Just (26,25)-(26,26)) "x",Var (Just (26,28)-(26,29)) "y"]]))]
*)

(* typed spans
(13,9)-(13,26)
(16,2)-(26,30)
*)

(* correct types
float
float
*)

(* bad types
float -> float -> float
float
*)
