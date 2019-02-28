
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), (((clone 0) - diff) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

*)

(* changed spans
(6,27)-(6,45)
clone 0 (- diff)
AppG (fromList [UopG EmptyG,LitG])

*)

(* changed exprs
App (Just (6,27)-(6,45)) (Var (Just (6,28)-(6,33)) "clone") [Lit (Just (6,34)-(6,35)) (LI 0),Uop (Just (6,36)-(6,44)) Neg (Var (Just (6,39)-(6,43)) "diff")]
*)

(* typed spans
(6,27)-(6,45)
*)

(* correct types
int list
*)

(* bad types
int
*)
