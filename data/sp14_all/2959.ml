
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
  | Sine e' -> sin (pi *. (eval (e' (e', x, y))))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
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

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,32)-(17,47)
(e' , x , y)
TupleG (fromList [VarG])

(18,23)-(18,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Tuple (Just (17,32)-(17,42)) [Var (Just (17,33)-(17,35)) "e'",Var (Just (17,37)-(17,38)) "x",Var (Just (17,40)-(17,41)) "y"]
Bop (Just (18,23)-(18,70)) FDiv (Bop (Just (18,23)-(18,63)) FPlus (App (Just (18,24)-(18,41)) (Var (Just (18,25)-(18,29)) "eval") [Tuple (Just (18,30)-(18,40)) [Var (Just (18,31)-(18,33)) "e1",Var (Just (18,35)-(18,36)) "x",Var (Just (18,38)-(18,39)) "y"]]) (App (Just (18,45)-(18,62)) (Var (Just (18,46)-(18,50)) "eval") [Tuple (Just (18,51)-(18,61)) [Var (Just (18,52)-(18,54)) "e2",Var (Just (18,56)-(18,57)) "x",Var (Just (18,59)-(18,60)) "y"]])) (Lit (Just (18,67)-(18,70)) (LD 2.0))
*)

(* typed spans
(17,32)-(17,42)
(18,23)-(18,70)
*)

(* correct types
(expr * float * float)
float
*)

(* bad types
(expr * float * float)
int
*)
