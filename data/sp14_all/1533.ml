
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f (f 0 xs) xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,25)
a * a
BopG VarG VarG

(3,42)-(3,43)
f 0 xs
AppG (fromList [VarG,LitG])

(3,50)-(3,74)
xs
VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,19)) Times (Var (Just (3,14)-(3,15)) "a") (Var (Just (3,18)-(3,19)) "a")
App (Just (3,36)-(3,44)) (Var (Just (3,37)-(3,38)) "f") [Lit (Just (3,39)-(3,40)) (LI 0),Var (Just (3,41)-(3,43)) "xs"]
Var (Just (3,45)-(3,47)) "xs"
*)

(* typed spans
(3,14)-(3,19)
(3,36)-(3,44)
(3,45)-(3,47)
*)

(* correct types
int
int
'a
*)

(* bad types
int
int
'a
*)
