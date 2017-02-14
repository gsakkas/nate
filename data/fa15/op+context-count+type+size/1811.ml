
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,43)
(3,14)-(3,48)
(3,31)-(3,32)
(3,45)-(3,46)
(3,45)-(3,48)
(3,47)-(3,48)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,2)-(4,43)
(3,8)-(3,48)
(3,10)-(3,48)
(3,14)-(3,48)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
