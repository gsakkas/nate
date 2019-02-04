
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n = if n < 10 then n else digHelper (sumList n) in
  digHelper n;;


(* fix

let digitsOfInt n =
  let rec digitsHelper n l =
    if n = 0 then l else digitsHelper (n / 10) ((n mod 10) :: l) in
  if n <= 0 then [] else digitsHelper n [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n =
    if n < 10 then n else digHelper (sumList (digitsOfInt n)) in
  digHelper n;;

*)

(* changed spans
(2,16)-(2,70)
fun n ->
  (let rec digitsHelper =
     fun n ->
       fun l ->
         if n = 0
         then l
         else digitsHelper (n / 10)
                           ((n mod 10) :: l) in
   if n <= 0
   then []
   else digitsHelper n [])
LamG (LetG Rec (fromList [EmptyG]) EmptyG)

(5,65)-(5,66)
digitsOfInt n
AppG (fromList [VarG])

*)
