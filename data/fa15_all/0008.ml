
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let listZeros = clone 0 abs numZeros in
  if numZeros > 0 then [(l1, (listZeros @ l2))] else [((listZeros @ l1), l2)];;


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
(6,2)-(7,77)
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

(6,18)-(6,38)
clone 0 absNumZeros
AppG (fromList [VarG,LitG])

(6,26)-(6,29)
absNumZeros
VarG

(7,23)-(7,47)
EMPTY
EmptyG

(7,53)-(7,77)
EMPTY
EmptyG

*)

(* typed spans
(6,2)-(11,77)
(10,21)-(10,40)
(10,29)-(10,40)
*)

(* typed spans
(int list * int list)
int list
int
*)

(* typed spans
('a list * 'a list) list
'a list
int -> int
*)
