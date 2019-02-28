
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append ((clone 0 (- diff)), len1)), len2)
  else ((List.append ((clone 0 diff), len2)), len1);;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else ((List.append (clone 0 diff) l2), l1);;

*)

(* changed spans
(12,8)-(12,48)
List.append (clone 0 (- diff))
            l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,7)-(13,51)
l2
VarG

(13,8)-(13,44)
List.append (clone 0 diff) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(13,46)-(13,50)
l2
VarG

*)

(* changed exprs
App (Just (12,8)-(12,43)) (Var (Just (12,9)-(12,20)) "List.append") [App (Just (12,21)-(12,39)) (Var (Just (12,22)-(12,27)) "clone") [Lit (Just (12,28)-(12,29)) (LI 0),Uop (Just (12,30)-(12,38)) Neg (Var (Just (12,33)-(12,37)) "diff")],Var (Just (12,40)-(12,42)) "l1"]
Var (Just (12,45)-(12,47)) "l2"
App (Just (13,8)-(13,39)) (Var (Just (13,9)-(13,20)) "List.append") [App (Just (13,21)-(13,35)) (Var (Just (13,22)-(13,27)) "clone") [Lit (Just (13,28)-(13,29)) (LI 0),Var (Just (13,30)-(13,34)) "diff"],Var (Just (13,36)-(13,38)) "l2"]
Var (Just (13,36)-(13,38)) "l2"
*)

(* typed spans
(12,8)-(12,43)
(12,45)-(12,47)
(13,8)-(13,39)
(13,36)-(13,38)
*)

(* correct types
int list
int list
int list
int list
*)

(* bad types
'a
('a * int)
'a
int
*)
