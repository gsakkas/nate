
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Thresh2 of expr* expr
  | Thresh3 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> (evalhelper p1 x y) *. (evalhelper p2 x y)
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y
    | Thresh2 (p1,p2) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y) then 1 else 0
    | Thresh3 (p1,p2) ->
        if (evalhelper p1 x y) > (evalhelper p2 x y) then 0 else (-1) in
  evalhelper e x y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Thresh2 of expr* expr
  | Thresh3 of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> (evalhelper p1 x y) *. (evalhelper p2 x y)
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y
    | Thresh2 (p1,p2) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y) then 1.0 else 0.0
    | Thresh3 (p1,p2) ->
        if (evalhelper p1 x y) > (evalhelper p2 x y) then 0.0 else (-1.0) in
  evalhelper e x y;;

*)

(* changed spans
(29,65)-(29,66)
1.0
LitG

(31,8)-(31,69)
0.0
LitG

(31,65)-(31,69)
0.0
LitG

(32,2)-(32,18)
(- 1.0)
UopG LitG

*)

(* changed exprs
Lit (Just (29,58)-(29,61)) (LD 1.0)
Lit (Just (29,67)-(29,70)) (LD 0.0)
Lit (Just (31,58)-(31,61)) (LD 0.0)
Uop (Just (31,67)-(31,73)) Neg (Lit (Just (31,69)-(31,72)) (LD 1.0))
*)

(* typed spans
(29,58)-(29,61)
(29,67)-(29,70)
(31,58)-(31,61)
(31,67)-(31,73)
*)

(* correct types
float
float
float
int
*)

(* bad types
int
int
int
float
*)
