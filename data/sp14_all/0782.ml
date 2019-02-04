
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
(15,14)-(15,53)
EMPTY
EmptyG

(15,35)-(15,53)
EMPTY
EmptyG

(15,40)-(15,41)
EMPTY
EmptyG

(15,43)-(15,44)
EMPTY
EmptyG

(15,46)-(15,52)
EMPTY
EmptyG

(17,18)-(17,24)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(29,27)-(29,33)
EMPTY
EmptyG

(29,34)-(29,36)
EMPTY
EmptyG

(30,16)-(30,27)
EMPTY
EmptyG

(30,16)-(30,39)
EMPTY
EmptyG

(30,28)-(30,39)
EMPTY
EmptyG

(30,29)-(30,35)
EMPTY
EmptyG

(30,36)-(30,38)
EMPTY
EmptyG

(32,9)-(42,51)
EMPTY
EmptyG

(32,16)-(32,24)
EMPTY
EmptyG

(34,14)-(34,23)
EMPTY
EmptyG

(34,14)-(37,50)
EMPTY
EmptyG

(35,16)-(37,50)
EMPTY
EmptyG

(35,17)-(35,25)
EMPTY
EmptyG

(36,19)-(37,49)
EMPTY
EmptyG

(36,20)-(36,47)
EMPTY
EmptyG

(36,50)-(36,55)
EMPTY
EmptyG

(36,56)-(36,75)
EMPTY
EmptyG

(36,57)-(36,61)
EMPTY
EmptyG

(36,63)-(36,74)
EMPTY
EmptyG

(36,64)-(36,69)
EMPTY
EmptyG

(36,72)-(36,73)
buildCosine
VarG

(39,14)-(39,25)
buildSine
VarG

(39,14)-(42,50)
match randNum3 with
| 1 -> buildSine (buildOp1 (build (rand , depth - 1)))
| 2 -> buildCosine (buildOp1 (build (rand , depth - 1)))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(40,17)-(40,25)
EMPTY
EmptyG

(41,19)-(42,49)
buildOp1
VarG

(41,50)-(41,55)
EMPTY
EmptyG

(41,56)-(41,75)
EMPTY
EmptyG

(41,57)-(41,61)
EMPTY
EmptyG

(41,63)-(41,74)
EMPTY
EmptyG

(41,64)-(41,69)
EMPTY
EmptyG

(41,72)-(41,73)
buildCosine
VarG

(42,22)-(42,27)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
