
let rec clone x n = if n > 1 then x @ (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,54)
(2,24)-(2,25)
(2,24)-(2,29)
(2,28)-(2,29)
(2,35)-(2,54)
(2,37)-(2,38)
*)

(* type error slice
(2,21)-(2,54)
(2,21)-(2,54)
(2,21)-(2,54)
(2,35)-(2,54)
(2,37)-(2,38)
*)