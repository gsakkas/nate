
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, (((clone 0 s1) - s2) @ l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(9,29)-(9,48)
clone 0 (s1 - s2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
App (Just (9,29)-(9,48)) (Var (Just (9,30)-(9,35)) "clone") [Lit (Just (9,36)-(9,37)) (LI 0),Bop (Just (9,38)-(9,47)) Minus (Var (Just (9,39)-(9,41)) "s1") (Var (Just (9,44)-(9,46)) "s2")]
*)

(* typed spans
(9,29)-(9,48)
*)

(* correct types
int list
*)

(* bad types
int
*)
