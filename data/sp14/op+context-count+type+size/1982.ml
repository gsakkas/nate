
let pipe fs =
  let f a x y = a (y x) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
(3,22)-(3,23)
(3,28)-(3,70)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,17)-(3,18)
(3,17)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)