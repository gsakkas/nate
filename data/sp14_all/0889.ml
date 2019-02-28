
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = l1 in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = ([], []) in
    let args = [([], [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,15)-(15,17)
([] , [])
TupleG (fromList [ListG EmptyG])

(16,15)-(16,17)
[([] , [])]
ListG (TupleG (fromList [EmptyG]))

(16,21)-(16,68)
[]
ListG EmptyG

*)

(* changed exprs
Tuple (Just (15,15)-(15,23)) [List (Just (15,16)-(15,18)) [] Nothing,List (Just (15,20)-(15,22)) [] Nothing]
List (Just (16,15)-(16,25)) [Tuple (Just (16,16)-(16,24)) [List (Just (16,17)-(16,19)) [] Nothing,List (Just (16,21)-(16,23)) [] Nothing]] Nothing
List (Just (16,21)-(16,23)) [] Nothing
*)

(* typed spans
(15,15)-(15,23)
(16,15)-(16,25)
(16,21)-(16,23)
*)

(* correct types
('a list * int list)
('a list * int list) list
int list
*)

(* bad types
('a * 'b)
('a * 'b) list
'a
*)
