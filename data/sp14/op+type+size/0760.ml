
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | PowerUp (e1,e2) -> (abs (eval (e1, x, y))) ** (abs (eval (e2, x, y)))
  | Square2 (e1,e2,e3) ->
      (sqrt
         ((((eval (e1, x, y)) ** 2.) +. ((eval (e2, x, y)) ** 2.)) +.
            ((eval (e3, x, y)) ** 2.)))
        /. 2.
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Square2 (e1,e2,e3) ->
      (sqrt
         ((((eval (e1, x, y)) ** 2.) +. ((eval (e2, x, y)) ** 2.)) +.
            ((eval (e3, x, y)) ** 2.)))
        /. 2.
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(16,2)-(32,30)
(23,23)-(23,46)
(23,23)-(23,73)
(23,24)-(23,27)
(23,28)-(23,45)
(23,29)-(23,33)
(23,34)-(23,44)
(23,35)-(23,37)
(23,39)-(23,40)
(23,42)-(23,43)
(23,47)-(23,49)
(23,50)-(23,73)
(23,51)-(23,54)
(23,55)-(23,72)
(23,56)-(23,60)
(23,61)-(23,71)
(23,62)-(23,64)
(23,66)-(23,67)
(23,69)-(23,70)
(30,29)-(30,33)
(30,34)-(30,43)
(30,35)-(30,36)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(23,23)-(23,46)
(23,24)-(23,27)
(23,28)-(23,45)
(23,29)-(23,33)
(23,50)-(23,73)
(23,51)-(23,54)
(23,55)-(23,72)
(23,56)-(23,60)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(32,30)
(16,2)-(32,30)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,42)
(19,14)-(19,17)
(19,18)-(19,42)
(19,19)-(19,21)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(19,32)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(20,16)-(20,44)
(20,16)-(20,19)
(20,20)-(20,44)
(20,21)-(20,23)
(20,27)-(20,43)
(20,28)-(20,32)
(20,33)-(20,42)
(20,34)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,23)-(21,69)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,69)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(23,23)-(23,73)
(23,47)-(23,49)
(23,23)-(23,46)
(23,24)-(23,27)
(23,28)-(23,45)
(23,29)-(23,33)
(23,34)-(23,44)
(23,35)-(23,37)
(23,39)-(23,40)
(23,42)-(23,43)
(23,50)-(23,73)
(23,51)-(23,54)
(23,55)-(23,72)
(23,56)-(23,60)
(23,61)-(23,71)
(23,62)-(23,64)
(23,66)-(23,67)
(23,69)-(23,70)
(25,6)-(28,13)
(25,6)-(27,39)
(25,7)-(25,11)
(26,9)-(27,38)
(26,10)-(26,66)
(26,11)-(26,36)
(26,30)-(26,32)
(26,12)-(26,29)
(26,13)-(26,17)
(26,18)-(26,28)
(26,19)-(26,21)
(26,23)-(26,24)
(26,26)-(26,27)
(26,33)-(26,35)
(26,40)-(26,65)
(26,59)-(26,61)
(26,41)-(26,58)
(26,42)-(26,46)
(26,47)-(26,57)
(26,48)-(26,50)
(26,52)-(26,53)
(26,55)-(26,56)
(26,62)-(26,64)
(27,12)-(27,37)
(27,31)-(27,33)
(27,13)-(27,30)
(27,14)-(27,18)
(27,19)-(27,29)
(27,20)-(27,22)
(27,24)-(27,25)
(27,27)-(27,28)
(27,34)-(27,36)
(28,11)-(28,13)
(30,6)-(32,30)
(30,9)-(30,44)
(30,9)-(30,25)
(30,10)-(30,14)
(30,15)-(30,24)
(30,16)-(30,17)
(30,19)-(30,20)
(30,22)-(30,23)
(30,28)-(30,44)
(30,29)-(30,33)
(30,34)-(30,43)
(30,35)-(30,36)
(30,38)-(30,39)
(30,41)-(30,42)
(31,11)-(31,30)
(31,11)-(31,15)
(31,16)-(31,30)
(31,17)-(31,23)
(31,25)-(31,26)
(31,28)-(31,29)
(32,11)-(32,30)
(32,11)-(32,15)
(32,16)-(32,30)
(32,17)-(32,23)
(32,25)-(32,26)
(32,28)-(32,29)
*)