
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,35)-(4,37)
0
LitG

*)

(* changed exprs
Lit (Just (4,35)-(4,36)) (LI 0)
*)

(* typed spans
(4,35)-(4,36)
*)

(* correct types
int
*)

(* bad types
'a list
*)
