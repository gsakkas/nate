
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, (t :: l));;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(5,24)-(5,25)
(5,51)-(5,59)
(5,57)-(5,58)
*)

(* type error slice
(2,3)-(5,62)
(2,15)-(5,60)
(5,15)-(5,21)
(5,15)-(5,25)
(5,15)-(5,25)
(5,24)-(5,25)
(5,38)-(5,43)
(5,38)-(5,60)
(5,44)-(5,60)
(5,51)-(5,59)
(5,51)-(5,59)
(5,57)-(5,58)
*)

(* all spans
(2,15)-(5,60)
(3,2)-(5,60)
(3,8)-(3,16)
(3,9)-(3,15)
(3,10)-(3,11)
(3,13)-(3,14)
(4,10)-(4,11)
(5,12)-(5,60)
(5,15)-(5,25)
(5,15)-(5,21)
(5,16)-(5,17)
(5,19)-(5,20)
(5,24)-(5,25)
(5,31)-(5,32)
(5,38)-(5,60)
(5,38)-(5,43)
(5,44)-(5,60)
(5,45)-(5,46)
(5,48)-(5,49)
(5,51)-(5,59)
(5,52)-(5,53)
(5,57)-(5,58)
*)
