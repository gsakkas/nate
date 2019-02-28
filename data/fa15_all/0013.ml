
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then [(l1, l2)]
  else
    (let numZeros = (List.length l1) - (List.length l2) in
     if numZeros = 0 then [(l1, l2)]);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(2,12)-(7,37)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

(3,2)-(7,37)
EMPTY
EmptyG

(7,5)-(7,36)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(7,26)-(7,36)
EMPTY
EmptyG

*)

(* typed spans
(2,14)-(2,65)
(6,2)-(11,77)
*)

(* typed spans
int -> int -> int list
(int list * int list)
*)

(* typed spans
'a list -> 'b list -> unit
unit
*)
