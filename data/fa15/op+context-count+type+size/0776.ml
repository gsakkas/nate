
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(2,49)-(2,60)
(2,49)-(2,62)
(2,49)-(2,68)
(2,61)-(2,62)
*)

(* type error slice
(2,4)-(2,70)
(2,21)-(2,68)
(2,25)-(2,68)
(2,25)-(2,68)
(2,40)-(2,42)
(2,49)-(2,60)
(2,49)-(2,62)
(2,49)-(2,68)
(2,49)-(2,68)
*)