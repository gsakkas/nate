
let sqsum xs =
  let f a x = ((+) a) * a in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 9 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,21)
a
VarG

(3,42)-(3,43)
9
LitG

*)

(* changed exprs
Var (Just (3,14)-(3,15)) "a"
Lit (Just (3,36)-(3,37)) (LI 9)
*)

(* typed spans
(3,14)-(3,15)
(3,36)-(3,37)
*)

(* correct types
int
int
*)

(* bad types
int -> int
int
*)
