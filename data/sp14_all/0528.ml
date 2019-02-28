
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        - 1.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0;;

*)

(* changed spans
(27,6)-(30,13)
(2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (27,6)-(30,14)) FMinus (App (Just (27,6)-(29,20)) (Var (Just (27,12)-(27,14)) "**") [Lit (Just (27,7)-(27,11)) (LD 2.71),Bop (Just (28,9)-(29,19)) FMinus (Bop (Just (28,10)-(28,76)) FPlus (App (Just (28,11)-(28,41)) (Var (Just (28,12)-(28,15)) "sin") [Bop (Just (28,16)-(28,40)) FTimes (Var (Just (28,17)-(28,19)) "pi") (App (Just (28,23)-(28,39)) (Var (Just (28,24)-(28,28)) "eval") [Tuple (Just (28,29)-(28,38)) [Var (Just (28,30)-(28,31)) "a",Var (Just (28,33)-(28,34)) "x",Var (Just (28,36)-(28,37)) "y"]])]) (App (Just (28,45)-(28,75)) (Var (Just (28,46)-(28,49)) "cos") [Bop (Just (28,50)-(28,74)) FTimes (Var (Just (28,51)-(28,53)) "pi") (App (Just (28,57)-(28,73)) (Var (Just (28,58)-(28,62)) "eval") [Tuple (Just (28,63)-(28,72)) [Var (Just (28,64)-(28,65)) "b",Var (Just (28,67)-(28,68)) "x",Var (Just (28,70)-(28,71)) "y"]])])) (Lit (Just (29,15)-(29,18)) (LD 1.0))]) (Lit (Just (30,11)-(30,14)) (LD 1.0))
*)

(* typed spans
(27,6)-(30,14)
*)

(* correct types
float
*)

(* bad types
int
*)
