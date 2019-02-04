
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else x @ (digitsOfInt y));;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

*)

(* changed spans
(2,20)-(7,49)
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
LamG (LamG EmptyG)

(7,31)-(7,32)
append
VarG

*)
