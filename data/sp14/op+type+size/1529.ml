
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
  | _ -> buildCosine (VarX, VarY)
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
  | _ -> buildCosine VarX
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
(27,21)-(27,33)
(27,28)-(27,32)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(27,9)-(27,20)
(27,9)-(27,33)
(27,21)-(27,33)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(48,71)
(26,2)-(48,71)
(26,8)-(26,19)
(26,8)-(26,12)
(26,13)-(26,19)
(26,14)-(26,15)
(26,17)-(26,18)
(27,9)-(27,33)
(27,9)-(27,20)
(27,21)-(27,33)
(27,22)-(27,26)
(27,28)-(27,32)
(28,9)-(28,18)
(28,9)-(28,15)
(28,16)-(28,18)
(29,9)-(29,18)
(29,9)-(29,15)
(29,16)-(29,18)
(31,6)-(31,76)
(31,6)-(31,15)
(31,16)-(31,76)
(31,20)-(31,29)
(31,20)-(31,25)
(31,28)-(31,29)
(31,35)-(31,44)
(31,35)-(31,41)
(31,42)-(31,44)
(31,50)-(31,75)
(31,50)-(31,55)
(31,56)-(31,75)
(31,57)-(31,61)
(31,63)-(31,74)
(31,64)-(31,69)
(31,72)-(31,73)
(33,6)-(34,68)
(33,6)-(33,17)
(34,8)-(34,68)
(34,12)-(34,21)
(34,12)-(34,17)
(34,20)-(34,21)
(34,27)-(34,36)
(34,27)-(34,33)
(34,34)-(34,36)
(34,42)-(34,67)
(34,42)-(34,47)
(34,48)-(34,67)
(34,49)-(34,53)
(34,55)-(34,66)
(34,56)-(34,61)
(34,64)-(34,65)
(36,6)-(38,71)
(36,6)-(36,18)
(37,8)-(38,71)
(37,9)-(37,69)
(37,13)-(37,22)
(37,13)-(37,18)
(37,21)-(37,22)
(37,28)-(37,37)
(37,28)-(37,34)
(37,35)-(37,37)
(37,43)-(37,68)
(37,43)-(37,48)
(37,49)-(37,68)
(37,50)-(37,54)
(37,56)-(37,67)
(37,57)-(37,62)
(37,65)-(37,66)
(38,10)-(38,70)
(38,14)-(38,23)
(38,14)-(38,19)
(38,22)-(38,23)
(38,29)-(38,38)
(38,29)-(38,35)
(38,36)-(38,38)
(38,44)-(38,69)
(38,44)-(38,49)
(38,50)-(38,69)
(38,51)-(38,55)
(38,57)-(38,68)
(38,58)-(38,63)
(38,66)-(38,67)
(40,6)-(42,71)
(40,6)-(40,16)
(41,8)-(42,71)
(41,9)-(41,69)
(41,13)-(41,22)
(41,13)-(41,18)
(41,21)-(41,22)
(41,28)-(41,37)
(41,28)-(41,34)
(41,35)-(41,37)
(41,43)-(41,68)
(41,43)-(41,48)
(41,49)-(41,68)
(41,50)-(41,54)
(41,56)-(41,67)
(41,57)-(41,62)
(41,65)-(41,66)
(42,10)-(42,70)
(42,14)-(42,23)
(42,14)-(42,19)
(42,22)-(42,23)
(42,29)-(42,38)
(42,29)-(42,35)
(42,36)-(42,38)
(42,44)-(42,69)
(42,44)-(42,49)
(42,50)-(42,69)
(42,51)-(42,55)
(42,57)-(42,68)
(42,58)-(42,63)
(42,66)-(42,67)
(44,6)-(48,71)
(44,6)-(44,17)
(45,8)-(48,71)
(45,9)-(45,69)
(45,13)-(45,22)
(45,13)-(45,18)
(45,21)-(45,22)
(45,28)-(45,37)
(45,28)-(45,34)
(45,35)-(45,37)
(45,43)-(45,68)
(45,43)-(45,48)
(45,49)-(45,68)
(45,50)-(45,54)
(45,56)-(45,67)
(45,57)-(45,62)
(45,65)-(45,66)
(46,10)-(46,70)
(46,14)-(46,23)
(46,14)-(46,19)
(46,22)-(46,23)
(46,29)-(46,38)
(46,29)-(46,35)
(46,36)-(46,38)
(46,44)-(46,69)
(46,44)-(46,49)
(46,50)-(46,69)
(46,51)-(46,55)
(46,57)-(46,68)
(46,58)-(46,63)
(46,66)-(46,67)
(47,10)-(47,70)
(47,14)-(47,23)
(47,14)-(47,19)
(47,22)-(47,23)
(47,29)-(47,38)
(47,29)-(47,35)
(47,36)-(47,38)
(47,44)-(47,69)
(47,44)-(47,49)
(47,50)-(47,69)
(47,51)-(47,55)
(47,57)-(47,68)
(47,58)-(47,63)
(47,66)-(47,67)
(48,10)-(48,70)
(48,14)-(48,23)
(48,14)-(48,19)
(48,22)-(48,23)
(48,29)-(48,38)
(48,29)-(48,35)
(48,36)-(48,38)
(48,44)-(48,69)
(48,44)-(48,49)
(48,50)-(48,69)
(48,51)-(48,55)
(48,57)-(48,68)
(48,58)-(48,63)
(48,66)-(48,67)
*)
