
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, (clone 0 (len1 - len2))) @ l2
  else (((clone 0 (len2 - len1)) @ l1), l2);;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(8,7)-(8,41)
(l1 , clone 0
            (len1 - len2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (8,7)-(8,43)) [Var (Just (8,8)-(8,10)) "l1",App (Just (8,12)-(8,42)) (Var (Just (8,37)-(8,38)) "@") [App (Just (8,13)-(8,36)) (Var (Just (8,14)-(8,19)) "clone") [Lit (Just (8,20)-(8,21)) (LI 0),Bop (Just (8,22)-(8,35)) Minus (Var (Just (8,23)-(8,27)) "len1") (Var (Just (8,30)-(8,34)) "len2")],Var (Just (8,39)-(8,41)) "l2"]]
*)

(* typed spans
(8,7)-(8,43)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * 'a list)
*)
