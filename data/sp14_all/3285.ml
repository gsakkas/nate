
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])
           | (list1,list2) -> (list1, list2)) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])
           | (list1,list2) -> ([1], [1])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,38)-(19,43)
[1]
ListG LitG

(20,4)-(22,51)
[1]
ListG LitG

*)

(* changed exprs
List (Just (19,31)-(19,34)) [Lit (Just (19,32)-(19,33)) (LI 1)] Nothing
List (Just (19,36)-(19,39)) [Lit (Just (19,37)-(19,38)) (LI 1)] Nothing
*)

(* typed spans
(19,31)-(19,34)
(19,36)-(19,39)
*)

(* correct types
int list
int list
*)

(* bad types
int
int list
*)
