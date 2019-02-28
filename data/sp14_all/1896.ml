
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 < lenl2
  then
    ((List.append (clone 0 (lenl1 - lenl2)) l1),
      (List.append (clone 0 (lenl1 - lenl2)) l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  ((List.append (clone 0 (lenl1 - lenl2)) l1),
    (List.append (clone 0 (lenl1 - lenl2)) l2));;

*)

(* changed spans
(7,2)-(10,49)
(List.append (clone 0
                    (lenl1 - lenl2))
             l1 , List.append (clone 0
                                     (lenl1 - lenl2)) l2)
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (7,2)-(8,47)) [App (Just (7,3)-(7,45)) (Var (Just (7,4)-(7,15)) "List.append") [App (Just (7,16)-(7,41)) (Var (Just (7,17)-(7,22)) "clone") [Lit (Just (7,23)-(7,24)) (LI 0),Bop (Just (7,25)-(7,40)) Minus (Var (Just (7,26)-(7,31)) "lenl1") (Var (Just (7,34)-(7,39)) "lenl2")],Var (Just (7,42)-(7,44)) "l1"],App (Just (8,4)-(8,46)) (Var (Just (8,5)-(8,16)) "List.append") [App (Just (8,17)-(8,42)) (Var (Just (8,18)-(8,23)) "clone") [Lit (Just (8,24)-(8,25)) (LI 0),Bop (Just (8,26)-(8,41)) Minus (Var (Just (8,27)-(8,32)) "lenl1") (Var (Just (8,35)-(8,40)) "lenl2")],Var (Just (8,43)-(8,45)) "l2"]]
*)

(* typed spans
(7,2)-(8,47)
*)

(* correct types
(int list * int list)
*)

(* bad types
unit
*)
