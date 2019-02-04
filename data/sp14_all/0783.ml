
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
     | (1,1) -> buildSine (build (rand, (depth - 1)))
     | (2,2) -> buildCosine (build (rand, (depth - 1)))
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

(35,17)-(35,25)
EMPTY
EmptyG

(36,19)-(37,49)
EMPTY
EmptyG

(36,20)-(36,47)
EMPTY
EmptyG

(36,21)-(36,26)
EMPTY
EmptyG

(36,27)-(36,46)
EMPTY
EmptyG

(36,28)-(36,32)
EMPTY
EmptyG

(36,34)-(36,45)
EMPTY
EmptyG

(36,35)-(36,40)
EMPTY
EmptyG

(36,43)-(36,44)
EMPTY
EmptyG

(36,49)-(36,76)
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
buildOp1
VarG

(40,17)-(40,25)
EMPTY
EmptyG

(41,19)-(42,49)
EMPTY
EmptyG

(41,20)-(41,47)
EMPTY
EmptyG

(41,21)-(41,26)
EMPTY
EmptyG

(41,27)-(41,46)
EMPTY
EmptyG

(41,28)-(41,32)
EMPTY
EmptyG

(41,34)-(41,45)
EMPTY
EmptyG

(41,35)-(41,40)
EMPTY
EmptyG

(41,43)-(41,44)
EMPTY
EmptyG

(41,49)-(41,76)
EMPTY
EmptyG

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
buildOp1
VarG

*)
