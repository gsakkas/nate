
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,24)-(18,58)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
App (Just (18,24)-(18,58)) (Var (Just (18,25)-(18,37)) "List.combine") [ConApp (Just (18,38)-(18,47)) "::" (Just (Tuple (Just (18,39)-(18,46)) [Lit (Just (18,39)-(18,40)) (LI 0),Var (Just (18,44)-(18,46)) "l1"])) Nothing,ConApp (Just (18,48)-(18,57)) "::" (Just (Tuple (Just (18,49)-(18,56)) [Lit (Just (18,49)-(18,50)) (LI 0),Var (Just (18,54)-(18,56)) "l2"])) Nothing]
*)

(* typed spans
(18,24)-(18,58)
*)

(* correct types
(int * int) list
*)

(* bad types
(int * int) list
*)
