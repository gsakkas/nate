
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: ((accum n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,42)-(3,51)
clone x n
AppG (fromList [VarG])

(3,42)-(3,70)
EMPTY
EmptyG

(3,55)-(3,70)
EMPTY
EmptyG

(3,56)-(3,65)
EMPTY
EmptyG

(3,57)-(3,62)
EMPTY
EmptyG

(3,68)-(3,69)
EMPTY
EmptyG

*)
