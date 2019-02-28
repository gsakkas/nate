
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then ((((clone 0 (-1)) * len) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

*)

(* changed spans
(7,9)-(7,31)
clone 0 ((-1) * len)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
App (Just (7,9)-(7,31)) (Var (Just (7,10)-(7,15)) "clone") [Lit (Just (7,16)-(7,17)) (LI 0),Bop (Just (7,18)-(7,30)) Times (Lit (Just (7,19)-(7,23)) (LI (-1))) (Var (Just (7,26)-(7,29)) "len")]
*)

(* typed spans
(7,9)-(7,31)
*)

(* correct types
int list
*)

(* bad types
int
*)
