
let sqsum xs =
  let f a x = a * a in let base = f xs xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,36)-(3,38)
8
LitG

*)

(* changed exprs
Lit (Just (3,36)-(3,37)) (LI 8)
*)

(* typed spans
(3,36)-(3,37)
*)

(* correct types
int
*)

(* bad types
int
*)
