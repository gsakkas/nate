
let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if true then List.append l1 l1;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(2,12)-(4,32)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
LamG (LamG EmptyG)

(4,2)-(4,32)
List.append (clone 0 (a - b))
            l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(4,5)-(4,9)
a < b
BopG VarG VarG

(4,15)-(4,32)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(4,27)-(4,29)
clone 0 (b - a)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(4,30)-(4,32)
if b < a
then (l1 , List.append (clone 0
                              (a - b)) l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)
