
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) @ l1), l2) else (l1, ((clone 0 n) @ l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,18)-(7,33)
clone 0 (- n)
AppG (fromList [UopG EmptyG,LitG])

*)

(* changed exprs
App (Just (7,18)-(7,33)) (Var (Just (7,19)-(7,24)) "clone") [Lit (Just (7,25)-(7,26)) (LI 0),Uop (Just (7,27)-(7,32)) Neg (Var (Just (7,30)-(7,31)) "n")]
*)

(* typed spans
(7,18)-(7,33)
*)

(* correct types
int list
*)

(* bad types
int
*)
