
let pipe fs =
  let f a x = (fun n  -> n) a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,32)
(3,31)-(3,32)
(3,36)-(3,78)
*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,32)
(3,11)-(3,32)
(3,16)-(3,27)
(3,16)-(3,32)
(3,26)-(3,27)
(3,29)-(3,30)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
*)