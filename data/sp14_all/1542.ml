
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (x * x) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,61)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(4,2)-(4,47)
match xs with
| [] -> 0
| hd :: tl -> f 0 hd
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(4,17)-(4,19)
hd
VarG

*)

(* changed exprs
Bop (Just (3,14)-(3,25)) Plus (Var (Just (3,14)-(3,15)) "a") (Bop (Just (3,18)-(3,25)) Times (Var (Just (3,19)-(3,20)) "x") (Var (Just (3,23)-(3,24)) "x"))
Case (Just (4,13)-(4,55)) (Var (Just (4,19)-(4,21)) "xs") [(ConPat (Just (4,29)-(4,31)) "[]" Nothing,Nothing,Lit (Just (4,35)-(4,36)) (LI 0)),(ConsPat (Just (4,39)-(4,45)) (VarPat (Just (4,39)-(4,41)) "hd") (VarPat (Just (4,43)-(4,45)) "tl"),Nothing,App (Just (4,49)-(4,55)) (Var (Just (4,49)-(4,50)) "f") [Lit (Just (4,51)-(4,52)) (LI 0),Var (Just (4,53)-(4,55)) "hd"])]
Var (Just (4,53)-(4,55)) "hd"
*)

(* typed spans
(3,14)-(3,25)
(4,13)-(4,55)
(4,53)-(4,55)
*)

(* correct types
int
int
int
*)

(* bad types
int
int
int list
*)
