
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Maximum of expr* expr* expr
  | Absolute of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (pi *. (eval (expr0, x, y)))
  | Cosine expr0 -> cos (pi *. (eval (expr0, x, y)))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y))
  | Maximum (expr0,expr1,expr2) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  ->
           (match (eval (expr1, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr1, x, y))
       | false  ->
           (match (eval (expr0, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr0, x, y)))
  | Absolute expr0 ->
      (match (eval (expr0, x, y)) < 0 with
       | true  -> 0.0 -. (eval (expr0, x, y))
       | false  -> eval (expr0, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Maximum of expr* expr* expr
  | Absolute of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (pi *. (eval (expr0, x, y)))
  | Cosine expr0 -> cos (pi *. (eval (expr0, x, y)))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y))
  | Maximum (expr0,expr1,expr2) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  ->
           (match (eval (expr1, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr1, x, y))
       | false  ->
           (match (eval (expr0, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr0, x, y)))
  | Absolute expr0 ->
      (match (eval (expr0, x, y)) < 0.0 with
       | true  -> 0.0 -. (eval (expr0, x, y))
       | false  -> eval (expr0, x, y));;

*)

(* changed spans
(39,36)-(39,37)
*)

(* type error slice
(19,22)-(19,50)
(19,29)-(19,49)
(19,30)-(19,34)
(39,13)-(39,33)
(39,13)-(39,37)
(39,13)-(39,37)
(39,14)-(39,18)
(39,36)-(39,37)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(41,38)
(16,2)-(41,38)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,18)-(19,50)
(19,18)-(19,21)
(19,22)-(19,50)
(19,23)-(19,25)
(19,29)-(19,49)
(19,30)-(19,34)
(19,35)-(19,48)
(19,36)-(19,41)
(19,43)-(19,44)
(19,46)-(19,47)
(20,20)-(20,52)
(20,20)-(20,23)
(20,24)-(20,52)
(20,25)-(20,27)
(20,31)-(20,51)
(20,32)-(20,36)
(20,37)-(20,50)
(20,38)-(20,43)
(20,45)-(20,46)
(20,48)-(20,49)
(22,6)-(22,58)
(22,6)-(22,52)
(22,7)-(22,27)
(22,8)-(22,12)
(22,13)-(22,26)
(22,14)-(22,19)
(22,21)-(22,22)
(22,24)-(22,25)
(22,31)-(22,51)
(22,32)-(22,36)
(22,37)-(22,50)
(22,38)-(22,43)
(22,45)-(22,46)
(22,48)-(22,49)
(22,56)-(22,58)
(23,27)-(23,71)
(23,27)-(23,47)
(23,28)-(23,32)
(23,33)-(23,46)
(23,34)-(23,39)
(23,41)-(23,42)
(23,44)-(23,45)
(23,51)-(23,71)
(23,52)-(23,56)
(23,57)-(23,70)
(23,58)-(23,63)
(23,65)-(23,66)
(23,68)-(23,69)
(25,6)-(27,38)
(25,13)-(25,56)
(25,13)-(25,33)
(25,14)-(25,18)
(25,19)-(25,32)
(25,20)-(25,25)
(25,27)-(25,28)
(25,30)-(25,31)
(25,36)-(25,56)
(25,37)-(25,41)
(25,42)-(25,55)
(25,43)-(25,48)
(25,50)-(25,51)
(25,53)-(25,54)
(26,18)-(26,36)
(26,18)-(26,22)
(26,23)-(26,36)
(26,24)-(26,29)
(26,31)-(26,32)
(26,34)-(26,35)
(27,19)-(27,37)
(27,19)-(27,23)
(27,24)-(27,37)
(27,25)-(27,30)
(27,32)-(27,33)
(27,35)-(27,36)
(29,6)-(37,44)
(29,13)-(29,56)
(29,13)-(29,33)
(29,14)-(29,18)
(29,19)-(29,32)
(29,20)-(29,25)
(29,27)-(29,28)
(29,30)-(29,31)
(29,36)-(29,56)
(29,37)-(29,41)
(29,42)-(29,55)
(29,43)-(29,48)
(29,50)-(29,51)
(29,53)-(29,54)
(31,11)-(33,43)
(31,18)-(31,61)
(31,18)-(31,38)
(31,19)-(31,23)
(31,24)-(31,37)
(31,25)-(31,30)
(31,32)-(31,33)
(31,35)-(31,36)
(31,41)-(31,61)
(31,42)-(31,46)
(31,47)-(31,60)
(31,48)-(31,53)
(31,55)-(31,56)
(31,58)-(31,59)
(32,23)-(32,41)
(32,23)-(32,27)
(32,28)-(32,41)
(32,29)-(32,34)
(32,36)-(32,37)
(32,39)-(32,40)
(33,24)-(33,42)
(33,24)-(33,28)
(33,29)-(33,42)
(33,30)-(33,35)
(33,37)-(33,38)
(33,40)-(33,41)
(35,11)-(37,43)
(35,18)-(35,61)
(35,18)-(35,38)
(35,19)-(35,23)
(35,24)-(35,37)
(35,25)-(35,30)
(35,32)-(35,33)
(35,35)-(35,36)
(35,41)-(35,61)
(35,42)-(35,46)
(35,47)-(35,60)
(35,48)-(35,53)
(35,55)-(35,56)
(35,58)-(35,59)
(36,23)-(36,41)
(36,23)-(36,27)
(36,28)-(36,41)
(36,29)-(36,34)
(36,36)-(36,37)
(36,39)-(36,40)
(37,24)-(37,42)
(37,24)-(37,28)
(37,29)-(37,42)
(37,30)-(37,35)
(37,37)-(37,38)
(37,40)-(37,41)
(39,6)-(41,38)
(39,13)-(39,37)
(39,13)-(39,33)
(39,14)-(39,18)
(39,19)-(39,32)
(39,20)-(39,25)
(39,27)-(39,28)
(39,30)-(39,31)
(39,36)-(39,37)
(40,18)-(40,45)
(40,18)-(40,21)
(40,25)-(40,45)
(40,26)-(40,30)
(40,31)-(40,44)
(40,32)-(40,37)
(40,39)-(40,40)
(40,42)-(40,43)
(41,19)-(41,37)
(41,19)-(41,23)
(41,24)-(41,37)
(41,25)-(41,30)
(41,32)-(41,33)
(41,35)-(41,36)
*)
