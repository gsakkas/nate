
let pipe fs = let f a x = a x in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun x -> fun a -> x a
LamG VarPatG (LamG EmptyPatG EmptyG)

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
