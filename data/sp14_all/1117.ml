
let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> appendLists ((listReverse t), [h]);;

let palindrome w =
  if (explode w) = (listReverse explode w) then true else false;;


(* fix

let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> appendLists ((listReverse t), [h]);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(14,19)-(14,42)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (14,19)-(14,44)) (Var (Just (14,20)-(14,31)) "listReverse") [App (Just (14,32)-(14,43)) (Var (Just (14,33)-(14,40)) "explode") [Var (Just (14,41)-(14,42)) "w"]]
*)

(* typed spans
(14,19)-(14,44)
*)

(* correct types
char list
*)

(* bad types
char list
*)
