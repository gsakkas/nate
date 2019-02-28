
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) +. (atan res2)) -. (atan res3)) *. 2) /
              (3.0 *. pi)
          else eval ((-1.0) *. res3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) +. (atan res2)) -. (atan res3)) *. 2.0) /.
              (3.0 *. pi)
          else (-1.0) *. res3;;

*)

(* changed spans
(42,12)-(43,25)
(((atan res1 +. atan res2) -. atan res3) *. 2.0) /. (3.0 *. pi)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(44,15)-(44,36)
(- 1.0) *. res3
BopG (UopG EmptyG) VarG

(44,15)-(44,36)
(- 1.0)
UopG LitG

(44,15)-(44,36)
1.0
LitG

(44,15)-(44,36)
res3
VarG

*)

(* changed exprs
Bop (Just (42,12)-(43,25)) FDiv (Bop (Just (42,12)-(42,66)) FTimes (Bop (Just (42,13)-(42,58)) FMinus (Bop (Just (42,14)-(42,42)) FPlus (App (Just (42,15)-(42,26)) (Var (Just (42,16)-(42,20)) "atan") [Var (Just (42,21)-(42,25)) "res1"]) (App (Just (42,30)-(42,41)) (Var (Just (42,31)-(42,35)) "atan") [Var (Just (42,36)-(42,40)) "res2"])) (App (Just (42,46)-(42,57)) (Var (Just (42,47)-(42,51)) "atan") [Var (Just (42,52)-(42,56)) "res3"])) (Lit (Just (42,62)-(42,65)) (LD 2.0))) (Bop (Just (43,14)-(43,25)) FTimes (Lit (Just (43,15)-(43,18)) (LD 3.0)) (Var (Just (43,22)-(43,24)) "pi"))
Bop (Just (44,15)-(44,29)) FTimes (Uop (Just (44,15)-(44,21)) Neg (Lit (Just (44,17)-(44,20)) (LD 1.0))) (Var (Just (44,25)-(44,29)) "res3")
Uop (Just (44,15)-(44,21)) Neg (Lit (Just (44,17)-(44,20)) (LD 1.0))
Lit (Just (44,17)-(44,20)) (LD 1.0)
Var (Just (44,25)-(44,29)) "res3"
*)

(* typed spans
(42,12)-(43,25)
(44,15)-(44,29)
(44,15)-(44,21)
(44,17)-(44,20)
(44,25)-(44,29)
*)

(* correct types
float
float
int
float
float
*)

(* bad types
int
int
int
int
int
*)
