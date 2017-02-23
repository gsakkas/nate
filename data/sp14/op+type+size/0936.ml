
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval ex1) * ((eval ex1) + (eval ex2))) *
          (((eval ex1) + (eval ex2)) + (eval ex3)))
         * ((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)))
        *
        (((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)) + (eval ex5));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval (ex1, x, y)) *. ((eval (ex1, x, y)) +. (eval (ex2, x, y)))) *.
          (((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y))))
         *.
         ((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y))))
        *.
        (((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y)))
           +. (eval (ex5, x, y)));;

*)

(* changed spans
(28,6)-(30,67)
(28,6)-(32,78)
(28,7)-(29,51)
(28,8)-(28,48)
(28,9)-(28,19)
(28,10)-(28,14)
(28,15)-(28,18)
(28,22)-(28,47)
(28,23)-(28,33)
(28,29)-(28,32)
(28,36)-(28,46)
(28,37)-(28,41)
(28,42)-(28,45)
(29,10)-(29,50)
(29,11)-(29,36)
(29,12)-(29,22)
(29,18)-(29,21)
(29,25)-(29,35)
(29,31)-(29,34)
(29,39)-(29,49)
(29,40)-(29,44)
(29,45)-(29,48)
(30,11)-(30,66)
(30,12)-(30,52)
(30,13)-(30,38)
(30,14)-(30,24)
(30,20)-(30,23)
(30,27)-(30,37)
(30,33)-(30,36)
(30,41)-(30,51)
(30,47)-(30,50)
(30,55)-(30,65)
(30,56)-(30,60)
(30,61)-(30,64)
(32,8)-(32,78)
(32,9)-(32,64)
(32,10)-(32,50)
(32,11)-(32,36)
(32,12)-(32,22)
(32,18)-(32,21)
(32,25)-(32,35)
(32,31)-(32,34)
(32,39)-(32,49)
(32,40)-(32,44)
(32,45)-(32,48)
(32,53)-(32,63)
(32,59)-(32,62)
(32,68)-(32,72)
(32,73)-(32,76)
*)

(* type error slice
(16,2)-(32,78)
(16,2)-(32,78)
(16,2)-(32,78)
(16,2)-(32,78)
(16,2)-(32,78)
(16,2)-(32,78)
(16,2)-(32,78)
(19,15)-(19,18)
(19,15)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(28,6)-(32,78)
(28,9)-(28,19)
(28,10)-(28,14)
(28,15)-(28,18)
(28,23)-(28,33)
(28,24)-(28,28)
(28,29)-(28,32)
(28,36)-(28,46)
(28,37)-(28,41)
(28,42)-(28,45)
(29,12)-(29,22)
(29,13)-(29,17)
(29,18)-(29,21)
(29,25)-(29,35)
(29,26)-(29,30)
(29,31)-(29,34)
(29,39)-(29,49)
(29,40)-(29,44)
(29,45)-(29,48)
(30,14)-(30,24)
(30,15)-(30,19)
(30,20)-(30,23)
(30,27)-(30,37)
(30,28)-(30,32)
(30,33)-(30,36)
(30,41)-(30,51)
(30,42)-(30,46)
(30,47)-(30,50)
(30,55)-(30,65)
(30,56)-(30,60)
(30,61)-(30,64)
(32,12)-(32,22)
(32,13)-(32,17)
(32,18)-(32,21)
(32,25)-(32,35)
(32,26)-(32,30)
(32,31)-(32,34)
(32,39)-(32,49)
(32,40)-(32,44)
(32,45)-(32,48)
(32,53)-(32,63)
(32,54)-(32,58)
(32,59)-(32,62)
(32,67)-(32,77)
(32,68)-(32,72)
(32,73)-(32,76)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(32,78)
(16,2)-(32,78)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,15)-(19,44)
(19,15)-(19,18)
(19,19)-(19,44)
(19,20)-(19,22)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(19,33)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,17)-(20,46)
(20,17)-(20,20)
(20,21)-(20,46)
(20,22)-(20,24)
(20,28)-(20,45)
(20,29)-(20,33)
(20,34)-(20,44)
(20,35)-(20,37)
(20,39)-(20,40)
(20,42)-(20,43)
(21,25)-(21,73)
(21,25)-(21,67)
(21,26)-(21,44)
(21,27)-(21,31)
(21,32)-(21,43)
(21,33)-(21,36)
(21,38)-(21,39)
(21,41)-(21,42)
(21,48)-(21,66)
(21,49)-(21,53)
(21,54)-(21,65)
(21,55)-(21,58)
(21,60)-(21,61)
(21,63)-(21,64)
(21,71)-(21,73)
(22,23)-(22,63)
(22,23)-(22,41)
(22,24)-(22,28)
(22,29)-(22,40)
(22,30)-(22,33)
(22,35)-(22,36)
(22,38)-(22,39)
(22,45)-(22,63)
(22,46)-(22,50)
(22,51)-(22,62)
(22,52)-(22,55)
(22,57)-(22,58)
(22,60)-(22,61)
(24,6)-(26,27)
(24,9)-(24,48)
(24,9)-(24,27)
(24,10)-(24,14)
(24,15)-(24,26)
(24,16)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
(24,30)-(24,48)
(24,31)-(24,35)
(24,36)-(24,47)
(24,37)-(24,40)
(24,42)-(24,43)
(24,45)-(24,46)
(25,11)-(25,27)
(25,11)-(25,15)
(25,16)-(25,27)
(25,17)-(25,20)
(25,22)-(25,23)
(25,25)-(25,26)
(26,11)-(26,27)
(26,11)-(26,15)
(26,16)-(26,27)
(26,17)-(26,20)
(26,22)-(26,23)
(26,25)-(26,26)
(28,6)-(32,78)
(28,6)-(30,67)
(28,7)-(29,51)
(28,8)-(28,48)
(28,9)-(28,19)
(28,10)-(28,14)
(28,15)-(28,18)
(28,22)-(28,47)
(28,23)-(28,33)
(28,24)-(28,28)
(28,29)-(28,32)
(28,36)-(28,46)
(28,37)-(28,41)
(28,42)-(28,45)
(29,10)-(29,50)
(29,11)-(29,36)
(29,12)-(29,22)
(29,13)-(29,17)
(29,18)-(29,21)
(29,25)-(29,35)
(29,26)-(29,30)
(29,31)-(29,34)
(29,39)-(29,49)
(29,40)-(29,44)
(29,45)-(29,48)
(30,11)-(30,66)
(30,12)-(30,52)
(30,13)-(30,38)
(30,14)-(30,24)
(30,15)-(30,19)
(30,20)-(30,23)
(30,27)-(30,37)
(30,28)-(30,32)
(30,33)-(30,36)
(30,41)-(30,51)
(30,42)-(30,46)
(30,47)-(30,50)
(30,55)-(30,65)
(30,56)-(30,60)
(30,61)-(30,64)
(32,8)-(32,78)
(32,9)-(32,64)
(32,10)-(32,50)
(32,11)-(32,36)
(32,12)-(32,22)
(32,13)-(32,17)
(32,18)-(32,21)
(32,25)-(32,35)
(32,26)-(32,30)
(32,31)-(32,34)
(32,39)-(32,49)
(32,40)-(32,44)
(32,45)-(32,48)
(32,53)-(32,63)
(32,54)-(32,58)
(32,59)-(32,62)
(32,67)-(32,77)
(32,68)-(32,72)
(32,73)-(32,76)
*)
