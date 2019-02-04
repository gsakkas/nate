
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, ((clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       List.append (((clone 0 l2G) l1), l2))
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(8,4)-(8,15)
EMPTY
EmptyG

(8,4)-(8,40)
EMPTY
EmptyG

(8,21)-(8,39)
EMPTY
EmptyG

(8,23)-(8,28)
clone 0 l1G
AppG (fromList [VarG,LitG])

(13,7)-(13,18)
EMPTY
EmptyG

(13,7)-(13,43)
EMPTY
EmptyG

(13,20)-(13,38)
EMPTY
EmptyG

(13,22)-(13,27)
clone 0 l2G
AppG (fromList [VarG,LitG])

*)
