
let pipe fs =
  let f a x combine c = x (a c) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,31)
EMPTY
EmptyG

*)
