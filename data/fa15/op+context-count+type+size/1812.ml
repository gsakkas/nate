
let pipe fs n = let f a x = a n in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,12)-(2,75)
(2,16)-(2,75)
(2,28)-(2,31)
(2,30)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,16)-(2,75)
(2,22)-(2,31)
(2,24)-(2,31)
(2,28)-(2,29)
(2,28)-(2,31)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
