
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,20)-(3,70)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(3,34)-(3,36)
accum
VarG

(3,42)-(3,51)
EMPTY
EmptyG

(3,43)-(3,48)
EMPTY
EmptyG

(3,55)-(3,70)
EMPTY
EmptyG

(3,62)-(3,69)
helper x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)
