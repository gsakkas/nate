
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(50,10)-(52,40)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(50,10)-(52,40)
buildTheThing (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(54,8)-(56,40)
buildTheThing
VarG

(54,8)-(56,40)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(54,8)-(56,40)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(54,8)-(56,40)
build
VarG

(54,8)-(56,40)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(54,8)-(56,40)
rand
VarG

(54,8)-(56,40)
depth - 1
BopG VarG LitG

(54,8)-(56,40)
depth
VarG

(54,8)-(56,40)
1
LitG

(54,8)-(56,40)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(54,8)-(56,40)
build
VarG

(54,8)-(56,40)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(54,8)-(56,40)
rand
VarG

(54,8)-(56,40)
depth - 1
BopG VarG LitG

(54,8)-(56,40)
depth
VarG

(54,8)-(56,40)
1
LitG

(54,8)-(56,40)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(54,8)-(56,40)
build
VarG

(54,8)-(56,40)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(54,8)-(56,40)
rand
VarG

(54,8)-(56,40)
depth - 1
BopG VarG LitG

(54,8)-(56,40)
depth
VarG

(54,8)-(56,40)
1
LitG

*)

(* changed exprs
Tuple (Just (50,10)-(50,68)) [App (Just (50,11)-(50,38)) (Var (Just (50,12)-(50,17)) "build") [Tuple (Just (50,18)-(50,37)) [Var (Just (50,19)-(50,23)) "rand",Bop (Just (50,25)-(50,36)) Minus (Var (Just (50,26)-(50,31)) "depth") (Lit (Just (50,34)-(50,35)) (LI 1))]],App (Just (50,40)-(50,67)) (Var (Just (50,41)-(50,46)) "build") [Tuple (Just (50,47)-(50,66)) [Var (Just (50,48)-(50,52)) "rand",Bop (Just (50,54)-(50,65)) Minus (Var (Just (50,55)-(50,60)) "depth") (Lit (Just (50,63)-(50,64)) (LI 1))]]]
App (Just (52,8)-(54,40)) (Var (Just (52,8)-(52,21)) "buildTheThing") [Tuple (Just (53,10)-(54,40)) [App (Just (53,11)-(53,38)) (Var (Just (53,12)-(53,17)) "build") [Tuple (Just (53,18)-(53,37)) [Var (Just (53,19)-(53,23)) "rand",Bop (Just (53,25)-(53,36)) Minus (Var (Just (53,26)-(53,31)) "depth") (Lit (Just (53,34)-(53,35)) (LI 1))]],App (Just (53,40)-(53,67)) (Var (Just (53,41)-(53,46)) "build") [Tuple (Just (53,47)-(53,66)) [Var (Just (53,48)-(53,52)) "rand",Bop (Just (53,54)-(53,65)) Minus (Var (Just (53,55)-(53,60)) "depth") (Lit (Just (53,63)-(53,64)) (LI 1))]],App (Just (54,12)-(54,39)) (Var (Just (54,13)-(54,18)) "build") [Tuple (Just (54,19)-(54,38)) [Var (Just (54,20)-(54,24)) "rand",Bop (Just (54,26)-(54,37)) Minus (Var (Just (54,27)-(54,32)) "depth") (Lit (Just (54,35)-(54,36)) (LI 1))]]]]
Var (Just (52,8)-(52,21)) "buildTheThing"
Tuple (Just (53,10)-(54,40)) [App (Just (53,11)-(53,38)) (Var (Just (53,12)-(53,17)) "build") [Tuple (Just (53,18)-(53,37)) [Var (Just (53,19)-(53,23)) "rand",Bop (Just (53,25)-(53,36)) Minus (Var (Just (53,26)-(53,31)) "depth") (Lit (Just (53,34)-(53,35)) (LI 1))]],App (Just (53,40)-(53,67)) (Var (Just (53,41)-(53,46)) "build") [Tuple (Just (53,47)-(53,66)) [Var (Just (53,48)-(53,52)) "rand",Bop (Just (53,54)-(53,65)) Minus (Var (Just (53,55)-(53,60)) "depth") (Lit (Just (53,63)-(53,64)) (LI 1))]],App (Just (54,12)-(54,39)) (Var (Just (54,13)-(54,18)) "build") [Tuple (Just (54,19)-(54,38)) [Var (Just (54,20)-(54,24)) "rand",Bop (Just (54,26)-(54,37)) Minus (Var (Just (54,27)-(54,32)) "depth") (Lit (Just (54,35)-(54,36)) (LI 1))]]]
App (Just (53,11)-(53,38)) (Var (Just (53,12)-(53,17)) "build") [Tuple (Just (53,18)-(53,37)) [Var (Just (53,19)-(53,23)) "rand",Bop (Just (53,25)-(53,36)) Minus (Var (Just (53,26)-(53,31)) "depth") (Lit (Just (53,34)-(53,35)) (LI 1))]]
Var (Just (53,12)-(53,17)) "build"
Tuple (Just (53,18)-(53,37)) [Var (Just (53,19)-(53,23)) "rand",Bop (Just (53,25)-(53,36)) Minus (Var (Just (53,26)-(53,31)) "depth") (Lit (Just (53,34)-(53,35)) (LI 1))]
Var (Just (53,19)-(53,23)) "rand"
Bop (Just (53,25)-(53,36)) Minus (Var (Just (53,26)-(53,31)) "depth") (Lit (Just (53,34)-(53,35)) (LI 1))
Var (Just (53,26)-(53,31)) "depth"
Lit (Just (53,34)-(53,35)) (LI 1)
App (Just (53,40)-(53,67)) (Var (Just (53,41)-(53,46)) "build") [Tuple (Just (53,47)-(53,66)) [Var (Just (53,48)-(53,52)) "rand",Bop (Just (53,54)-(53,65)) Minus (Var (Just (53,55)-(53,60)) "depth") (Lit (Just (53,63)-(53,64)) (LI 1))]]
Var (Just (53,41)-(53,46)) "build"
Tuple (Just (53,47)-(53,66)) [Var (Just (53,48)-(53,52)) "rand",Bop (Just (53,54)-(53,65)) Minus (Var (Just (53,55)-(53,60)) "depth") (Lit (Just (53,63)-(53,64)) (LI 1))]
Var (Just (53,48)-(53,52)) "rand"
Bop (Just (53,54)-(53,65)) Minus (Var (Just (53,55)-(53,60)) "depth") (Lit (Just (53,63)-(53,64)) (LI 1))
Var (Just (53,55)-(53,60)) "depth"
Lit (Just (53,63)-(53,64)) (LI 1)
App (Just (54,12)-(54,39)) (Var (Just (54,13)-(54,18)) "build") [Tuple (Just (54,19)-(54,38)) [Var (Just (54,20)-(54,24)) "rand",Bop (Just (54,26)-(54,37)) Minus (Var (Just (54,27)-(54,32)) "depth") (Lit (Just (54,35)-(54,36)) (LI 1))]]
Var (Just (54,13)-(54,18)) "build"
Tuple (Just (54,19)-(54,38)) [Var (Just (54,20)-(54,24)) "rand",Bop (Just (54,26)-(54,37)) Minus (Var (Just (54,27)-(54,32)) "depth") (Lit (Just (54,35)-(54,36)) (LI 1))]
Var (Just (54,20)-(54,24)) "rand"
Bop (Just (54,26)-(54,37)) Minus (Var (Just (54,27)-(54,32)) "depth") (Lit (Just (54,35)-(54,36)) (LI 1))
Var (Just (54,27)-(54,32)) "depth"
Lit (Just (54,35)-(54,36)) (LI 1)
*)

(* typed spans
(50,10)-(50,68)
(52,8)-(54,40)
(52,8)-(52,21)
(53,10)-(54,40)
(53,11)-(53,38)
(53,12)-(53,17)
(53,18)-(53,37)
(53,19)-(53,23)
(53,25)-(53,36)
(53,26)-(53,31)
(53,34)-(53,35)
(53,40)-(53,67)
(53,41)-(53,46)
(53,47)-(53,66)
(53,48)-(53,52)
(53,54)-(53,65)
(53,55)-(53,60)
(53,63)-(53,64)
(54,12)-(54,39)
(54,13)-(54,18)
(54,19)-(54,38)
(54,20)-(54,24)
(54,26)-(54,37)
(54,27)-(54,32)
(54,35)-(54,36)
*)

(* correct types
(expr * expr)
expr
(expr * expr * expr) -> expr
(expr * expr * expr)
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
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
*)

(* bad types
(expr * expr * expr * expr * expr)
(expr * expr * expr * expr * expr)
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
