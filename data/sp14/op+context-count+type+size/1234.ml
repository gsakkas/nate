
let pipe fs =
  let f a x x' x a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,29)
(3,17)-(3,29)
(3,33)-(3,75)
*)

(* type error slice
(3,2)-(3,75)
(3,8)-(3,29)
(3,10)-(3,29)
(3,12)-(3,29)
(3,15)-(3,29)
(3,17)-(3,29)
(3,23)-(3,29)
(3,24)-(3,25)
(3,26)-(3,28)
(3,33)-(3,75)
(3,42)-(3,47)
(3,46)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
*)
