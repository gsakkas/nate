
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
  | MyExpr1 (e1,e2,e3) ->
      ((cos (pi *. (eval (e1, x, y)))) *. (sin (pi *. (eval (e2, x, y))))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> Sine ((eval (e, x, y)) *. 0.5);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

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
  | MyExpr1 (e1,e2,e3) ->
      ((cos (pi *. (eval (e1, x, y)))) *. (sin (pi *. (eval (e2, x, y))))) *.
        (eval (e3, x, y))
  | MyExpr2 e -> sin ((pi *. (eval (e, x, y))) *. 0.5);;

*)

(* changed spans
(30,17)-(30,47)
sin ((pi *. eval (e , x , y)) *. 0.5)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (30,17)-(30,54)) (Var (Just (30,17)-(30,20)) "sin") [Bop (Just (30,21)-(30,54)) FTimes (Bop (Just (30,22)-(30,46)) FTimes (Var (Just (30,23)-(30,25)) "pi") (App (Just (30,29)-(30,45)) (Var (Just (30,30)-(30,34)) "eval") [Tuple (Just (30,35)-(30,44)) [Var (Just (30,36)-(30,37)) "e",Var (Just (30,39)-(30,40)) "x",Var (Just (30,42)-(30,43)) "y"]])) (Lit (Just (30,50)-(30,53)) (LD 0.5))]
*)

(* typed spans
(30,17)-(30,54)
*)

(* correct types
float
*)

(* bad types
expr
*)
