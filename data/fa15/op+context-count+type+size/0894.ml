
let pipe fs =
  let f a x n = n (a x) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
(3,21)-(3,22)
(3,38)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)
