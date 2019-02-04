
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
  then (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    if (rand mod 5) = 0
    then buildSine (build (rand, (depth - 1)))
    else
      if (rand mod 5) = 1
      then buildCosine (build (rand, (depth - 1)))
      else
        if (rand mod 5) = 2
        then
          buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
        else
          if (rand mod 5) = 3
          then
            buildTimes
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if (rand mod 5) = 4
            then
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
(26,5)-(26,14)
depth <= 0
BopG VarG LitG

(27,7)-(27,58)
EMPTY
EmptyG

(27,11)-(27,23)
EMPTY
EmptyG

(27,11)-(27,27)
EMPTY
EmptyG

(27,12)-(27,16)
EMPTY
EmptyG

(27,21)-(27,22)
EMPTY
EmptyG

(27,26)-(27,27)
EMPTY
EmptyG

(27,48)-(27,54)
EMPTY
EmptyG

(27,48)-(27,57)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(27,55)-(27,57)
EMPTY
EmptyG

(29,4)-(49,75)
EMPTY
EmptyG

(29,7)-(29,19)
EMPTY
EmptyG

(29,7)-(29,23)
EMPTY
EmptyG

(29,17)-(29,18)
(0 , 4)
TupleG (fromList [LitG])

(30,9)-(30,46)
4
LitG

(32,6)-(49,75)
EMPTY
EmptyG

(32,9)-(32,21)
EMPTY
EmptyG

(32,9)-(32,25)
EMPTY
EmptyG

(32,10)-(32,14)
EMPTY
EmptyG

(32,19)-(32,20)
EMPTY
EmptyG

(32,24)-(32,25)
EMPTY
EmptyG

(35,8)-(49,75)
EMPTY
EmptyG

(35,11)-(35,23)
EMPTY
EmptyG

(35,11)-(35,27)
EMPTY
EmptyG

(35,12)-(35,16)
EMPTY
EmptyG

(35,21)-(35,22)
EMPTY
EmptyG

(35,26)-(35,27)
EMPTY
EmptyG

(38,36)-(38,37)
2
LitG

(38,65)-(38,66)
EMPTY
EmptyG

(40,10)-(49,75)
EMPTY
EmptyG

(40,13)-(40,25)
EMPTY
EmptyG

(40,13)-(40,29)
EMPTY
EmptyG

(40,14)-(40,18)
EMPTY
EmptyG

(40,23)-(40,24)
EMPTY
EmptyG

(40,28)-(40,29)
2
LitG

(43,38)-(43,39)
2
LitG

(43,67)-(43,68)
EMPTY
EmptyG

(45,12)-(49,75)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(45,15)-(45,27)
EMPTY
EmptyG

(45,15)-(45,31)
EMPTY
EmptyG

(45,16)-(45,20)
EMPTY
EmptyG

(45,25)-(45,26)
EMPTY
EmptyG

(45,30)-(45,31)
2
LitG

(48,40)-(48,41)
4
LitG

(48,69)-(48,70)
4
LitG

(49,41)-(49,42)
4
LitG

(49,70)-(49,71)
4
LitG

*)
