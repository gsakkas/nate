
let pipe fs =
  let f a x = x fs in let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,14)-(3,18)
x
VarG

*)

(* changed exprs
Var (Just (3,14)-(3,15)) "x"
*)

(* typed spans
(3,14)-(3,15)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a
*)
