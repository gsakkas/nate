
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | buildX -> buildX ()
  | buildY -> buildY ()
  | Sine e -> buildSine (eval (e, x, y))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage ((eval (e1, x, y)), (eval (e2, x, y)))
  | Times (e1,e2) -> buildTimes ((eval (e1, x, y)), (eval (e2, x, y)))
  | Thresh (a,b,a_less,b_less) ->
      buildThresh (a, b, a_less, (eval (b_less, x, y)));;


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
(19,16)-(19,39)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(24,14)-(24,23)
x
VarG

(25,14)-(25,40)
y
VarG

(25,14)-(25,23)
sin
VarG

(25,24)-(25,40)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(26,16)-(26,27)
cos
VarG

(26,28)-(26,44)
pi *. eval (e , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(27,23)-(27,74)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,21)-(28,70)
2.0
LitG

(28,33)-(28,50)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,6)-(30,55)
0.0
LitG

*)

(* changed exprs
Bop (Just (11,9)-(11,26)) FTimes (Lit (Just (11,9)-(11,12)) (LD 4.0)) (App (Just (11,16)-(11,26)) (Var (Just (11,17)-(11,21)) "atan") [Lit (Just (11,22)-(11,25)) (LD 1.0)])
Var (Just (15,14)-(15,15)) "x"
Var (Just (16,14)-(16,15)) "y"
Var (Just (17,14)-(17,17)) "sin"
Bop (Just (17,18)-(17,42)) FTimes (Var (Just (17,19)-(17,21)) "pi") (App (Just (17,25)-(17,41)) (Var (Just (17,26)-(17,30)) "eval") [Tuple (Just (17,31)-(17,40)) [Var (Just (17,32)-(17,33)) "e",Var (Just (17,35)-(17,36)) "x",Var (Just (17,38)-(17,39)) "y"]])
Var (Just (18,16)-(18,19)) "cos"
Bop (Just (18,20)-(18,44)) FTimes (Var (Just (18,21)-(18,23)) "pi") (App (Just (18,27)-(18,43)) (Var (Just (18,28)-(18,32)) "eval") [Tuple (Just (18,33)-(18,42)) [Var (Just (18,34)-(18,35)) "e",Var (Just (18,37)-(18,38)) "x",Var (Just (18,40)-(18,41)) "y"]])
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Lit (Just (19,67)-(19,70)) (LD 2.0)
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
Lit (Just (21,34)-(21,37)) (LD 0.0)
*)

(* typed spans
(11,9)-(11,26)
(15,14)-(15,15)
(16,14)-(16,15)
(17,14)-(17,17)
(17,18)-(17,42)
(18,16)-(18,19)
(18,20)-(18,44)
(19,23)-(19,70)
(19,67)-(19,70)
(20,21)-(20,59)
(21,34)-(21,37)
*)

(* correct types
float
float
float
float -> float
float
float -> float
float
float
float
float
float
*)

(* bad types
(expr * expr) -> expr
expr
expr
expr -> expr
expr
expr -> expr
expr
expr
expr
expr
expr
*)
