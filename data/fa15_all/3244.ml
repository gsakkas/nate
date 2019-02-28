
let pipe fs =
  let f a x y c = (x a) = x in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,27)
EMPTY
EmptyG

(3,26)-(3,27)
EMPTY
EmptyG

*)

(* typed spans
*)

(* typed spans
*)

(* typed spans
*)
