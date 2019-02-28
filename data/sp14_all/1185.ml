
let sqsum xs =
  let f a x = (a * a) + xs in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,24)-(3,26)
x
VarG

*)

(* changed exprs
Var (Just (3,24)-(3,25)) "x"
*)

(* typed spans
(3,24)-(3,25)
*)

(* correct types
int
*)

(* bad types
int
*)
