
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then clone 0 (len1 - len2)
  else (((clone 0 (len2 - len1)) @ l1), l2);;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (((clone 0 (len1 - len2)) @ l2), l1)
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(11,7)-(11,28)
(clone 0
       (len1 - len2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,7)-(11,43)) [App (Just (11,8)-(11,38)) (Var (Just (11,33)-(11,34)) "@") [App (Just (11,9)-(11,32)) (Var (Just (11,10)-(11,15)) "clone") [Lit (Just (11,16)-(11,17)) (LI 0),Bop (Just (11,18)-(11,31)) Minus (Var (Just (11,19)-(11,23)) "len1") (Var (Just (11,26)-(11,30)) "len2")],Var (Just (11,35)-(11,37)) "l2"],Var (Just (11,40)-(11,42)) "l1"]
*)

(* typed spans
(11,7)-(11,43)
*)

(* correct types
(int list * int list)
*)

(* bad types
int list
*)
