
let pipe fs = let f a x = a + fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,15)-(2,77)
(2,27)-(2,28)
(2,27)-(2,33)
(2,31)-(2,33)
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,27)-(2,33)
(2,31)-(2,33)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)