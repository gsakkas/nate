
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y = match y with | [] -> [] | h::t -> t;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,19)-(7,58)
EMPTY
EmptyG

(7,23)-(7,58)
EMPTY
EmptyG

(7,29)-(7,30)
EMPTY
EmptyG

(7,44)-(7,46)
EMPTY
EmptyG

(7,57)-(7,58)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,15)-(10,68)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(10,57)-(10,68)
EMPTY
EmptyG

(10,58)-(10,65)
EMPTY
EmptyG

*)
