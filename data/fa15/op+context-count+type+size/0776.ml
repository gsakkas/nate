
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,47)-(2,62)
(2,47)-(2,67)
(2,48)-(2,59)
(2,60)-(2,61)
*)

(* type error slice
(2,3)-(2,69)
(2,20)-(2,67)
(2,24)-(2,67)
(2,24)-(2,67)
(2,39)-(2,41)
(2,47)-(2,62)
(2,47)-(2,67)
(2,47)-(2,67)
(2,48)-(2,59)
*)
