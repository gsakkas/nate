
let checkSame (x,y) = x == y;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if checkSame ((listReverse (explode w)), (explode w))
  then true
  else explode w;;


(* fix

let checkSame (x,y) = x == y;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if checkSame ((listReverse (explode w)), (explode w)) then true else false;;

*)

(* changed spans
(15,7)-(15,16)
false
LitG

*)

(* changed exprs
Lit (Just (13,71)-(13,76)) (LB False)
*)

(* typed spans
(13,71)-(13,76)
*)

(* correct types
bool
*)

(* bad types
char list
*)
