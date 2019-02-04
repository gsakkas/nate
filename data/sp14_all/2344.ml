
let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in if a < b then a;;


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
(2,12)-(3,69)
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

(3,54)-(3,69)
l1
VarG

(3,68)-(3,69)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
