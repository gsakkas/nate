
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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) + ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) /. 2.0) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(18,6)-(18,61)
(eval (e1 , x , y) /. 2.0) +. (eval (e2 , x , y) /. 2.0)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(19,21)-(19,58)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (18,6)-(18,62)) FPlus (Bop (Just (18,6)-(18,32)) FDiv (App (Just (18,7)-(18,24)) (Var (Just (18,8)-(18,12)) "eval") [Tuple (Just (18,13)-(18,23)) [Var (Just (18,14)-(18,16)) "e1",Var (Just (18,18)-(18,19)) "x",Var (Just (18,21)-(18,22)) "y"]]) (Lit (Just (18,28)-(18,31)) (LD 2.0))) (Bop (Just (18,36)-(18,62)) FDiv (App (Just (18,37)-(18,54)) (Var (Just (18,38)-(18,42)) "eval") [Tuple (Just (18,43)-(18,53)) [Var (Just (18,44)-(18,46)) "e2",Var (Just (18,48)-(18,49)) "x",Var (Just (18,51)-(18,52)) "y"]]) (Lit (Just (18,58)-(18,61)) (LD 2.0)))
Bop (Just (19,21)-(19,59)) FTimes (App (Just (19,21)-(19,38)) (Var (Just (19,22)-(19,26)) "eval") [Tuple (Just (19,27)-(19,37)) [Var (Just (19,28)-(19,30)) "e1",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,59)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,58)) [Var (Just (19,49)-(19,51)) "e2",Var (Just (19,53)-(19,54)) "x",Var (Just (19,56)-(19,57)) "y"]])
*)

(* typed spans
(18,6)-(18,62)
(19,21)-(19,59)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
