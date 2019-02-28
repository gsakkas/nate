
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

let palindrome w =
  if (listReverse explode w) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(13,5)-(13,28)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (13,5)-(13,30)) (Var (Just (13,6)-(13,17)) "listReverse") [App (Just (13,18)-(13,29)) (Var (Just (13,19)-(13,26)) "explode") [Var (Just (13,27)-(13,28)) "w"]]
*)

(* typed spans
(13,5)-(13,30)
*)

(* correct types
char list
*)

(* bad types
char list
*)
