
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> buildAverage (e1, e2);;


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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(16,2)-(21,44)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (14,2)-(20,59)) (Var (Just (14,8)-(14,9)) "e") [(ConPat (Just (15,4)-(15,8)) "VarX" Nothing,Nothing,Var (Just (15,13)-(15,14)) "x"),(ConPat (Just (16,4)-(16,8)) "VarY" Nothing,Nothing,Var (Just (16,13)-(16,14)) "y"),(ConPat (Just (17,4)-(17,10)) "Sine" (Just (VarPat (Just (17,9)-(17,10)) "e")),Nothing,Bop (Just (17,14)-(17,21)) FTimes (Var (Just (17,14)-(17,16)) "pi") (Var (Just (17,20)-(17,21)) "x")),(ConPat (Just (18,4)-(18,12)) "Cosine" (Just (VarPat (Just (18,11)-(18,12)) "e")),Nothing,Bop (Just (18,16)-(18,23)) FTimes (Var (Just (18,16)-(18,18)) "pi") (Var (Just (18,22)-(18,23)) "y")),(ConPat (Just (19,4)-(19,18)) "Average" (Just (TuplePat (Just (19,13)-(19,18)) [VarPat (Just (19,13)-(19,15)) "e1",VarPat (Just (19,16)-(19,18)) "e2"])),Nothing,Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))),(ConPat (Just (20,4)-(20,16)) "Times" (Just (TuplePat (Just (20,11)-(20,16)) [VarPat (Just (20,11)-(20,13)) "e1",VarPat (Just (20,14)-(20,16)) "e2"])),Nothing,Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]]))]
*)

(* typed spans
(14,2)-(20,59)
*)

(* correct types
float
*)

(* bad types
float
*)
