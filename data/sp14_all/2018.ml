
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

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.rev List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  List.rev removeZero (add (padZero l1 l2));;


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

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in List.rev res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,15)-(21,42)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,2)-(23,43)
List.rev res
AppG (fromList [VarG])

(23,11)-(23,21)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (21,15)-(21,44)) (Var (Just (21,15)-(21,23)) "List.rev") [App (Just (21,24)-(21,44)) (Var (Just (21,25)-(21,37)) "List.combine") [Var (Just (21,38)-(21,40)) "l1",Var (Just (21,41)-(21,43)) "l2"]]
App (Just (22,44)-(22,56)) (Var (Just (22,44)-(22,52)) "List.rev") [Var (Just (22,53)-(22,56)) "res"]
App (Just (23,2)-(23,34)) (Var (Just (23,2)-(23,12)) "removeZero") [App (Just (23,13)-(23,34)) (Var (Just (23,14)-(23,17)) "add") [App (Just (23,18)-(23,33)) (Var (Just (23,19)-(23,26)) "padZero") [Var (Just (23,27)-(23,29)) "l1",Var (Just (23,30)-(23,32)) "l2"]]]
*)

(* typed spans
(21,15)-(21,44)
(22,44)-(22,56)
(23,2)-(23,34)
*)

(* correct types
(int * int) list
int list
int list
*)

(* bad types
(int * int) list
'a
int list -> int list
*)
