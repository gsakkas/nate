
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
      let t1 = List.tl l1 in
      let t2 = List.tl l2 in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
      let t1 = List.nth l1 (List.length l1) in
      let t2 = List.nth l2 (List.length l2) in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,15)-(16,25)
List.nth l1 (List.length l1)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(17,15)-(17,25)
List.nth l2 (List.length l2)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(17,15)-(17,22)
List.length
VarG

*)

(* changed exprs
App (Just (16,15)-(16,43)) (Var (Just (16,15)-(16,23)) "List.nth") [Var (Just (16,24)-(16,26)) "l1",App (Just (16,27)-(16,43)) (Var (Just (16,28)-(16,39)) "List.length") [Var (Just (16,40)-(16,42)) "l1"]]
App (Just (17,15)-(17,43)) (Var (Just (17,15)-(17,23)) "List.nth") [Var (Just (17,24)-(17,26)) "l2",App (Just (17,27)-(17,43)) (Var (Just (17,28)-(17,39)) "List.length") [Var (Just (17,40)-(17,42)) "l2"]]
Var (Just (17,28)-(17,39)) "List.length"
*)

(* typed spans
(16,15)-(16,43)
(17,15)-(17,43)
(17,28)-(17,39)
*)

(* correct types
int
int
int list -> int
*)

(* bad types
int list
int list
int list -> int list
*)
