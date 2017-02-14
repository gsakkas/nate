
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [[digitsOfInt (n / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,48)
(5,15)-(5,37)
(5,16)-(5,36)
(5,39)-(5,40)
(5,39)-(5,47)
(5,45)-(5,47)
*)

(* type error slice
(2,3)-(5,50)
(2,20)-(5,48)
(3,2)-(5,48)
(5,14)-(5,48)
(5,14)-(5,48)
(5,14)-(5,48)
(5,15)-(5,37)
(5,15)-(5,37)
(5,16)-(5,27)
(5,16)-(5,36)
(5,39)-(5,47)
*)
