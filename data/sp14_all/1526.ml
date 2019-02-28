
let sqsum xs = let f a x = (+) in let base = 2 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,30)
a
VarG

(2,45)-(2,46)
f 2 xs
AppG (fromList [VarG,LitG])

(2,50)-(2,74)
xs
VarG

*)

(* changed exprs
Var (Just (2,27)-(2,28)) "a"
App (Just (2,43)-(2,49)) (Var (Just (2,43)-(2,44)) "f") [Lit (Just (2,45)-(2,46)) (LI 2),Var (Just (2,47)-(2,49)) "xs"]
Var (Just (2,47)-(2,49)) "xs"
*)

(* typed spans
(2,27)-(2,28)
(2,43)-(2,49)
(2,47)-(2,49)
*)

(* correct types
int
int
'a
*)

(* bad types
int -> int -> int
int
'a
*)
