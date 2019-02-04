
let pipe fs =
  let f a x d = a x d in
  let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x d = d in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,16)-(3,17)
EMPTY
EmptyG

(3,16)-(3,21)
EMPTY
EmptyG

(3,18)-(3,19)
EMPTY
EmptyG

*)
