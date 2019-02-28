
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (buildX ())
     | (2,2) -> buildCosine (buildX ())
     | _ ->
         (match randNum3 with
          | 1 ->
              buildSine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))
          | 2 ->
              buildCosine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (build (rand, (depth - 1)))
     | (2,2) -> buildCosine (build (rand, (depth - 1)))
     | _ ->
         (match randNum3 with
          | 1 -> buildSine (buildOp1 (build (rand, (depth - 1))))
          | 2 -> buildCosine (buildOp1 (build (rand, (depth - 1))))));;

*)

(* changed spans
(17,14)-(17,24)
Op1 e
ConAppG (Just VarG)

(17,14)-(17,24)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(32,9)-(42,51)
build
VarG

(32,9)-(42,51)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(32,9)-(42,51)
rand
VarG

(32,9)-(42,51)
depth - 1
BopG VarG LitG

(32,9)-(42,51)
depth
VarG

(32,9)-(42,51)
1
LitG

(32,9)-(42,51)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(32,9)-(42,51)
buildCosine
VarG

(37,44)-(37,45)
match randNum3 with
| 1 -> buildSine (buildOp1 (build (rand , depth - 1)))
| 2 -> buildCosine (buildOp1 (build (rand , depth - 1)))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(39,14)-(39,25)
buildSine
VarG

(41,19)-(42,49)
buildOp1
VarG

(41,72)-(41,73)
buildCosine
VarG

(42,21)-(42,48)
buildOp1
VarG

(42,21)-(42,48)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (15,17)-(15,22)) "Op1" (Just (Var (Just (15,21)-(15,22)) "e")) Nothing
Lam (Just (17,14)-(17,24)) (VarPat (Just (17,14)-(17,15)) "e") (ConApp (Just (17,18)-(17,24)) "Sine" (Just (Var (Just (17,23)-(17,24)) "e")) Nothing) Nothing
Var (Just (29,27)-(29,32)) "build"
Tuple (Just (29,33)-(29,52)) [Var (Just (29,34)-(29,38)) "rand",Bop (Just (29,40)-(29,51)) Minus (Var (Just (29,41)-(29,46)) "depth") (Lit (Just (29,49)-(29,50)) (LI 1))]
Var (Just (29,34)-(29,38)) "rand"
Bop (Just (29,40)-(29,51)) Minus (Var (Just (29,41)-(29,46)) "depth") (Lit (Just (29,49)-(29,50)) (LI 1))
Var (Just (29,41)-(29,46)) "depth"
Lit (Just (29,49)-(29,50)) (LI 1)
App (Just (30,16)-(30,55)) (Var (Just (30,16)-(30,27)) "buildCosine") [App (Just (30,28)-(30,55)) (Var (Just (30,29)-(30,34)) "build") [Tuple (Just (30,35)-(30,54)) [Var (Just (30,36)-(30,40)) "rand",Bop (Just (30,42)-(30,53)) Minus (Var (Just (30,43)-(30,48)) "depth") (Lit (Just (30,51)-(30,52)) (LI 1))]]]
Var (Just (30,16)-(30,27)) "buildCosine"
Case (Just (32,9)-(34,68)) (Var (Just (32,16)-(32,24)) "randNum3") [(LitPat (Just (33,12)-(33,13)) (LI 1),Nothing,App (Just (33,17)-(33,65)) (Var (Just (33,17)-(33,26)) "buildSine") [App (Just (33,27)-(33,65)) (Var (Just (33,28)-(33,36)) "buildOp1") [App (Just (33,37)-(33,64)) (Var (Just (33,38)-(33,43)) "build") [Tuple (Just (33,44)-(33,63)) [Var (Just (33,45)-(33,49)) "rand",Bop (Just (33,51)-(33,62)) Minus (Var (Just (33,52)-(33,57)) "depth") (Lit (Just (33,60)-(33,61)) (LI 1))]]]]),(LitPat (Just (34,12)-(34,13)) (LI 2),Nothing,App (Just (34,17)-(34,67)) (Var (Just (34,17)-(34,28)) "buildCosine") [App (Just (34,29)-(34,67)) (Var (Just (34,30)-(34,38)) "buildOp1") [App (Just (34,39)-(34,66)) (Var (Just (34,40)-(34,45)) "build") [Tuple (Just (34,46)-(34,65)) [Var (Just (34,47)-(34,51)) "rand",Bop (Just (34,53)-(34,64)) Minus (Var (Just (34,54)-(34,59)) "depth") (Lit (Just (34,62)-(34,63)) (LI 1))]]]])]
Var (Just (33,17)-(33,26)) "buildSine"
Var (Just (33,28)-(33,36)) "buildOp1"
Var (Just (34,17)-(34,28)) "buildCosine"
Var (Just (34,30)-(34,38)) "buildOp1"
App (Just (34,39)-(34,66)) (Var (Just (34,40)-(34,45)) "build") [Tuple (Just (34,46)-(34,65)) [Var (Just (34,47)-(34,51)) "rand",Bop (Just (34,53)-(34,64)) Minus (Var (Just (34,54)-(34,59)) "depth") (Lit (Just (34,62)-(34,63)) (LI 1))]]
*)

(* typed spans
(15,17)-(15,22)
(17,14)-(17,24)
(29,27)-(29,32)
(29,33)-(29,52)
(29,34)-(29,38)
(29,40)-(29,51)
(29,41)-(29,46)
(29,49)-(29,50)
(30,16)-(30,55)
(30,16)-(30,27)
(32,9)-(34,68)
(33,17)-(33,26)
(33,28)-(33,36)
(34,17)-(34,28)
(34,30)-(34,38)
(34,39)-(34,66)
*)

(* correct types
expr
expr -> expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
int
int
expr
expr -> expr
expr
expr -> expr
expr -> expr
expr -> expr
expr -> expr
expr
*)

(* bad types
expr -> expr
expr -> expr
expr
expr
expr
expr
expr
expr
expr
expr
int
expr -> expr
(expr * expr * expr)
int
expr
expr
*)
