
let pipe fs =
  let f a x = (a x) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,69)
(3,14)-(3,19)
(3,14)-(3,23)
(3,15)-(3,16)
(3,17)-(3,18)
(3,22)-(3,23)
(3,27)-(3,69)
(3,36)-(3,41)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,23)
(3,10)-(3,23)
(3,14)-(3,19)
(3,14)-(3,23)
(3,15)-(3,16)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
