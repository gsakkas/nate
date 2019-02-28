
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (d1,d2)::ds -> ((d1 + (d2 mod 10)), (a :: ds)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,77)
match x with
| (d1 , d2) -> (d1 + d2 , (d1 + d2) :: (match a with
                                        | (a1 , a2) -> a2))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (24,6)-(26,70)) (Var (Just (24,12)-(24,13)) "x") [(TuplePat (Just (25,9)-(25,14)) [VarPat (Just (25,9)-(25,11)) "d1",VarPat (Just (25,12)-(25,14)) "d2"],Nothing,Tuple (Just (26,10)-(26,70)) [Bop (Just (26,11)-(26,20)) Plus (Var (Just (26,12)-(26,14)) "d1") (Var (Just (26,17)-(26,19)) "d2"),ConApp (Just (26,22)-(26,69)) "::" (Just (Tuple (Just (26,23)-(26,68)) [Bop (Just (26,23)-(26,32)) Plus (Var (Just (26,24)-(26,26)) "d1") (Var (Just (26,29)-(26,31)) "d2"),Case (Just (26,36)-(26,68)) (Var (Just (26,44)-(26,45)) "a") [(TuplePat (Just (26,54)-(26,59)) [VarPat (Just (26,54)-(26,56)) "a1",VarPat (Just (26,57)-(26,59)) "a2"],Nothing,Var (Just (26,64)-(26,66)) "a2")]])) Nothing])]
*)

(* typed spans
(24,6)-(26,70)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * (int * int) list)
*)
