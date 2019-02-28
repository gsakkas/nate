
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) / 2.;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.;;

*)

(* changed spans
(19,21)-(19,64)
(eval (m , x , y) +. eval (n , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (19,21)-(19,65)) FDiv (Bop (Just (19,21)-(19,59)) FPlus (App (Just (19,22)-(19,38)) (Var (Just (19,23)-(19,27)) "eval") [Tuple (Just (19,28)-(19,37)) [Var (Just (19,29)-(19,30)) "m",Var (Just (19,32)-(19,33)) "x",Var (Just (19,35)-(19,36)) "y"]]) (App (Just (19,42)-(19,58)) (Var (Just (19,43)-(19,47)) "eval") [Tuple (Just (19,48)-(19,57)) [Var (Just (19,49)-(19,50)) "n",Var (Just (19,52)-(19,53)) "x",Var (Just (19,55)-(19,56)) "y"]])) (Lit (Just (19,63)-(19,65)) (LD 2.0))
*)

(* typed spans
(19,21)-(19,65)
*)

(* correct types
float
*)

(* bad types
int
*)
