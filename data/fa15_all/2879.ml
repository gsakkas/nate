
let sqsum xs =
  let f a x = (a ** 2) + (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,22)
a * a
BopG VarG VarG

(3,26)-(3,27)
x * x
BopG VarG VarG

(3,31)-(3,32)
x
VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,21)) Times (Var (Just (3,15)-(3,16)) "a") (Var (Just (3,19)-(3,20)) "a")
Bop (Just (3,24)-(3,31)) Times (Var (Just (3,25)-(3,26)) "x") (Var (Just (3,29)-(3,30)) "x")
Var (Just (3,29)-(3,30)) "x"
*)

(* typed spans
(3,14)-(3,21)
(3,24)-(3,31)
(3,29)-(3,30)
*)

(* correct types
int
int
int
*)

(* bad types
int
float
int
*)
