
let pipe fs =
  let f a x d = a x d in
  let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x d = d in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,16)-(3,21)
d
VarG

*)

(* changed exprs
Var (Just (3,16)-(3,17)) "d"
*)

(* typed spans
(3,16)-(3,17)
*)

(* correct types
'a
*)

(* bad types
'a
*)
