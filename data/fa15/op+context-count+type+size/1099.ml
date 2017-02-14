
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
(11,22)-(11,43)
(11,34)-(11,41)
*)

(* type error slice
(8,38)-(8,49)
(8,38)-(8,51)
(8,38)-(8,58)
(8,53)-(8,54)
(11,22)-(11,33)
(11,22)-(11,43)
*)