
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if x = []
      then
        (if rem = 1
         then (0, (1 :: acc))
         else
           (let (el1,el2) = x in
            let new_sum = (rem + el1) + el2 in
            let new_rem = if new_sum > 9 then 1 else 0 in
            let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
            (new_rem, (norm_sum :: acc)))) in
    let base = (0, []) in
    let args = List.rev ([] @ (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        ((List.length acc) = (List.length l1)) ||
          ((List.length acc) = (List.length l2))
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,9)-(18,15)
(List.length acc = List.length l1) || (List.length acc = List.length l2)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(23,11)-(27,41)
(0 , acc)
TupleG (fromList [VarG,LitG])

(29,30)-(29,50)
List.combine
VarG

(29,30)-(29,50)
l1
VarG

(29,30)-(29,50)
l2
VarG

*)

(* changed exprs
Bop (Just (19,8)-(20,48)) Or (Bop (Just (19,8)-(19,46)) Eq (App (Just (19,9)-(19,26)) (Var (Just (19,10)-(19,21)) "List.length") [Var (Just (19,22)-(19,25)) "acc"]) (App (Just (19,29)-(19,45)) (Var (Just (19,30)-(19,41)) "List.length") [Var (Just (19,42)-(19,44)) "l1"])) (Bop (Just (20,10)-(20,48)) Eq (App (Just (20,11)-(20,28)) (Var (Just (20,12)-(20,23)) "List.length") [Var (Just (20,24)-(20,27)) "acc"]) (App (Just (20,31)-(20,47)) (Var (Just (20,32)-(20,43)) "List.length") [Var (Just (20,44)-(20,46)) "l2"]))
Tuple (Just (21,49)-(21,57)) [Lit (Just (21,50)-(21,51)) (LI 0),Var (Just (21,53)-(21,56)) "acc"]
Var (Just (29,25)-(29,37)) "List.combine"
Var (Just (29,38)-(29,40)) "l1"
Var (Just (29,41)-(29,43)) "l2"
*)

(* typed spans
(19,8)-(20,48)
(21,49)-(21,57)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
*)

(* correct types
bool
(int * int list)
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
bool
(int * int list)
(int * int) list
(int * int) list
(int * int) list
*)
