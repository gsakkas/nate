
let pipe fs =
  let f a x = let y z xn = xn a in y in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,44)
(3,14)-(3,36)
(3,20)-(3,31)
(3,22)-(3,31)
(3,27)-(3,29)
(3,30)-(3,31)
(3,35)-(3,36)
(4,2)-(4,44)
(4,11)-(4,16)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,36)
(3,10)-(3,36)
(3,14)-(3,36)
(3,14)-(3,36)
(3,20)-(3,31)
(3,22)-(3,31)
(3,27)-(3,29)
(3,27)-(3,31)
(3,30)-(3,31)
(3,35)-(3,36)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
