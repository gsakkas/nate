
let pipe fs =
  let f a x f x = f (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,25)
(3,14)-(3,25)
(3,18)-(3,19)
(3,18)-(3,25)
(3,23)-(3,24)
(3,29)-(3,71)
(3,38)-(3,43)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,25)
(3,10)-(3,25)
(3,12)-(3,25)
(3,14)-(3,25)
(3,20)-(3,25)
(3,21)-(3,22)
(3,23)-(3,24)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
*)
