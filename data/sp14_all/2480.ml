
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> evalhelper buildSine p1 x y
    | Cosine p1 -> evalhelper buildCosine p1 x y in
  evalhelper e x y;;


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
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y)) in
  evalhelper e x y;;

*)

(* changed spans
(13,14)-(13,24)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(20,17)-(20,44)
sin (pi *. evalhelper p1 x y)
AppG (fromList [BopG EmptyG EmptyG])

(21,19)-(21,48)
cos (pi *. evalhelper p1 x y)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
Bop (Just (11,9)-(11,26)) FTimes (Lit (Just (11,9)-(11,12)) (LD 4.0)) (App (Just (11,16)-(11,26)) (Var (Just (11,17)-(11,21)) "atan") [Lit (Just (11,22)-(11,25)) (LD 1.0)])
App (Just (18,17)-(18,48)) (Var (Just (18,17)-(18,20)) "sin") [Bop (Just (18,21)-(18,48)) FTimes (Var (Just (18,22)-(18,24)) "pi") (App (Just (18,28)-(18,47)) (Var (Just (18,29)-(18,39)) "evalhelper") [Var (Just (18,40)-(18,42)) "p1",Var (Just (18,43)-(18,44)) "x",Var (Just (18,45)-(18,46)) "y"])]
App (Just (19,19)-(19,50)) (Var (Just (19,19)-(19,22)) "cos") [Bop (Just (19,23)-(19,50)) FTimes (Var (Just (19,24)-(19,26)) "pi") (App (Just (19,30)-(19,49)) (Var (Just (19,31)-(19,41)) "evalhelper") [Var (Just (19,42)-(19,44)) "p1",Var (Just (19,45)-(19,46)) "x",Var (Just (19,47)-(19,48)) "y"])]
*)

(* typed spans
(11,9)-(11,26)
(18,17)-(18,48)
(19,19)-(19,50)
*)

(* correct types
float
float
float
*)

(* bad types
expr -> expr
'a
'a
*)
