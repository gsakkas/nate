
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2) l2)));;


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
(12,12)-(12,52)
List.append (clone 0
                   (len1 - len2)) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,12)-(12,52)) (Var (Just (12,13)-(12,24)) "List.append") [App (Just (12,25)-(12,48)) (Var (Just (12,26)-(12,31)) "clone") [Lit (Just (12,32)-(12,33)) (LI 0),Bop (Just (12,34)-(12,47)) Minus (Var (Just (12,35)-(12,39)) "len1") (Var (Just (12,42)-(12,46)) "len2")],Var (Just (12,49)-(12,51)) "l2"]
*)

(* typed spans
(12,12)-(12,52)
*)

(* correct types
int list
*)

(* bad types
'a list -> 'a list
*)
