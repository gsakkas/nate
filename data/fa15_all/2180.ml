
let sqsum xs =
  let f a x = a + (x * x) in let base x = x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,38)-(3,43)
0
LitG

*)

(* changed exprs
Lit (Just (3,40)-(3,41)) (LI 0)
*)

(* typed spans
(3,40)-(3,41)
*)

(* correct types
int
*)

(* bad types
'a -> 'a
*)
