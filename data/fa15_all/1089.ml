
let sqsum xs =
  let f a x = match x with | [] -> 0 | h::t -> a * a in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,52)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* changed exprs
Bop (Just (3,14)-(3,31)) Plus (Bop (Just (3,14)-(3,21)) Times (Var (Just (3,15)-(3,16)) "a") (Var (Just (3,19)-(3,20)) "a")) (Bop (Just (3,24)-(3,31)) Times (Var (Just (3,25)-(3,26)) "x") (Var (Just (3,29)-(3,30)) "x"))
*)

(* typed spans
(3,14)-(3,31)
*)

(* correct types
int
*)

(* bad types
int
*)
