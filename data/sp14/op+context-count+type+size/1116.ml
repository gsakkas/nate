
let pipe fs =
  let f a x = let existing = a in let next = x in existing next in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,44)
(3,14)-(3,63)
(3,29)-(3,30)
(3,34)-(3,63)
(3,45)-(3,46)
(3,50)-(3,58)
(3,50)-(3,63)
(3,59)-(3,63)
(4,2)-(4,44)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,63)
(3,10)-(3,63)
(3,14)-(3,63)
(3,14)-(3,63)
(3,29)-(3,30)
(3,34)-(3,63)
(3,50)-(3,58)
(3,50)-(3,63)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
