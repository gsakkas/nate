
let rec clone x n = if n > 0 then x :: (clone (x (n - 1))) else [];;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
(2,27)-(2,28)
(2,34)-(2,58)
(2,39)-(2,58)
(2,46)-(2,57)
(2,64)-(2,66)
*)

(* type error slice
(2,3)-(2,68)
(2,14)-(2,66)
(2,39)-(2,58)
(2,40)-(2,45)
(2,46)-(2,57)
(2,47)-(2,48)
*)
