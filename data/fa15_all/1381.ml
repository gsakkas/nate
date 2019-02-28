
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | GoldTimes of expr;;

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
      sqrt (((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0))
  | GoldTimes m4 -> ((eval (m4, x, y)) * (1 +. (sqrt 5))) /. 2.0;;


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
  | GoldTimes of expr;;

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
      sqrt (((eval (circ1, x, y)) ** 2.0) +. ((eval (circ2, x, y)) ** 2.0))
  | GoldTimes m4 -> ((eval (m4, x, y)) *. (1.0 +. (sqrt 5.0))) /. 2.0;;

*)

(* changed spans
(29,20)-(29,57)
eval (m4 , x , y) *. (1.0 +. sqrt 5.0)
BopG (AppG (fromList [EmptyG])) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (29,20)-(29,62)) FTimes (App (Just (29,21)-(29,38)) (Var (Just (29,22)-(29,26)) "eval") [Tuple (Just (29,27)-(29,37)) [Var (Just (29,28)-(29,30)) "m4",Var (Just (29,32)-(29,33)) "x",Var (Just (29,35)-(29,36)) "y"]]) (Bop (Just (29,42)-(29,61)) FPlus (Lit (Just (29,43)-(29,46)) (LD 1.0)) (App (Just (29,50)-(29,60)) (Var (Just (29,51)-(29,55)) "sqrt") [Lit (Just (29,56)-(29,59)) (LD 5.0)]))
*)

(* typed spans
(29,20)-(29,62)
*)

(* correct types
float
*)

(* bad types
int
*)
