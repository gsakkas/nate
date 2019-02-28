
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,17)
a
VarG

(3,32)-(3,33)
f
VarG

(3,42)-(3,66)
xs
VarG

*)

(* changed exprs
Var (Just (2,27)-(2,28)) "a"
Var (Just (2,43)-(2,44)) "f"
Var (Just (2,47)-(2,49)) "xs"
*)

(* typed spans
(2,27)-(2,28)
(2,43)-(2,44)
(2,47)-(2,49)
*)

(* correct types
int
int -> 'a -> int
'a
*)

(* bad types
int -> int -> int
int
int -> int -> int
*)
