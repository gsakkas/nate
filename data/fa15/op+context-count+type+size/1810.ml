
let pipe fs n =
  let f a x = a + (n x) in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,12)-(3,67)
(3,2)-(3,67)
(3,14)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(3,21)-(3,22)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,14)-(3,15)
(3,14)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)
