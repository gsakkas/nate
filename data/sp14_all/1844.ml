
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> helper (append [m / 10] [m mod 10]) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> append tl (hd :: xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(6,34)-(6,40)
EMPTY
EmptyG

(6,34)-(6,69)
EMPTY
EmptyG

(6,49)-(6,57)
helper (m / 10)
AppG (fromList [BopG EmptyG EmptyG])

(6,50)-(6,56)
helper
VarG

*)
