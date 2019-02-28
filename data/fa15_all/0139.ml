
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (exprToString eval (e2, x, y))) / 2
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(37,6)-(37,63)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(38,39)-(38,40)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(38,22)-(38,34)
eval
VarG

(38,22)-(38,34)
(e1 , x , y)
TupleG (fromList [VarG])

(38,41)-(38,66)
x
VarG

(38,42)-(38,45)
y
VarG

(38,49)-(38,61)
eval
VarG

(38,49)-(38,61)
(e2 , x , y)
TupleG (fromList [VarG])

(40,6)-(45,79)
x
VarG

(41,27)-(41,28)
y
VarG

(41,27)-(41,28)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(41,10)-(41,22)
eval
VarG

(41,10)-(41,22)
(e1 , x , y)
TupleG (fromList [VarG])

(42,11)-(45,78)
x
VarG

(43,33)-(43,34)
y
VarG

(43,16)-(43,28)
eval
VarG

(43,16)-(43,28)
(e2 , x , y)
TupleG (fromList [VarG])

(44,17)-(45,76)
x
VarG

(45,39)-(45,40)
y
VarG

(45,22)-(45,34)
eval
VarG

(45,22)-(45,34)
(e3 , x , y)
TupleG (fromList [VarG])

(45,41)-(45,74)
x
VarG

(45,67)-(45,68)
y
VarG

(45,50)-(45,62)
eval
VarG

(45,50)-(45,62)
(e4 , x , y)
TupleG (fromList [VarG])

(45,69)-(45,72)
x
VarG

(45,69)-(45,72)
y
VarG

*)

(* changed exprs
Bop (Just (19,23)-(19,70)) FDiv (Bop (Just (19,23)-(19,63)) FPlus (App (Just (19,24)-(19,41)) (Var (Just (19,25)-(19,29)) "eval") [Tuple (Just (19,30)-(19,40)) [Var (Just (19,31)-(19,33)) "e1",Var (Just (19,35)-(19,36)) "x",Var (Just (19,38)-(19,39)) "y"]]) (App (Just (19,45)-(19,62)) (Var (Just (19,46)-(19,50)) "eval") [Tuple (Just (19,51)-(19,61)) [Var (Just (19,52)-(19,54)) "e2",Var (Just (19,56)-(19,57)) "x",Var (Just (19,59)-(19,60)) "y"]])) (Lit (Just (19,67)-(19,70)) (LD 2.0))
Bop (Just (20,21)-(20,59)) FTimes (App (Just (20,21)-(20,38)) (Var (Just (20,22)-(20,26)) "eval") [Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]]) (App (Just (20,42)-(20,59)) (Var (Just (20,43)-(20,47)) "eval") [Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]])
Var (Just (20,22)-(20,26)) "eval"
Tuple (Just (20,27)-(20,37)) [Var (Just (20,28)-(20,30)) "e1",Var (Just (20,32)-(20,33)) "x",Var (Just (20,35)-(20,36)) "y"]
Var (Just (20,32)-(20,33)) "x"
Var (Just (20,35)-(20,36)) "y"
Var (Just (20,43)-(20,47)) "eval"
Tuple (Just (20,48)-(20,58)) [Var (Just (20,49)-(20,51)) "e2",Var (Just (20,53)-(20,54)) "x",Var (Just (20,56)-(20,57)) "y"]
Var (Just (20,53)-(20,54)) "x"
Var (Just (20,56)-(20,57)) "y"
Ite (Just (22,6)-(24,26)) (Bop (Just (22,9)-(22,46)) Lt (App (Just (22,9)-(22,26)) (Var (Just (22,10)-(22,14)) "eval") [Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "e1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]]) (App (Just (22,29)-(22,46)) (Var (Just (22,30)-(22,34)) "eval") [Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "e2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]])) (App (Just (23,11)-(23,26)) (Var (Just (23,11)-(23,15)) "eval") [Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]]) (App (Just (24,11)-(24,26)) (Var (Just (24,11)-(24,15)) "eval") [Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "e4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]])
Var (Just (22,10)-(22,14)) "eval"
Tuple (Just (22,15)-(22,25)) [Var (Just (22,16)-(22,18)) "e1",Var (Just (22,20)-(22,21)) "x",Var (Just (22,23)-(22,24)) "y"]
Var (Just (22,20)-(22,21)) "x"
Var (Just (22,23)-(22,24)) "y"
Var (Just (22,30)-(22,34)) "eval"
Tuple (Just (22,35)-(22,45)) [Var (Just (22,36)-(22,38)) "e2",Var (Just (22,40)-(22,41)) "x",Var (Just (22,43)-(22,44)) "y"]
Var (Just (22,40)-(22,41)) "x"
Var (Just (22,43)-(22,44)) "y"
Var (Just (23,11)-(23,15)) "eval"
Tuple (Just (23,16)-(23,26)) [Var (Just (23,17)-(23,19)) "e3",Var (Just (23,21)-(23,22)) "x",Var (Just (23,24)-(23,25)) "y"]
Var (Just (23,21)-(23,22)) "x"
Var (Just (23,24)-(23,25)) "y"
Var (Just (24,11)-(24,15)) "eval"
Tuple (Just (24,16)-(24,26)) [Var (Just (24,17)-(24,19)) "e4",Var (Just (24,21)-(24,22)) "x",Var (Just (24,24)-(24,25)) "y"]
Var (Just (24,21)-(24,22)) "x"
Var (Just (24,24)-(24,25)) "y"
*)

(* typed spans
(19,23)-(19,70)
(20,21)-(20,59)
(20,22)-(20,26)
(20,27)-(20,37)
(20,32)-(20,33)
(20,35)-(20,36)
(20,43)-(20,47)
(20,48)-(20,58)
(20,53)-(20,54)
(20,56)-(20,57)
(22,6)-(24,26)
(22,10)-(22,14)
(22,15)-(22,25)
(22,20)-(22,21)
(22,23)-(22,24)
(22,30)-(22,34)
(22,35)-(22,45)
(22,40)-(22,41)
(22,43)-(22,44)
(23,11)-(23,15)
(23,16)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(24,11)-(24,15)
(24,16)-(24,26)
(24,21)-(24,22)
(24,24)-(24,25)
*)

(* correct types
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
(expr * float * float) -> float
(expr * float * float)
float
float
*)

(* bad types
int
string -> string -> string
expr -> string
expr -> string
string
string
expr -> string
expr -> string
string
string -> string -> string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string -> string -> string
expr -> string
expr -> string
string
string
*)
