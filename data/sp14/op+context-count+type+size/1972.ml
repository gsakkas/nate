
let sqsum xs =
  let f a x = a ^ (2 + x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,25)
(3,16)-(3,17)
(3,19)-(3,20)
(3,23)-(3,24)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,25)
(3,14)-(3,15)
(3,14)-(3,25)
(3,16)-(3,17)
(3,18)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
