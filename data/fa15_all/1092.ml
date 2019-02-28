
let rec helper (a,x) =
  match x with | [] -> 0 | h::t -> (h * h) + (helper (a, x));;

let sqsum xs =
  let f a x = helper (a, x) in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(6,14)-(6,27)
a * a
BopG VarG VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,19)) Times (Var (Just (3,14)-(3,15)) "a") (Var (Just (3,18)-(3,19)) "a")
*)

(* typed spans
(3,14)-(3,19)
*)

(* correct types
int
*)

(* bad types
int
*)
