
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans
(4,51)-(4,60)
*)

(* type error slice
(4,2)-(4,49)
(4,2)-(4,70)
(4,5)-(4,6)
(4,5)-(4,11)
(4,5)-(4,11)
(4,10)-(4,11)
(4,17)-(4,23)
(4,29)-(4,39)
(4,29)-(4,49)
(4,29)-(4,49)
(4,43)-(4,49)
(4,51)-(4,60)
(4,51)-(4,60)
(4,51)-(4,60)
(4,51)-(4,70)
(4,51)-(4,70)
(4,52)-(4,53)
(4,57)-(4,59)
(4,64)-(4,70)
*)
