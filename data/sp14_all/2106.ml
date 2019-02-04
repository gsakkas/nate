
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
EMPTY
EmptyG

(30,54)-(30,60)
EMPTY
EmptyG

(30,61)-(30,63)
EMPTY
EmptyG

(31,12)-(31,67)
EMPTY
EmptyG

(31,24)-(31,67)
EMPTY
EmptyG

(31,56)-(31,62)
EMPTY
EmptyG

(31,63)-(31,65)
EMPTY
EmptyG

(33,9)-(34,69)
EMPTY
EmptyG

*)
