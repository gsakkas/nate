
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

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;


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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n > 0) && ((x mod 5) = 0) ->
      buildSine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 1) ->
      buildCosine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 2) ->
      buildAverage ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 3) ->
      buildTimes ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 4) ->
      buildThresh
        ((build (rand, (n - 1))), (build (rand, (n - 1))),
          (build (rand, (n - 1))), (build (rand, (n - 1))));;

*)

(* changed spans
(11,16)-(11,28)
(15,11)-(15,20)
(20,2)-(24,64)
(23,50)-(23,51)
(23,53)-(23,60)
(23,54)-(23,55)
(23,58)-(23,59)
(24,32)-(24,43)
(24,45)-(24,50)
(24,51)-(24,63)
(24,52)-(24,53)
(24,55)-(24,62)
(24,56)-(24,57)
(24,60)-(24,61)
*)

(* type error slice
(19,3)-(24,66)
(19,15)-(24,64)
(20,2)-(24,64)
(20,8)-(20,36)
(20,9)-(20,28)
(20,10)-(20,14)
(23,42)-(23,62)
(23,43)-(23,48)
(23,49)-(23,61)
(23,50)-(23,51)
*)
