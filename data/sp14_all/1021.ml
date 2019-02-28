
let a = 20;;

let pipe fs =
  let f a x = x in let base p = a p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(5,32)-(5,35)
p
VarG

*)

(* changed exprs
Var (Just (3,32)-(3,33)) "p"
*)

(* typed spans
(3,32)-(3,33)
*)

(* correct types
'a
*)

(* bad types
'a
*)
