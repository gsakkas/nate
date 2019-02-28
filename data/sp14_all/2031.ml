
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> ((((clone 0) - lendiff) @ l1), l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

*)

(* changed spans
(12,21)-(12,42)
clone 0 (- lendiff)
AppG (fromList [UopG EmptyG,LitG])

*)

(* changed exprs
App (Just (12,21)-(12,42)) (Var (Just (12,22)-(12,27)) "clone") [Lit (Just (12,28)-(12,29)) (LI 0),Uop (Just (12,30)-(12,41)) Neg (Var (Just (12,33)-(12,40)) "lendiff")]
*)

(* typed spans
(12,21)-(12,42)
*)

(* correct types
int list
*)

(* bad types
int
*)
