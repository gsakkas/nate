
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,43)-(2,44)
(2,43)-(2,67)
(2,48)-(2,67)
(2,49)-(2,62)
(2,50)-(2,51)
(2,60)-(2,61)
*)

(* type error slice
(2,43)-(2,67)
(2,48)-(2,67)
(2,49)-(2,62)
(2,50)-(2,51)
(2,58)-(2,59)
*)
