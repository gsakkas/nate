
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> x a) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,43)
(3,18)-(3,43)
(3,29)-(3,42)
(3,41)-(3,42)
(4,2)-(4,44)
(4,11)-(4,16)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,43)
(3,10)-(3,43)
(3,14)-(3,15)
(3,14)-(3,43)
(3,14)-(3,43)
(3,14)-(3,43)
(3,18)-(3,43)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
