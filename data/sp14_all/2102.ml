
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
  match rand (1, 7) with
  | _ -> rand (1, 7)
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;

*)

(* changed spans
(26,2)-(48,71)
EMPTY
EmptyG

(26,8)-(26,12)
EMPTY
EmptyG

(26,8)-(26,19)
EMPTY
EmptyG

(26,13)-(26,19)
EMPTY
EmptyG

(26,14)-(26,15)
EMPTY
EmptyG

(26,17)-(26,18)
match rand (1 , 7) with
| 1 -> buildX ()
| 2 -> buildY ()
| 3 -> buildSine (if depth = 0
                  then buildX ()
                  else build (rand , depth - 1))
| 4 -> buildCosine (if depth = 0
                    then buildY ()
                    else build (rand , depth - 1))
| 5 -> buildAverage (if depth = 0
                     then buildX ()
                     else build (rand , depth - 1) , if depth = 0
                                                     then buildY ()
                                                     else build (rand , depth - 1))
| 6 -> buildTimes (if depth = 0
                   then buildX ()
                   else build (rand , depth - 1) , if depth = 0
                                                   then buildY ()
                                                   else build (rand , depth - 1))
| 7 -> buildThresh (if depth = 0
                    then buildX ()
                    else build (rand , depth - 1) , if depth = 0
                                                    then buildY ()
                                                    else build (rand , depth - 1) , if depth = 0
                                                                                    then buildX ()
                                                                                    else build (rand , depth - 1) , if depth = 0
                                                                                                                    then buildY ()
                                                                                                                    else build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)
