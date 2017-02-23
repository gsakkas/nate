
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi * (eval (e', x, y)))
  | Cosine e' -> cos (pi * (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0;;

*)

(* changed spans
(17,19)-(17,43)
(18,21)-(18,45)
(19,23)-(19,62)
(19,23)-(19,66)
(19,24)-(19,41)
(19,65)-(19,66)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,15)-(17,18)
(17,15)-(17,43)
(17,19)-(17,43)
(17,19)-(17,43)
(17,20)-(17,22)
(18,17)-(18,20)
(18,17)-(18,45)
(18,21)-(18,45)
(18,21)-(18,45)
(18,22)-(18,24)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,66)
(14,2)-(19,66)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,15)-(17,43)
(17,15)-(17,18)
(17,19)-(17,43)
(17,20)-(17,22)
(17,25)-(17,42)
(17,26)-(17,30)
(17,31)-(17,41)
(17,32)-(17,34)
(17,36)-(17,37)
(17,39)-(17,40)
(18,17)-(18,45)
(18,17)-(18,20)
(18,21)-(18,45)
(18,22)-(18,24)
(18,27)-(18,44)
(18,28)-(18,32)
(18,33)-(18,43)
(18,34)-(18,36)
(18,38)-(18,39)
(18,41)-(18,42)
(19,23)-(19,66)
(19,23)-(19,62)
(19,24)-(19,41)
(19,25)-(19,29)
(19,30)-(19,40)
(19,31)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(19,44)-(19,61)
(19,45)-(19,49)
(19,50)-(19,60)
(19,51)-(19,53)
(19,55)-(19,56)
(19,58)-(19,59)
(19,65)-(19,66)
*)
