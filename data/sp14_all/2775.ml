
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

let rec build (rand,depth) =
  if depth <= 0
  then buildX ()
  else
    (match rand with
     | 0 -> buildSine (build ((rand (0, 5)), (depth - 1)))
     | 1 -> buildCosine (build ((rand (0, 5)), (depth - 1)))
     | 2 ->
         buildAverage
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 3 ->
         buildTimes
           ((build ((rand (0, 5)), (depth - 2))),
             (build ((rand (0, 5)), (depth - 2))))
     | 4 ->
         buildThresh
           ((build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4))),
             (build ((rand (0, 5)), (depth - 4)))));;


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
(23,15)-(43,51)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(27,4)-(43,51)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(27,11)-(27,15)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,12)-(28,58)
(0 , 4)
TupleG (fromList [LitG])

(28,30)-(28,43)
EMPTY
EmptyG

(28,36)-(28,42)
EMPTY
EmptyG

(28,37)-(28,38)
EMPTY
EmptyG

(28,40)-(28,41)
EMPTY
EmptyG

(29,32)-(29,45)
EMPTY
EmptyG

(29,38)-(29,44)
EMPTY
EmptyG

(29,39)-(29,40)
EMPTY
EmptyG

(29,42)-(29,43)
EMPTY
EmptyG

(32,20)-(32,33)
EMPTY
EmptyG

(32,26)-(32,32)
EMPTY
EmptyG

(32,27)-(32,28)
EMPTY
EmptyG

(32,30)-(32,31)
EMPTY
EmptyG

(33,21)-(33,34)
EMPTY
EmptyG

(33,27)-(33,33)
EMPTY
EmptyG

(33,28)-(33,29)
EMPTY
EmptyG

(33,31)-(33,32)
EMPTY
EmptyG

(36,20)-(36,33)
EMPTY
EmptyG

(36,26)-(36,32)
EMPTY
EmptyG

(36,27)-(36,28)
EMPTY
EmptyG

(36,30)-(36,31)
EMPTY
EmptyG

(37,21)-(37,34)
EMPTY
EmptyG

(37,27)-(37,33)
EMPTY
EmptyG

(37,28)-(37,29)
EMPTY
EmptyG

(37,31)-(37,32)
EMPTY
EmptyG

(40,20)-(40,33)
EMPTY
EmptyG

(40,26)-(40,32)
EMPTY
EmptyG

(40,27)-(40,28)
EMPTY
EmptyG

(40,30)-(40,31)
EMPTY
EmptyG

(41,21)-(41,34)
EMPTY
EmptyG

(41,27)-(41,33)
EMPTY
EmptyG

(41,28)-(41,29)
EMPTY
EmptyG

(41,31)-(41,32)
EMPTY
EmptyG

(42,21)-(42,34)
EMPTY
EmptyG

(42,27)-(42,33)
EMPTY
EmptyG

(42,28)-(42,29)
EMPTY
EmptyG

(42,31)-(42,32)
EMPTY
EmptyG

(43,21)-(43,34)
EMPTY
EmptyG

(43,27)-(43,33)
EMPTY
EmptyG

(43,28)-(43,29)
EMPTY
EmptyG

(43,31)-(43,32)
EMPTY
EmptyG

*)
