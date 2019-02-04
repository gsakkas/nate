
let pipe fs =
  let f a x = x fs in let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,14)-(3,18)
EMPTY
EmptyG

(3,16)-(3,18)
EMPTY
EmptyG

*)
