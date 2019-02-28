
let bigMul l1 l2 =
  let f a x = a @ 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,18)-(3,19)
[0]
ListG LitG

*)

(* changed exprs
List (Just (3,18)-(3,21)) [Lit (Just (3,19)-(3,20)) (LI 0)] Nothing
*)

(* typed spans
(3,18)-(3,21)
*)

(* correct types
int list
*)

(* bad types
int
*)
