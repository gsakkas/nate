
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = [List.combine (List.rev l1) (List.rev l2); (0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = (List.combine (List.rev l1) (List.rev l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,15)-(30,65)
List.combine (List.rev l1)
             (List.rev l2) @ [(0 , 0)]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (30,15)-(30,68)) (Var (Just (30,58)-(30,59)) "@") [App (Just (30,15)-(30,57)) (Var (Just (30,16)-(30,28)) "List.combine") [App (Just (30,29)-(30,42)) (Var (Just (30,30)-(30,38)) "List.rev") [Var (Just (30,39)-(30,41)) "l1"],App (Just (30,43)-(30,56)) (Var (Just (30,44)-(30,52)) "List.rev") [Var (Just (30,53)-(30,55)) "l2"]],List (Just (30,60)-(30,68)) [Tuple (Just (30,61)-(30,67)) [Lit (Just (30,62)-(30,63)) (LI 0),Lit (Just (30,65)-(30,66)) (LI 0)]] Nothing]
*)

(* typed spans
(30,15)-(30,68)
*)

(* correct types
(int * int) list
*)

(* bad types
(int * int) list list
*)
