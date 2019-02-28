
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,15)
f 4 xs
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (4,13)-(4,19)) (Var (Just (4,13)-(4,14)) "f") [Lit (Just (4,15)-(4,16)) (LI 4),Var (Just (4,17)-(4,19)) "xs"]
*)

(* typed spans
(4,13)-(4,19)
*)

(* correct types
int
*)

(* bad types
'a list
*)
