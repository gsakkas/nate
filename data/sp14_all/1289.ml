
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
  then (if (rand (0, 2)) < 1 then buildX else buildY)
  else
    (let x = rand (0, 5) in
     if x = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if x = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if x = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if x = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if x = 4
             then
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
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,34)-(27,40)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(27,46)-(27,52)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(29,4)-(50,77)
()
ConAppG Nothing (Just (TApp "unit" []))

(30,5)-(50,76)
EMPTY
EmptyG

(30,8)-(30,13)
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(30,12)-(30,13)
EMPTY
EmptyG

(33,7)-(50,76)
EMPTY
EmptyG

(33,10)-(33,11)
EMPTY
EmptyG

(33,10)-(33,15)
EMPTY
EmptyG

(33,14)-(33,15)
EMPTY
EmptyG

(36,9)-(50,76)
EMPTY
EmptyG

(36,12)-(36,13)
EMPTY
EmptyG

(36,12)-(36,17)
EMPTY
EmptyG

(36,16)-(36,17)
EMPTY
EmptyG

(41,11)-(50,76)
EMPTY
EmptyG

(41,14)-(41,15)
EMPTY
EmptyG

(41,14)-(41,19)
EMPTY
EmptyG

(41,18)-(41,19)
EMPTY
EmptyG

(46,13)-(50,76)
EMPTY
EmptyG

(46,16)-(46,17)
EMPTY
EmptyG

(46,16)-(46,21)
EMPTY
EmptyG

(46,20)-(46,21)
EMPTY
EmptyG

*)
