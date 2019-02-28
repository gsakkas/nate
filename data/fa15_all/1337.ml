
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCirc (c1,c2) = Circ (c1, c2);;

let buildCosine e = Cosine e;;

let buildOscillate n = Oscillate n;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 2) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 25) with
     | 0 ->
         if depth < 5
         then buildX ()
         else
           buildCirc
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 1 ->
         if depth < 5
         then buildY ()
         else
           buildCirc
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 2|7|8 -> buildSine (build (rand, (depth - 1)))
     | 3|9|13 -> buildCosine (build (rand, (depth - 1)))
     | 4|10|14 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5|11|15 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6|12 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 17|18|19|23|25 -> buildCirc (build (rand, (depth - 1)))
     | 20|21|22|16 -> buildOscillate (build (rand, (depth - 1)))
     | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr
  | Oscillate of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCirc c1 = Circ c1;;

let buildCosine e = Cosine e;;

let buildOscillate n = Oscillate n;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 2) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 25) with
     | 0 ->
         if depth < 5
         then buildX ()
         else buildCirc (build (rand, (depth - 1)))
     | 1 ->
         if depth < 5
         then buildY ()
         else buildCirc (build (rand, (depth - 1)))
     | 2|7|8 -> buildSine (build (rand, (depth - 1)))
     | 3|9|13 -> buildCosine (build (rand, (depth - 1)))
     | 4|10|14 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5|11|15 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6|12 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 17|18|19|23|25 -> buildCirc (build (rand, (depth - 1)))
     | 20|21|22|16 -> buildOscillate (build (rand, (depth - 1)))
     | _ -> buildX ());;

*)

(* changed spans
(15,15)-(15,37)
fun c1 -> Circ c1
LamG (ConAppG (Just VarG))

(42,13)-(42,71)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(42,13)-(42,71)
build
VarG

(42,13)-(42,71)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(42,13)-(42,71)
rand
VarG

(42,13)-(42,71)
depth - 1
BopG VarG LitG

(42,13)-(42,71)
depth
VarG

(42,13)-(42,71)
1
LitG

(48,13)-(48,71)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(48,13)-(48,71)
build
VarG

(48,13)-(48,71)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(48,13)-(48,71)
rand
VarG

(48,13)-(48,71)
depth - 1
BopG VarG LitG

(48,13)-(48,71)
depth
VarG

(48,13)-(48,71)
1
LitG

(48,13)-(48,71)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(49,16)-(49,53)
buildSine
VarG

(49,16)-(49,53)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(49,16)-(49,53)
build
VarG

(49,16)-(49,53)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(49,16)-(49,53)
rand
VarG

(49,16)-(49,53)
depth - 1
BopG VarG LitG

(49,16)-(49,53)
depth
VarG

(49,16)-(49,53)
1
LitG

*)

