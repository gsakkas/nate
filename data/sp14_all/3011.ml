
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],_),y) -> (([], 0), y)
      | ((h::t,carry),y) ->
          let sum = (h + x) + carry in ((t, (sum / 10)), ((sum mod 10) :: y)) in
    let base = ((0 :: ((List.rev l1), 0)), []) in
    let args = 0 :: (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],_),y) -> (([], 0), y)
      | ((h::t,carry),y) ->
          let sum = (h + x) + carry in ((t, (sum / 10)), ((sum mod 10) :: y)) in
    let base = (((0 :: (List.rev l1)), 0), []) in
    let args = 0 :: (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,16)-(25,41)
(0 :: (List.rev l1) , 0)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),LitG])))])

*)

(* changed exprs
Tuple (Just (25,16)-(25,41)) [ConApp (Just (25,17)-(25,37)) "::" (Just (Tuple (Just (25,18)-(25,36)) [Lit (Just (25,18)-(25,19)) (LI 0),App (Just (25,23)-(25,36)) (Var (Just (25,24)-(25,32)) "List.rev") [Var (Just (25,33)-(25,35)) "l1"]])) Nothing,Lit (Just (25,39)-(25,40)) (LI 0)]
*)

(* typed spans
(25,16)-(25,41)
*)

(* correct types
(int list * int)
*)

(* bad types
int list
*)
