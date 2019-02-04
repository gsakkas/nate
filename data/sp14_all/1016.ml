
let pipe fs =
  let f a x = List.rev x in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,22)
EMPTY
EmptyG

(3,14)-(3,24)
EMPTY
EmptyG

*)
