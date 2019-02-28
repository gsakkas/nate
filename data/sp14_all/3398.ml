
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,47)-(2,49)
0
LitG

*)

(* changed exprs
Lit (Just (2,47)-(2,48)) (LI 0)
*)

(* typed spans
(2,47)-(2,48)
*)

(* correct types
int
*)

(* bad types
'a list
*)
