
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f - (1 hd) in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,49)-(4,59)
f 0 hd
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (4,49)-(4,55)) (Var (Just (4,49)-(4,50)) "f") [Lit (Just (4,51)-(4,52)) (LI 0),Var (Just (4,53)-(4,55)) "hd"]
*)

(* typed spans
(4,49)-(4,55)
*)

(* correct types
int
*)

(* bad types
int
*)
