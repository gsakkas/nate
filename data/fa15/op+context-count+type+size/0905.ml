
let pipe fs = let f a x = a x in let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,73)
(2,26)-(2,27)
(2,26)-(2,29)
(2,33)-(2,73)
(2,44)-(2,45)
(2,49)-(2,73)
*)

(* type error slice
(2,14)-(2,73)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,49)-(2,63)
(2,49)-(2,73)
(2,64)-(2,65)
*)
