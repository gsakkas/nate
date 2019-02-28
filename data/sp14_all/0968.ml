
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (l2 - l1)) l1), l2)
  else (l1, (List.append (clone 0 (l1 - l2) l2)));;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

*)

(* changed spans
(11,36)-(11,38)
len2
VarG

(11,41)-(11,43)
len1
VarG

(12,12)-(12,48)
List.append (clone 0
                   (len1 - len2)) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (11,31)-(11,35)) "len2"
Var (Just (11,38)-(11,42)) "len1"
App (Just (12,12)-(12,52)) (Var (Just (12,13)-(12,24)) "List.append") [App (Just (12,25)-(12,48)) (Var (Just (12,26)-(12,31)) "clone") [Lit (Just (12,32)-(12,33)) (LI 0),Bop (Just (12,34)-(12,47)) Minus (Var (Just (12,35)-(12,39)) "len1") (Var (Just (12,42)-(12,46)) "len2")],Var (Just (12,49)-(12,51)) "l2"]
*)

(* typed spans
(11,31)-(11,35)
(11,38)-(11,42)
(12,12)-(12,52)
*)

(* correct types
int
int
int list
*)

(* bad types
int list
int list
'a list -> 'a list
*)
