
let rec listReverse l =
  if (List.length l) > 0 then (listReverse List.tl l) @ [List.hd l] else [];;


(* fix

let rec listReverse l = if (List.length l) > 0 then [List.hd l] else [];;

*)

(* changed spans
(3,30)-(3,53)
EMPTY
EmptyG

(3,30)-(3,67)
EMPTY
EmptyG

(3,31)-(3,42)
EMPTY
EmptyG

(3,43)-(3,50)
EMPTY
EmptyG

(3,51)-(3,52)
EMPTY
EmptyG

(3,54)-(3,55)
EMPTY
EmptyG

*)
