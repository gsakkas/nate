
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d =
        (((eval (m, x, y)) * (eval (n, x, y))) * (eval (o, x, y))) /
          (((eval (m, x, y)) + (eval (n, x, y))) + (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) ->
      let d = eval (n, x, y) in
      if d > 1.0
      then eval (m, x, y)
      else (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d =
        (((eval (m, x, y)) *. (eval (n, x, y))) *. (eval (o, x, y))) /.
          (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y))) in
      if d > 1.0 then 1.0 else if d < (-1.0) then (-1.0) else d;;

*)

(* changed spans
(34,8)-(35,68)
((eval (m , x , y) *. eval (n , x , y)) *. eval (o , x , y)) /. ((eval (m , x , y) +. eval (n , x , y)) +. eval (o , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (34,8)-(35,70)) FDiv (Bop (Just (34,8)-(34,68)) FTimes (Bop (Just (34,9)-(34,47)) FTimes (App (Just (34,10)-(34,26)) (Var (Just (34,11)-(34,15)) "eval") [Tuple (Just (34,16)-(34,25)) [Var (Just (34,17)-(34,18)) "m",Var (Just (34,20)-(34,21)) "x",Var (Just (34,23)-(34,24)) "y"]]) (App (Just (34,30)-(34,46)) (Var (Just (34,31)-(34,35)) "eval") [Tuple (Just (34,36)-(34,45)) [Var (Just (34,37)-(34,38)) "n",Var (Just (34,40)-(34,41)) "x",Var (Just (34,43)-(34,44)) "y"]])) (App (Just (34,51)-(34,67)) (Var (Just (34,52)-(34,56)) "eval") [Tuple (Just (34,57)-(34,66)) [Var (Just (34,58)-(34,59)) "o",Var (Just (34,61)-(34,62)) "x",Var (Just (34,64)-(34,65)) "y"]])) (Bop (Just (35,10)-(35,70)) FPlus (Bop (Just (35,11)-(35,49)) FPlus (App (Just (35,12)-(35,28)) (Var (Just (35,13)-(35,17)) "eval") [Tuple (Just (35,18)-(35,27)) [Var (Just (35,19)-(35,20)) "m",Var (Just (35,22)-(35,23)) "x",Var (Just (35,25)-(35,26)) "y"]]) (App (Just (35,32)-(35,48)) (Var (Just (35,33)-(35,37)) "eval") [Tuple (Just (35,38)-(35,47)) [Var (Just (35,39)-(35,40)) "n",Var (Just (35,42)-(35,43)) "x",Var (Just (35,45)-(35,46)) "y"]])) (App (Just (35,53)-(35,69)) (Var (Just (35,54)-(35,58)) "eval") [Tuple (Just (35,59)-(35,68)) [Var (Just (35,60)-(35,61)) "o",Var (Just (35,63)-(35,64)) "x",Var (Just (35,66)-(35,67)) "y"]]))
*)

(* typed spans
(34,8)-(35,70)
*)

(* correct types
float
*)

(* bad types
int
*)
