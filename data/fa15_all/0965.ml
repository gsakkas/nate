
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> y
  | Sine e -> buildSine e
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> buildThresh (a, b, a_less, b_less);;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

*)

(* changed spans
(20,2)-(27,68)
match e with
| buildX -> x
| buildY -> y
| Sine e -> sin (pi *. eval (e , x , y))
| Cosine e -> cos (pi *. eval (e , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (a , b , a_less , b_less) -> 0.0
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (14,2)-(21,37)) (Var (Just (14,8)-(14,9)) "e") [(VarPat (Just (15,4)-(15,10)) "buildX",Nothing,Var (Just (15,14)-(15,15)) "x"),(VarPat (Just (16,4)-(16,10)) "buildY",Nothing,Var (Just (16,14)-(16,15)) "y"),(ConPat (Just (17,4)-(17,10)) "Sine" (Just (VarPat (Just (17,9)-(17,10)) "e")),Nothing,App (Just (17,14)-(17,42)) (Var (Just (17,14)-(17,17)) "sin") [Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "e",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])]),(ConPat (Just (18,4)-(18,12)) "Cosine" (Just (VarPat (Just (18,11)-(18,12)) "e")),Nothing,App (Just (18,16)-(18,44)) (Var (Just (18,16)-(18,19)) "cos") [Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "e",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])]),(ConPat (Just (19,4)-(19,18)) "Average" (Just (TuplePat (Just (19,13)-(19,18)) [VarPat (Just (19,13)-(19,15)) "e1",VarPat (Just (19,16)-(19,18)) "e2"])),Nothing,Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))),(ConPat (Just (20,4)-(20,16)) "Times" (Just (TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "e1",VarPat (Just (20,14)-(20,16)) "e2"])),Nothing,Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])),(ConPat (Just (21,4)-(21,29)) "Thresh" (Just (TuplePat (Just (21,12)-(21,29)) [VarPat (Just (21,12)-(21,13)) "a",VarPat (Just (21,14)-(21,15)) "b",VarPat (Just (21,16)-(21,22)) "a_less",VarPat (Just (21,23)-(21,29)) "b_less"])),Nothing,Lit (Just (21,34)-(21,37)) (LD 0.0))]
*)

(* typed spans
(14,2)-(21,37)
*)

(* correct types
float
*)

(* bad types
expr
*)
