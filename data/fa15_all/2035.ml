
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,24)-(20,58)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
App (Just (20,24)-(20,58)) (Var (Just (20,25)-(20,37)) "List.combine") [ConApp (Just (20,38)-(20,47)) "::" (Just (Tuple (Just (20,39)-(20,46)) [Lit (Just (20,39)-(20,40)) (LI 0),Var (Just (20,44)-(20,46)) "l1"])) Nothing,ConApp (Just (20,48)-(20,57)) "::" (Just (Tuple (Just (20,49)-(20,56)) [Lit (Just (20,49)-(20,50)) (LI 0),Var (Just (20,54)-(20,56)) "l2"])) Nothing]
*)

(* typed spans
(20,24)-(20,58)
*)

(* correct types
(int * int) list
*)

(* bad types
(int * int) list
*)
