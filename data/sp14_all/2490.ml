
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
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) * (evalhelper p2 x y)) /. 2.0 in
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
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) *. (evalhelper p2 x y)) /. 2.0 in
  evalhelper e x y;;

*)

(* changed spans
(20,25)-(20,68)
evalhelper p1 x
           y *. evalhelper p2 x y
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (20,25)-(20,69)) FTimes (App (Just (20,26)-(20,45)) (Var (Just (20,27)-(20,37)) "evalhelper") [Var (Just (20,38)-(20,40)) "p1",Var (Just (20,41)-(20,42)) "x",Var (Just (20,43)-(20,44)) "y"]) (App (Just (20,49)-(20,68)) (Var (Just (20,50)-(20,60)) "evalhelper") [Var (Just (20,61)-(20,63)) "p2",Var (Just (20,64)-(20,65)) "x",Var (Just (20,66)-(20,67)) "y"])
*)

(* typed spans
(20,25)-(20,69)
*)

(* correct types
float
*)

(* bad types
int
*)
