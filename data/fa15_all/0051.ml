
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone (0 (ll2 - ll1))) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

*)

(* changed spans
(9,9)-(9,32)
clone 0 (ll2 - ll1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
App (Just (9,9)-(9,30)) (Var (Just (9,10)-(9,15)) "clone") [Lit (Just (9,16)-(9,17)) (LI 0),Bop (Just (9,18)-(9,29)) Minus (Var (Just (9,19)-(9,22)) "ll2") (Var (Just (9,25)-(9,28)) "ll1")]
*)

(* typed spans
(9,9)-(9,30)
*)

(* correct types
int list
*)

(* bad types
int -> int list
*)
