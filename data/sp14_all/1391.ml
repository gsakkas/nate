
let pipe fs =
  let f a x f x = f a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,22)
fun f -> fun a -> f a x
LamG VarPatG (LamG EmptyPatG EmptyG)

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,19)-(3,20)
(3,19)-(3,22)
(3,21)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
