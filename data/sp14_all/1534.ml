
let sqsum xs =
  let f a x = (a * a) + x in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,25)
a * a
BopG VarG VarG

(3,42)-(3,43)
8
LitG

*)

(* changed exprs
Bop (Just (3,14)-(3,19)) Times (Var (Just (3,14)-(3,15)) "a") (Var (Just (3,18)-(3,19)) "a")
Lit (Just (3,36)-(3,37)) (LI 8)
*)

(* typed spans
(3,14)-(3,19)
(3,36)-(3,37)
*)

(* correct types
int
int
*)

(* bad types
int
int
*)
