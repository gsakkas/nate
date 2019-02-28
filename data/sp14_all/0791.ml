
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Op1 e ->
      (tan (pi *. (eval (e, x, y)))) -.
        ((tan (pi *. (eval (e, x, y)))) / 2.0)
  | Op2 (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (eval (e1, x, y)) -. (eval (e2, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Op1 e ->
      (tan (pi *. (eval (e, x, y)))) -.
        ((tan (pi *. (eval (e, x, y)))) /. 2.0)
  | Op2 (e1,e2,e3) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e3, x, y)
      else (eval (e1, x, y)) -. (eval (e2, x, y));;

*)

(* changed spans
(29,8)-(29,46)
tan (pi *. eval (e , x , y)) /. 2.0
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (29,8)-(29,47)) FDiv (App (Just (29,9)-(29,39)) (Var (Just (29,10)-(29,13)) "tan") [Bop (Just (29,14)-(29,38)) FTimes (Var (Just (29,15)-(29,17)) "pi") (App (Just (29,21)-(29,37)) (Var (Just (29,22)-(29,26)) "eval") [Tuple (Just (29,27)-(29,36)) [Var (Just (29,28)-(29,29)) "e",Var (Just (29,31)-(29,32)) "x",Var (Just (29,34)-(29,35)) "y"]])]) (Lit (Just (29,43)-(29,46)) (LD 2.0))
*)

(* typed spans
(29,8)-(29,47)
*)

(* correct types
float
*)

(* bad types
int
*)
