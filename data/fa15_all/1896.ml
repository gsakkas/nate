
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SqDist (a,b) -> ((eval (a, x, y)) ** 2.0) + ((eval (b, x, y)) ** 2.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SqDist (a,b) -> ((eval (a, x, y)) ** 2.0) +. ((eval (b, x, y)) ** 2.0);;

*)

(* changed spans
(26,20)-(26,73)
(eval (a , x , y) ** 2.0) +. (eval (b , x , y) ** 2.0)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (26,20)-(26,74)) FPlus (App (Just (26,20)-(26,45)) (Var (Just (26,38)-(26,40)) "**") [App (Just (26,21)-(26,37)) (Var (Just (26,22)-(26,26)) "eval") [Tuple (Just (26,27)-(26,36)) [Var (Just (26,28)-(26,29)) "a",Var (Just (26,31)-(26,32)) "x",Var (Just (26,34)-(26,35)) "y"]],Lit (Just (26,41)-(26,44)) (LD 2.0)]) (App (Just (26,49)-(26,74)) (Var (Just (26,67)-(26,69)) "**") [App (Just (26,50)-(26,66)) (Var (Just (26,51)-(26,55)) "eval") [Tuple (Just (26,56)-(26,65)) [Var (Just (26,57)-(26,58)) "b",Var (Just (26,60)-(26,61)) "x",Var (Just (26,63)-(26,64)) "y"]],Lit (Just (26,70)-(26,73)) (LD 2.0)])
*)

(* typed spans
(26,20)-(26,74)
*)

(* correct types
float
*)

(* bad types
int
*)
