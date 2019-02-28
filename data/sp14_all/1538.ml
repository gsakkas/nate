
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> xs | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,64)
match xs with
| hd :: tl -> f (f hd hd) tl
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (4,13)-(4,53)) (Var (Just (4,19)-(4,21)) "xs") [(ConsPat (Just (4,29)-(4,35)) (VarPat (Just (4,29)-(4,31)) "hd") (VarPat (Just (4,33)-(4,35)) "tl"),Nothing,App (Just (4,39)-(4,53)) (Var (Just (4,39)-(4,40)) "f") [App (Just (4,41)-(4,50)) (Var (Just (4,42)-(4,43)) "f") [Var (Just (4,44)-(4,46)) "hd",Var (Just (4,47)-(4,49)) "hd"],Var (Just (4,51)-(4,53)) "tl"])]
*)

(* typed spans
(4,13)-(4,53)
*)

(* correct types
int
*)

(* bad types
int list
*)
