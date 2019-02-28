
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | Super of expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (v,w,q,r) ->
      if (eval (v, x, y)) < (eval (w, x, y))
      then eval (q, x, y)
      else eval (r, x, y)
  | Divide (v,w) -> (eval (v, x, y)) / (eval (w, x, y))
  | Super (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) * (eval (v, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | Super of expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (v,w,q,r) ->
      if (eval (v, x, y)) < (eval (w, x, y))
      then eval (q, x, y)
      else eval (r, x, y)
  | Divide (v,w) -> (eval (v, x, y)) /. (eval (w, x, y))
  | Super (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) *. (eval (v, x, y));;

*)

(* changed spans
(26,20)-(26,55)
eval (v , x , y) /. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,19)-(27,75)
(eval (v , x , y) +. eval (w , x , y)) *. eval (v , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (26,20)-(26,56)) FDiv (App (Just (26,20)-(26,36)) (Var (Just (26,21)-(26,25)) "eval") [Tuple (Just (26,26)-(26,35)) [Var (Just (26,27)-(26,28)) "v",Var (Just (26,30)-(26,31)) "x",Var (Just (26,33)-(26,34)) "y"]]) (App (Just (26,40)-(26,56)) (Var (Just (26,41)-(26,45)) "eval") [Tuple (Just (26,46)-(26,55)) [Var (Just (26,47)-(26,48)) "w",Var (Just (26,50)-(26,51)) "x",Var (Just (26,53)-(26,54)) "y"]])
Bop (Just (27,19)-(27,77)) FTimes (Bop (Just (27,19)-(27,57)) FPlus (App (Just (27,20)-(27,36)) (Var (Just (27,21)-(27,25)) "eval") [Tuple (Just (27,26)-(27,35)) [Var (Just (27,27)-(27,28)) "v",Var (Just (27,30)-(27,31)) "x",Var (Just (27,33)-(27,34)) "y"]]) (App (Just (27,40)-(27,56)) (Var (Just (27,41)-(27,45)) "eval") [Tuple (Just (27,46)-(27,55)) [Var (Just (27,47)-(27,48)) "w",Var (Just (27,50)-(27,51)) "x",Var (Just (27,53)-(27,54)) "y"]])) (App (Just (27,61)-(27,77)) (Var (Just (27,62)-(27,66)) "eval") [Tuple (Just (27,67)-(27,76)) [Var (Just (27,68)-(27,69)) "v",Var (Just (27,71)-(27,72)) "x",Var (Just (27,74)-(27,75)) "y"]])
*)

(* typed spans
(26,20)-(26,56)
(27,19)-(27,77)
*)

(* correct types
float
float
*)

(* bad types
int
int
*)
