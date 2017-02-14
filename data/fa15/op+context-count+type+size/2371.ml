
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(4,13)-(4,52)
(4,17)-(4,52)
(4,23)-(4,24)
(4,38)-(4,40)
(4,51)-(4,52)
(6,21)-(7,58)
(7,3)-(7,58)
(7,9)-(7,10)
(7,24)-(7,26)
(7,38)-(7,49)
(7,38)-(7,51)
(7,38)-(7,58)
(7,50)-(7,51)
(7,53)-(7,54)
(7,55)-(7,58)
(7,56)-(7,57)
(10,3)-(12,7)
(14,20)-(19,17)
(21,16)-(22,68)
*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(4,4)-(4,54)
(4,13)-(4,52)
(4,17)-(4,52)
(4,17)-(4,52)
(4,17)-(4,52)
(4,23)-(4,24)
(4,51)-(4,52)
(7,3)-(7,58)
(7,3)-(7,58)
(7,38)-(7,49)
(7,38)-(7,51)
(7,38)-(7,58)
(7,50)-(7,51)
(7,53)-(7,54)
(7,55)-(7,58)
(7,55)-(7,58)
(7,56)-(7,57)
(9,4)-(12,9)
(9,13)-(12,7)
(10,3)-(12,7)
(11,45)-(11,50)
(11,45)-(11,50)
(11,45)-(11,65)
(11,45)-(11,65)
(11,56)-(11,58)
(11,56)-(11,65)
(12,3)-(12,5)
(12,3)-(12,7)
(17,11)-(17,18)
(17,11)-(17,20)
(17,19)-(17,20)
(17,34)-(17,45)
(17,34)-(17,47)
(17,46)-(17,47)
(18,12)-(18,22)
(18,12)-(18,46)
(18,24)-(18,31)
(18,24)-(18,46)
(18,33)-(18,44)
(18,33)-(18,46)
(22,47)-(22,57)
(22,47)-(22,68)
(22,59)-(22,66)
(22,59)-(22,68)
*)
