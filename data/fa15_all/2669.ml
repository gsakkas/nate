
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) == (listReverse explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) == (listReverse (explode w)) then true else false;;

*)

(* changed spans
(11,20)-(11,43)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (11,20)-(11,45)) (Var (Just (11,21)-(11,32)) "listReverse") [App (Just (11,33)-(11,44)) (Var (Just (11,34)-(11,41)) "explode") [Var (Just (11,42)-(11,43)) "w"]]
*)

(* typed spans
(11,20)-(11,45)
*)

(* correct types
char list
*)

(* bad types
char list
*)
