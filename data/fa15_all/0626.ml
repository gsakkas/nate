
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      if val1 > 9 then (1, ((val1 - 10) :: a2)) else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev ((List.combine [0]) @ ((l1 [0]) @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      if val1 > 9 then (1, ((val1 - 10) :: a2)) else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,25)-(21,43)
List.combine
VarG

(21,25)-(21,43)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG])))

(21,46)-(21,61)
l1
VarG

(21,46)-(21,61)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

*)

(* changed exprs
Var (Just (21,25)-(21,37)) "List.combine"
ConApp (Just (21,38)-(21,47)) "::" (Just (Tuple (Just (21,39)-(21,46)) [Lit (Just (21,39)-(21,40)) (LI 0),Var (Just (21,44)-(21,46)) "l1"])) Nothing
Var (Just (21,44)-(21,46)) "l1"
ConApp (Just (21,48)-(21,57)) "::" (Just (Tuple (Just (21,49)-(21,56)) [Lit (Just (21,49)-(21,50)) (LI 0),Var (Just (21,54)-(21,56)) "l2"])) Nothing
*)

(* typed spans
(21,25)-(21,37)
(21,38)-(21,47)
(21,44)-(21,46)
(21,48)-(21,57)
*)

(* correct types
int list -> int list -> (int * int) list
int list
int list
int list
*)

(* bad types
'a list -> (int * 'a) list
'a list -> (int * 'a) list
'a list
'a list
*)
