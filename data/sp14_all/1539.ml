
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f tl tl) in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f (f hd hd) tl) in
  List.fold_left f base xs;;

*)

(* changed spans
(4,54)-(4,56)
f hd hd
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (4,54)-(4,63)) (Var (Just (4,55)-(4,56)) "f") [Var (Just (4,57)-(4,59)) "hd",Var (Just (4,60)-(4,62)) "hd"]
*)

(* typed spans
(4,54)-(4,63)
*)

(* correct types
int
*)

(* bad types
int list
*)
