
let sqsum xs =
  let f a x a x = a + (x * x) in let base = xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,22)-(3,29)
x
VarG

(3,44)-(3,46)
0
LitG

(3,67)-(3,71)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,67)-(3,71)
0
LitG

*)

(* changed exprs
Var (Just (3,22)-(3,23)) "x"
Lit (Just (4,13)-(4,14)) (LI 0)
Lam (Just (4,33)-(4,66)) (VarPat (Just (4,38)-(4,39)) "a") (Lam (Just (4,44)-(4,65)) (VarPat (Just (4,48)-(4,49)) "x") (Bop (Just (4,54)-(4,65)) Plus (Var (Just (4,54)-(4,55)) "a") (Bop (Just (4,58)-(4,65)) Times (Var (Just (4,59)-(4,60)) "x") (Var (Just (4,63)-(4,64)) "x"))) Nothing) Nothing
Lit (Just (4,67)-(4,68)) (LI 0)
*)

(* typed spans
(3,22)-(3,23)
(4,13)-(4,14)
(4,33)-(4,66)
(4,67)-(4,68)
*)

(* correct types
int
int
int -> int -> int
int
*)

(* bad types
int
int -> int -> int
int -> int -> int
int -> int -> int
*)
