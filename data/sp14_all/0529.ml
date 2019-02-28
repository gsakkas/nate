
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

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
        -. 1.0
  | SinLog (a,b,c) ->
      if c < 0
      then ((log (x *. 100)) ** (sin (x *. 100))) -. 1.0
      else (-1.0) *. (((log (x *. 100)) ** (sin (x *. 100))) -. 1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

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
        -. 1.0
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100.0)) **
           (sin ((eval (b, x, y)) *. 100.0)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100.0)) **
              (sin ((eval (a, x, y)) *. 100.0)))
             -. 1.0);;

*)

(* changed spans
(33,9)-(33,10)
eval (c , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,11)-(34,56)
0.0
LitG

(34,18)-(34,19)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,23)-(34,26)
y
VarG

(34,32)-(34,48)
100.0
LitG

(34,38)-(34,39)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,43)-(34,46)
y
VarG

(34,53)-(34,56)
100.0
LitG

(35,29)-(35,30)
eval (b , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,34)-(35,37)
y
VarG

(35,43)-(35,59)
100.0
LitG

(35,49)-(35,50)
eval (a , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,54)-(35,57)
y
VarG

(35,64)-(35,67)
100.0
LitG

*)

(* changed exprs
App (Just (33,9)-(33,25)) (Var (Just (33,10)-(33,14)) "eval") [Tuple (Just (33,15)-(33,24)) [Var (Just (33,16)-(33,17)) "c",Var (Just (33,19)-(33,20)) "x",Var (Just (33,22)-(33,23)) "y"]]
Lit (Just (33,28)-(33,31)) (LD 0.0)
App (Just (35,15)-(35,31)) (Var (Just (35,16)-(35,20)) "eval") [Tuple (Just (35,21)-(35,30)) [Var (Just (35,22)-(35,23)) "a",Var (Just (35,25)-(35,26)) "x",Var (Just (35,28)-(35,29)) "y"]]
Var (Just (35,28)-(35,29)) "y"
Lit (Just (35,35)-(35,40)) (LD 100.0)
App (Just (36,17)-(36,33)) (Var (Just (36,18)-(36,22)) "eval") [Tuple (Just (36,23)-(36,32)) [Var (Just (36,24)-(36,25)) "b",Var (Just (36,27)-(36,28)) "x",Var (Just (36,30)-(36,31)) "y"]]
Var (Just (36,30)-(36,31)) "y"
Lit (Just (36,37)-(36,42)) (LD 100.0)
App (Just (40,18)-(40,34)) (Var (Just (40,19)-(40,23)) "eval") [Tuple (Just (40,24)-(40,33)) [Var (Just (40,25)-(40,26)) "b",Var (Just (40,28)-(40,29)) "x",Var (Just (40,31)-(40,32)) "y"]]
Var (Just (40,31)-(40,32)) "y"
Lit (Just (40,38)-(40,43)) (LD 100.0)
App (Just (41,20)-(41,36)) (Var (Just (41,21)-(41,25)) "eval") [Tuple (Just (41,26)-(41,35)) [Var (Just (41,27)-(41,28)) "a",Var (Just (41,30)-(41,31)) "x",Var (Just (41,33)-(41,34)) "y"]]
Var (Just (41,33)-(41,34)) "y"
Lit (Just (41,40)-(41,45)) (LD 100.0)
*)

(* typed spans
(33,9)-(33,25)
(33,28)-(33,31)
(35,15)-(35,31)
(35,28)-(35,29)
(35,35)-(35,40)
(36,17)-(36,33)
(36,30)-(36,31)
(36,37)-(36,42)
(40,18)-(40,34)
(40,31)-(40,32)
(40,38)-(40,43)
(41,20)-(41,36)
(41,33)-(41,34)
(41,40)-(41,45)
*)

(* correct types
float
float
float
float
float
float
float
float
float
float
float
float
float
float
*)

(* bad types
expr
float
float
int
float
float
int
float
float
int
float
float
int
float
*)
