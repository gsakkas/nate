
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (explode (listReverse w));;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(12,42)-(12,57)
listReverse
VarG

(12,42)-(12,57)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (12,34)-(12,45)) "listReverse"
App (Just (12,46)-(12,57)) (Var (Just (12,47)-(12,54)) "explode") [Var (Just (12,55)-(12,56)) "w"]
*)

(* typed spans
(12,34)-(12,45)
(12,46)-(12,57)
*)

(* correct types
char list -> char list
char list
*)

(* bad types
string
string
*)
