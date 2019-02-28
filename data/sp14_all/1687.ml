
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) / 2.0
  | Times (v,w) -> (eval (v, x, y)) * (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,21)-(15,64)
(eval (v , x , y) +. eval (w , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(16,19)-(16,54)
eval (v , x , y) *. eval (v , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (15,21)-(15,66)) FDiv (Bop (Just (15,21)-(15,59)) FPlus (App (Just (15,22)-(15,38)) (Var (Just (15,23)-(15,27)) "eval") [Tuple (Just (15,28)-(15,37)) [Var (Just (15,29)-(15,30)) "v",Var (Just (15,32)-(15,33)) "x",Var (Just (15,35)-(15,36)) "y"]]) (App (Just (15,42)-(15,58)) (Var (Just (15,43)-(15,47)) "eval") [Tuple (Just (15,48)-(15,57)) [Var (Just (15,49)-(15,50)) "w",Var (Just (15,52)-(15,53)) "x",Var (Just (15,55)-(15,56)) "y"]])) (Lit (Just (15,63)-(15,66)) (LD 2.0))
Bop (Just (16,19)-(16,55)) FTimes (App (Just (16,19)-(16,35)) (Var (Just (16,20)-(16,24)) "eval") [Tuple (Just (16,25)-(16,34)) [Var (Just (16,26)-(16,27)) "v",Var (Just (16,29)-(16,30)) "x",Var (Just (16,32)-(16,33)) "y"]]) (App (Just (16,39)-(16,55)) (Var (Just (16,40)-(16,44)) "eval") [Tuple (Just (16,45)-(16,54)) [Var (Just (16,46)-(16,47)) "v",Var (Just (16,49)-(16,50)) "x",Var (Just (16,52)-(16,53)) "y"]])
*)

(* typed spans
(15,21)-(15,66)
(16,19)-(16,55)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
