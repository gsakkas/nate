
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Wavvy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Tan e1 -> 1 * (eval (e1, x, y))
  | Wavvy (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) -. (eval (e2, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Wavvy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Tan e1 -> 1.0 *. (eval (e1, x, y))
  | Wavvy (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) -. (eval (e2, x, y)));;

*)

(* changed spans
(27,14)-(27,35)
1.0 *. eval (e1 , x , y)
BopG LitG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (27,14)-(27,38)) FTimes (Lit (Just (27,14)-(27,17)) (LD 1.0)) (App (Just (27,21)-(27,38)) (Var (Just (27,22)-(27,26)) "eval") [Tuple (Just (27,27)-(27,37)) [Var (Just (27,28)-(27,30)) "e1",Var (Just (27,32)-(27,33)) "x",Var (Just (27,35)-(27,36)) "y"]])
*)

(* typed spans
(27,14)-(27,38)
*)

(* correct types
float
*)

(* bad types
int
*)
