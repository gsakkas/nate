
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

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
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      (exp eval (circ1, x, y) 2.0) + (exp eval (circ2, x, y) 2.0)
  | NatLog nlog -> log eval (nlog, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | NatLog of expr;;

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
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      ((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0)
  | NatLog nlog -> log (eval (nlog, x, y));;

*)

(* changed spans
(28,6)-(28,65)
(eval (circ1 , x , y) ** 2.0) +. (eval (circ2 , x , y) ** 2.0)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,19)-(29,40)
log (eval (nlog , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Bop (Just (28,6)-(28,68)) FPlus (App (Just (28,6)-(28,35)) (Var (Just (28,28)-(28,30)) "**") [App (Just (28,7)-(28,27)) (Var (Just (28,8)-(28,12)) "eval") [Tuple (Just (28,13)-(28,26)) [Var (Just (28,14)-(28,19)) "circ1",Var (Just (28,21)-(28,22)) "x",Var (Just (28,24)-(28,25)) "y"]],Lit (Just (28,31)-(28,34)) (LD 2.0)]) (App (Just (28,39)-(28,68)) (Var (Just (28,61)-(28,63)) "**") [App (Just (28,40)-(28,60)) (Var (Just (28,41)-(28,45)) "eval") [Tuple (Just (28,46)-(28,59)) [Var (Just (28,47)-(28,52)) "circ2",Var (Just (28,54)-(28,55)) "x",Var (Just (28,57)-(28,58)) "y"]],Lit (Just (28,64)-(28,67)) (LD 2.0)])
App (Just (29,19)-(29,42)) (Var (Just (29,19)-(29,22)) "log") [App (Just (29,23)-(29,42)) (Var (Just (29,24)-(29,28)) "eval") [Tuple (Just (29,29)-(29,41)) [Var (Just (29,30)-(29,34)) "nlog",Var (Just (29,36)-(29,37)) "x",Var (Just (29,39)-(29,40)) "y"]]]
*)

(* typed spans
(28,6)-(28,68)
(29,19)-(29,42)
*)

(* correct types
float
float
*)

(* bad types
int
float
*)
