
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 6)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 6)), (depth - 1))));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(11,16)-(11,28)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(15,11)-(15,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,15)-(23,61)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(18,5)-(18,14)
depth <= 0
BopG VarG LitG

(21,4)-(23,61)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(21,11)-(21,15)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(22,12)-(22,58)
(0 , 4)
TupleG (fromList [LitG])

(22,30)-(22,43)
EMPTY
EmptyG

(22,36)-(22,42)
EMPTY
EmptyG

(22,37)-(22,38)
EMPTY
EmptyG

(22,40)-(22,41)
EMPTY
EmptyG

(23,32)-(23,45)
depth - 1
BopG VarG LitG

(23,33)-(23,37)
(build (rand , depth - 2) , build (rand , depth - 2))
TupleG (fromList [AppG (fromList [EmptyG])])

(23,38)-(23,44)
build (rand , depth - 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,39)-(23,40)
EMPTY
EmptyG

(23,42)-(23,43)
rand
VarG

(23,56)-(23,57)
2
LitG

*)
