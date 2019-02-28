
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          if o = 0
          then (if x < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l)))
          else
            if o = 1
            then
              (if (x + 1) < 10
               then (0, (x :: l))
               else (1, (((x + 1) mod 10) :: l))) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = o + x in
          if sum < 10 then (0, (x :: l)) else (1, ((x mod 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,10)-(28,49)
let sum = o + x in
if sum < 10
then (0 , x :: l)
else (1 , (x mod 10) :: l)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(21,13)-(21,14)
o + x
BopG VarG VarG

(21,17)-(21,18)
EMPTY
EmptyG

(22,23)-(22,25)
EMPTY
EmptyG

(24,12)-(28,49)
EMPTY
EmptyG

(24,15)-(24,20)
EMPTY
EmptyG

(26,18)-(26,25)
sum
VarG

(28,26)-(28,33)
EMPTY
EmptyG

(28,31)-(28,32)
EMPTY
EmptyG

*)

(* typed spans
(21,10)-(22,68)
(21,20)-(21,25)
(22,13)-(22,16)
*)

(* typed spans
(int * int list)
int
int
*)

(* typed spans
unit
int
int
*)
