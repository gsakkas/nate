
let pipe fs =
  let f a x = (x fs) + a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,68)
(3,14)-(3,20)
(3,14)-(3,24)
(3,17)-(3,19)
(3,23)-(3,24)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,68)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,24)
(3,10)-(3,24)
(3,14)-(3,20)
(3,15)-(3,16)
(3,17)-(3,19)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,66)-(3,68)
*)
