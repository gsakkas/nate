
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
  | [] -> true
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

let rec matchHeads x =
  match x with | [] -> true | h::t -> if true then true else false;;

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
(22,16)-(23,68)
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
(18,11)-(18,18)
(18,11)-(18,20)
(18,19)-(18,20)
(18,34)-(18,45)
(18,34)-(18,47)
(18,46)-(18,47)
(19,12)-(19,22)
(19,12)-(19,46)
(19,24)-(19,31)
(19,24)-(19,46)
(19,33)-(19,44)
(19,33)-(19,46)
(23,47)-(23,57)
(23,47)-(23,68)
(23,59)-(23,66)
(23,59)-(23,68)
*)
