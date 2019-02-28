
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,57)
f 2 xs
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (3,34)-(3,40)) (Var (Just (3,34)-(3,35)) "f") [Lit (Just (3,36)-(3,37)) (LI 2),Var (Just (3,38)-(3,40)) "xs"]
*)

(* typed spans
(3,34)-(3,40)
*)

(* correct types
int
*)

(* bad types
'a list
*)
