
let pipe fs = let f a x a = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x t u = u in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
(2,28)-(2,29)
(2,28)-(2,31)
(2,30)-(2,31)
(2,35)-(2,76)
(2,46)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,14)-(2,76)
(2,20)-(2,31)
(2,22)-(2,31)
(2,24)-(2,31)
(2,35)-(2,76)
(2,46)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
(2,74)-(2,76)
*)
