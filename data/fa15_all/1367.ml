
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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) / 2)
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(19,23)-(19,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,21)-(20,38)
eval (t1 , x , y) *. eval (t2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,41)-(20,66)
eval (t2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(20,41)-(20,66)
eval
VarG

(20,41)-(20,66)
(t2 , x , y)
TupleG (fromList [VarG])

(20,41)-(20,66)
t2
VarG

(20,41)-(20,66)
x
VarG

(20,41)-(20,66)
y
VarG

(22,6)-(27,81)
if eval (th1 , x , y) < eval (th2 , x , y)
then eval (th3 , x , y)
else eval (th4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "t1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "t2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "t2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]]
Var (Just (20,43)-(20,47)) "eval"
Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "t2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]
Var (Just (20,49)-(20,51)) "t2"
Var (Just (20,53)-(20,54)) "x"
Var (Just (20,56)-(20,57)) "y"
Ite (Just (22,6)-(24,27)) (Bop (Just (22,9)-(22,48)) Lt (App (Just (22,9)-(22,27)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,26)) [Var (Just (22,16)-(22,19)) "th1",Var (Just (22,21)-(22,22)) "x",Var (Just (22,24)-(22,25)) "y"]]) (App (Just (22,30)-(22,48)) (Var (Just (22,31)-(22,35)) "eval") [Tuple (Just (22,36)-(22,47)) [Var (Just (22,37)-(22,40)) "th2",Var (Just (22,42)-(22,43)) "x",Var (Just (22,45)-(22,46)) "y"]])) (App (Just (23,11)-(23,27)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,27)) [Var (Just (23,17)-(23,20)) "th3",Var (Just (23,22)-(23,23)) "x",Var (Just (23,25)-(23,26)) "y"]]) (App (Just (24,11)-(24,27)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,27)) [Var (Just (24,17)-(24,20)) "th4",Var (Just (24,22)-(24,23)) "x",Var (Just (24,25)-(24,26)) "y"]])
*)

(* typed spans
(19,23)-(19,70)
(20,21)-(20,59)
(20,42)-(20,59)
(20,43)-(20,47)
(20,48)-(20,58)
(20,49)-(20,51)
(20,53)-(20,54)
(20,56)-(20,57)
(22,6)-(24,27)
*)

(* correct types
float
float
float
(expr * float * float) -> float
(expr * float * float)
expr
float
float
float
*)

(* bad types
float
float
'a
'a
'a
'a
'a
'a
string
*)
