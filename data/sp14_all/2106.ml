
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine ((build (rand, (depth - 1))) * (buildY ()))
     | 2 -> buildCosine ((build (rand, (depth - 1))) * (buildX ()))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ()
  else
    (match rand (1, 5) with
     | 1 -> buildSine (build (rand, (depth - 1)))
     | 2 -> buildCosine (build (rand, (depth - 1)))
     | 3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(30,22)-(30,65)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,22)-(30,65)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(31,12)-(31,67)
buildCosine
VarG

(31,12)-(31,67)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(31,12)-(31,67)
build
VarG

(31,12)-(31,67)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(31,12)-(31,67)
rand
VarG

(31,12)-(31,67)
depth - 1
BopG VarG LitG

(31,12)-(31,67)
depth
VarG

(31,12)-(31,67)
1
LitG

(31,12)-(31,67)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(33,9)-(34,69)
buildAverage
VarG

(33,9)-(34,69)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(33,9)-(34,69)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(33,9)-(34,69)
build
VarG

(33,9)-(34,69)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(33,9)-(34,69)
rand
VarG

(33,9)-(34,69)
depth - 1
BopG VarG LitG

(33,9)-(34,69)
depth
VarG

(33,9)-(34,69)
1
LitG

(33,9)-(34,69)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(33,9)-(34,69)
build
VarG

(33,9)-(34,69)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(33,9)-(34,69)
rand
VarG

(33,9)-(34,69)
depth - 1
BopG VarG LitG

(33,9)-(34,69)
depth
VarG

(33,9)-(34,69)
1
LitG

*)

(* changed exprs
App (Just (30,22)-(30,49)) (Var (Just (30,23)-(30,28)) "build") [Tuple (Just (30,29)-(30,48)) [Var (Just (30,30)-(30,34)) "rand",Bop (Just (30,36)-(30,47)) Minus (Var (Just (30,37)-(30,42)) "depth") (Lit (Just (30,45)-(30,46)) (LI 1))]]
App (Just (31,12)-(31,51)) (Var (Just (31,12)-(31,23)) "buildCosine") [App (Just (31,24)-(31,51)) (Var (Just (31,25)-(31,30)) "build") [Tuple (Just (31,31)-(31,50)) [Var (Just (31,32)-(31,36)) "rand",Bop (Just (31,38)-(31,49)) Minus (Var (Just (31,39)-(31,44)) "depth") (Lit (Just (31,47)-(31,48)) (LI 1))]]]
Var (Just (31,12)-(31,23)) "buildCosine"
App (Just (31,24)-(31,51)) (Var (Just (31,25)-(31,30)) "build") [Tuple (Just (31,31)-(31,50)) [Var (Just (31,32)-(31,36)) "rand",Bop (Just (31,38)-(31,49)) Minus (Var (Just (31,39)-(31,44)) "depth") (Lit (Just (31,47)-(31,48)) (LI 1))]]
Var (Just (31,25)-(31,30)) "build"
Tuple (Just (31,31)-(31,50)) [Var (Just (31,32)-(31,36)) "rand",Bop (Just (31,38)-(31,49)) Minus (Var (Just (31,39)-(31,44)) "depth") (Lit (Just (31,47)-(31,48)) (LI 1))]
Var (Just (31,32)-(31,36)) "rand"
Bop (Just (31,38)-(31,49)) Minus (Var (Just (31,39)-(31,44)) "depth") (Lit (Just (31,47)-(31,48)) (LI 1))
Var (Just (31,39)-(31,44)) "depth"
Lit (Just (31,47)-(31,48)) (LI 1)
App (Just (33,9)-(34,69)) (Var (Just (33,9)-(33,21)) "buildAverage") [Tuple (Just (34,11)-(34,69)) [App (Just (34,12)-(34,39)) (Var (Just (34,13)-(34,18)) "build") [Tuple (Just (34,19)-(34,38)) [Var (Just (34,20)-(34,24)) "rand",Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 1))]],App (Just (34,41)-(34,68)) (Var (Just (34,42)-(34,47)) "build") [Tuple (Just (34,48)-(34,67)) [Var (Just (34,49)-(34,53)) "rand",Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 1))]]]]
Var (Just (33,9)-(33,21)) "buildAverage"
Tuple (Just (34,11)-(34,69)) [App (Just (34,12)-(34,39)) (Var (Just (34,13)-(34,18)) "build") [Tuple (Just (34,19)-(34,38)) [Var (Just (34,20)-(34,24)) "rand",Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 1))]],App (Just (34,41)-(34,68)) (Var (Just (34,42)-(34,47)) "build") [Tuple (Just (34,48)-(34,67)) [Var (Just (34,49)-(34,53)) "rand",Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 1))]]]
App (Just (34,12)-(34,39)) (Var (Just (34,13)-(34,18)) "build") [Tuple (Just (34,19)-(34,38)) [Var (Just (34,20)-(34,24)) "rand",Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 1))]]
Var (Just (34,13)-(34,18)) "build"
Tuple (Just (34,19)-(34,38)) [Var (Just (34,20)-(34,24)) "rand",Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 1))]
Var (Just (34,20)-(34,24)) "rand"
Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 1))
Var (Just (34,27)-(34,32)) "depth"
Lit (Just (34,35)-(34,36)) (LI 1)
App (Just (34,41)-(34,68)) (Var (Just (34,42)-(34,47)) "build") [Tuple (Just (34,48)-(34,67)) [Var (Just (34,49)-(34,53)) "rand",Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 1))]]
Var (Just (34,42)-(34,47)) "build"
Tuple (Just (34,48)-(34,67)) [Var (Just (34,49)-(34,53)) "rand",Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 1))]
Var (Just (34,49)-(34,53)) "rand"
Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 1))
Var (Just (34,56)-(34,61)) "depth"
Lit (Just (34,64)-(34,65)) (LI 1)
*)

(* typed spans
(30,22)-(30,49)
(31,12)-(31,51)
(31,12)-(31,23)
(31,24)-(31,51)
(31,25)-(31,30)
(31,31)-(31,50)
(31,32)-(31,36)
(31,38)-(31,49)
(31,39)-(31,44)
(31,47)-(31,48)
(33,9)-(34,69)
(33,9)-(33,21)
(34,11)-(34,69)
(34,12)-(34,39)
(34,13)-(34,18)
(34,19)-(34,38)
(34,20)-(34,24)
(34,26)-(34,37)
(34,27)-(34,32)
(34,35)-(34,36)
(34,41)-(34,68)
(34,42)-(34,47)
(34,48)-(34,67)
(34,49)-(34,53)
(34,55)-(34,66)
(34,56)-(34,61)
(34,64)-(34,65)
*)

(* correct types
expr
expr
expr -> expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
expr
(expr * expr) -> expr
(expr * expr)
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
*)

(* bad types
int
int
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
*)
