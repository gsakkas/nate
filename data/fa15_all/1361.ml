
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (eval sine)
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(11,14)-(26,81)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(12,2)-(26,81)
match e with
| VarX -> x
| VarY -> y
| Sine sine -> sin (pi *. eval (sine , x , y))
| Cosine cosine -> cos (pi *. eval (cosine , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (th1 , th2 , th3 , th4) -> if eval (th1 , x , y) < eval (th2 , x , y)
                                    then eval (th3 , x , y)
                                    else eval (th4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Bop (Just (11,9)-(11,26)) FTimes (Lit (Just (11,9)-(11,12)) (LD 4.0)) (App (Just (11,16)-(11,26)) (Var (Just (11,17)-(11,21)) "atan") [Lit (Just (11,22)-(11,25)) (LD 1.0)])
Case (Just (14,2)-(24,27)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Var (Just (15,13)-(15,14)) "x"),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Var (Just (16,13)-(16,14)) "y"),(ConPat (Just (17,4)-(17,13)) "Sine" (Just (VarPat (Just (17,9)-(17,13)) "sine")),Nothing,App (Just (17,17)-(17,48)) (Var (Just (17,17)-(17,20)) "sin") [Bop (Just (17,21)-(17,48)) FTimes (Var (Just (17,22)-(17,24)) "pi") (App (Just (17,28)-(17,47)) (Var (Just (17,29)-(17,33)) "eval") [Tuple (Just (17,34)-(17,46)) [Var (Just (17,35)-(17,39)) "sine",Var (Just (17,41)-(17,42)) "x",Var (Just (17,44)-(17,45)) "y"]])]),(ConPat (Just (18,4)-(18,17)) "Cosine" (Just (VarPat (Just (18,11)-(18,17)) "cosine")),Nothing,App (Just (18,21)-(18,54)) (Var (Just (18,21)-(18,24)) "cos") [Bop (Just (18,25)-(18,54)) FTimes (Var (Just (18,26)-(18,28)) "pi") (App (Just (18,32)-(18,53)) (Var (Just (18,33)-(18,37)) "eval") [Tuple (Just (18,38)-(18,52)) [Var (Just (18,39)-(18,45)) "cosine",Var (Just (18,47)-(18,48)) "x",Var (Just (18,50)-(18,51)) "y"]])]),(ConPat (Just (19,4)-(19,18)) "Average" (Just (TuplePat (Just (19,13)-(19,18)) [VarPat (Just (19,13)-(19,15)) "e1",VarPat (Just (19,16)-(19,18)) "e2"])),Nothing,Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))),(ConPat (Just (20,4)-(20,16)) "Times" (Just (TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "t1",VarPat (Just (20,14)-(20,16)) "t2"])),Nothing,Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "t1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "t2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])),(ConPat (Just (21,4)-(21,27)) "Thresh" (Just (TuplePat (Just (21,12)-(21,27)) [VarPat (Just (21,12)-(21,15)) "th1",VarPat (Just (21,16)-(21,19)) "th2",VarPat (Just (21,20)-(21,23)) "th3",VarPat (Just (21,24)-(21,27)) "th4"])),Nothing,Ite (Just (22,6)-(24,27)) (Bop (Just (22,9)-(22,48)) Lt (App (Just (22,9)-(22,27)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,26)) [Var (Just (22,16)-(22,19)) "th1",Var (Just (22,21)-(22,22)) "x",Var (Just (22,24)-(22,25)) "y"]]) (App (Just (22,30)-(22,48)) (Var (Just (22,31)-(22,35)) "eval") [Tuple (Just (22,36)-(22,47)) [Var (Just (22,37)-(22,40)) "th2",Var (Just (22,42)-(22,43)) "x",Var (Just (22,45)-(22,46)) "y"]])) (App (Just (23,11)-(23,27)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,27)) [Var (Just (23,17)-(23,20)) "th3",Var (Just (23,22)-(23,23)) "x",Var (Just (23,25)-(23,26)) "y"]]) (App (Just (24,11)-(24,27)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,27)) [Var (Just (24,17)-(24,20)) "th4",Var (Just (24,22)-(24,23)) "x",Var (Just (24,25)-(24,26)) "y"]]))]
*)

(* typed spans
(11,9)-(11,26)
(14,2)-(24,27)
*)

(* correct types
float
float
*)

(* bad types
(expr * float * float) -> float
float
*)