(* changed exprs
Lam (Just (15,14)-(15,26)) (VarPat (Just (15,14)-(15,16)) "c1") (ConApp (Just (15,19)-(15,26)) "Circ" (Just (Var (Just (15,24)-(15,26)) "c1")) Nothing) Nothing
App (Just (40,24)-(40,51)) (Var (Just (40,25)-(40,30)) "build") [Tuple (Just (40,31)-(40,50)) [Var (Just (40,32)-(40,36)) "rand",Bop (Just (40,38)-(40,49)) Minus (Var (Just (40,39)-(40,44)) "depth") (Lit (Just (40,47)-(40,48)) (LI 1))]]
Var (Just (40,25)-(40,30)) "build"
Tuple (Just (40,31)-(40,50)) [Var (Just (40,32)-(40,36)) "rand",Bop (Just (40,38)-(40,49)) Minus (Var (Just (40,39)-(40,44)) "depth") (Lit (Just (40,47)-(40,48)) (LI 1))]
Var (Just (40,32)-(40,36)) "rand"
Bop (Just (40,38)-(40,49)) Minus (Var (Just (40,39)-(40,44)) "depth") (Lit (Just (40,47)-(40,48)) (LI 1))
Var (Just (40,39)-(40,44)) "depth"
Lit (Just (40,47)-(40,48)) (LI 1)
App (Just (44,24)-(44,51)) (Var (Just (44,25)-(44,30)) "build") [Tuple (Just (44,31)-(44,50)) [Var (Just (44,32)-(44,36)) "rand",Bop (Just (44,38)-(44,49)) Minus (Var (Just (44,39)-(44,44)) "depth") (Lit (Just (44,47)-(44,48)) (LI 1))]]
Var (Just (44,25)-(44,30)) "build"
Tuple (Just (44,31)-(44,50)) [Var (Just (44,32)-(44,36)) "rand",Bop (Just (44,38)-(44,49)) Minus (Var (Just (44,39)-(44,44)) "depth") (Lit (Just (44,47)-(44,48)) (LI 1))]
Var (Just (44,32)-(44,36)) "rand"
Bop (Just (44,38)-(44,49)) Minus (Var (Just (44,39)-(44,44)) "depth") (Lit (Just (44,47)-(44,48)) (LI 1))
Var (Just (44,39)-(44,44)) "depth"
Lit (Just (44,47)-(44,48)) (LI 1)
App (Just (45,16)-(45,53)) (Var (Just (45,16)-(45,25)) "buildSine") [App (Just (45,26)-(45,53)) (Var (Just (45,27)-(45,32)) "build") [Tuple (Just (45,33)-(45,52)) [Var (Just (45,34)-(45,38)) "rand",Bop (Just (45,40)-(45,51)) Minus (Var (Just (45,41)-(45,46)) "depth") (Lit (Just (45,49)-(45,50)) (LI 1))]]]
Var (Just (45,16)-(45,25)) "buildSine"
App (Just (45,26)-(45,53)) (Var (Just (45,27)-(45,32)) "build") [Tuple (Just (45,33)-(45,52)) [Var (Just (45,34)-(45,38)) "rand",Bop (Just (45,40)-(45,51)) Minus (Var (Just (45,41)-(45,46)) "depth") (Lit (Just (45,49)-(45,50)) (LI 1))]]
Var (Just (45,27)-(45,32)) "build"
Tuple (Just (45,33)-(45,52)) [Var (Just (45,34)-(45,38)) "rand",Bop (Just (45,40)-(45,51)) Minus (Var (Just (45,41)-(45,46)) "depth") (Lit (Just (45,49)-(45,50)) (LI 1))]
Var (Just (45,34)-(45,38)) "rand"
Bop (Just (45,40)-(45,51)) Minus (Var (Just (45,41)-(45,46)) "depth") (Lit (Just (45,49)-(45,50)) (LI 1))
Var (Just (45,41)-(45,46)) "depth"
Lit (Just (45,49)-(45,50)) (LI 1)
*)

(* typed spans
(15,14)-(15,26)
(40,24)-(40,51)
(40,25)-(40,30)
(40,31)-(40,50)
(40,32)-(40,36)
(40,38)-(40,49)
(40,39)-(40,44)
(40,47)-(40,48)
(44,24)-(44,51)
(44,25)-(44,30)
(44,31)-(44,50)
(44,32)-(44,36)
(44,38)-(44,49)
(44,39)-(44,44)
(44,47)-(44,48)
(45,16)-(45,53)
(45,16)-(45,25)
(45,26)-(45,53)
(45,27)-(45,32)
(45,33)-(45,52)
(45,34)-(45,38)
(45,40)-(45,51)
(45,41)-(45,46)
(45,49)-(45,50)
*)

(* correct types
expr -> expr
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
expr -> expr
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
*)

(* bad types
(expr * expr) -> expr
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
(expr * expr)
expr
expr
expr
expr
expr
expr
expr
expr
*)
