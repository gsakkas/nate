
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
    | Sine p1 -> sin (pi *. (evalhelper p1))
    | Cosine p1 -> cos (pi *. (evalhelper p1)) in
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
(18,28)-(18,43)
evalhelper p1 x y
AppG (fromList [VarG])

(19,30)-(19,45)
evalhelper p1 x y
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (18,28)-(18,47)) (Var (Just (18,29)-(18,39)) "evalhelper") [Var (Just (18,40)-(18,42)) "p1",Var (Just (18,43)-(18,44)) "x",Var (Just (18,45)-(18,46)) "y"]
App (Just (19,30)-(19,49)) (Var (Just (19,31)-(19,41)) "evalhelper") [Var (Just (19,42)-(19,44)) "p1",Var (Just (19,45)-(19,46)) "x",Var (Just (19,47)-(19,48)) "y"]
*)

(* typed spans
(18,28)-(18,47)
(19,30)-(19,49)
*)

(* correct types
float
float
*)

(* bad types
float
float
*)
