
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,5)-(3,17)
EMPTY
EmptyG

(3,6)-(3,13)
EMPTY
EmptyG

*)
