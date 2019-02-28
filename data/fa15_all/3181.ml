
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let ax::a' = a in
      let (a1,a2) = ax in
      ([((x1 + x2) + a1) / 10], [a2 :: (((x1 + x2) + a1) mod 10)]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([(x1 + x2) / 10], [(x1 + x2) mod 10]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,6)-(26,66)
([(x1 + x2) / 10] , [(x1 + x2) mod 10])
TupleG (fromList [ListG EmptyG])

*)

(* changed exprs
Tuple (Just (22,35)-(22,73)) [List (Just (22,36)-(22,52)) [Bop (Just (22,37)-(22,51)) Div (Bop (Just (22,37)-(22,46)) Plus (Var (Just (22,38)-(22,40)) "x1") (Var (Just (22,43)-(22,45)) "x2")) (Lit (Just (22,49)-(22,51)) (LI 10))] Nothing,List (Just (22,54)-(22,72)) [Bop (Just (22,55)-(22,71)) Mod (Bop (Just (22,55)-(22,64)) Plus (Var (Just (22,56)-(22,58)) "x1") (Var (Just (22,61)-(22,63)) "x2")) (Lit (Just (22,69)-(22,71)) (LI 10))] Nothing]
*)

(* typed spans
(22,35)-(22,73)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * 'a list list)
*)
