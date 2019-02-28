
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
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (o,l) ->
        let prod = (mulByDigit x) + o in
        if prod < 10
        then (0, (prod :: l))
        else ((prod / 10), ((prod mod 10) :: l)) in
  let base = (0, []) in
  let args =
    let combine (a,b) = a + b in
    (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
  let (_,res) = List.fold_left f base args in res;;


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
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with | (o,l) -> ((10 * o), (bigAdd (mulByDigit o l1) l)) in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,8)-(40,48)
EMPTY
EmptyG

(37,19)-(37,33)
EMPTY
EmptyG

(37,19)-(37,37)
EMPTY
EmptyG

(37,20)-(37,30)
EMPTY
EmptyG

(37,31)-(37,32)
EMPTY
EmptyG

(37,36)-(37,37)
EMPTY
EmptyG

(38,8)-(40,48)
EMPTY
EmptyG

(38,11)-(38,15)
EMPTY
EmptyG

(38,11)-(38,20)
EMPTY
EmptyG

(38,18)-(38,20)
EMPTY
EmptyG

(39,14)-(39,15)
EMPTY
EmptyG

(39,17)-(39,28)
EMPTY
EmptyG

(39,18)-(39,22)
EMPTY
EmptyG

(39,26)-(39,27)
EMPTY
EmptyG

(40,13)-(40,48)
EMPTY
EmptyG

(40,14)-(40,25)
EMPTY
EmptyG

(40,15)-(40,19)
EMPTY
EmptyG

(40,22)-(40,24)
EMPTY
EmptyG

(40,27)-(40,47)
EMPTY
EmptyG

(40,28)-(40,41)
EMPTY
EmptyG

(40,29)-(40,33)
10 * o
BopG LitG VarG

(40,45)-(40,46)
bigAdd (mulByDigit o l1) l
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(41,14)-(41,15)
1
LitG

(43,4)-(44,60)
EMPTY
EmptyG

(43,17)-(43,29)
EMPTY
EmptyG

(43,24)-(43,25)
EMPTY
EmptyG

(43,24)-(43,29)
EMPTY
EmptyG

(43,28)-(43,29)
EMPTY
EmptyG

(44,4)-(44,54)
EMPTY
EmptyG

(44,4)-(44,60)
EMPTY
EmptyG

(44,5)-(44,13)
EMPTY
EmptyG

(44,14)-(44,21)
EMPTY
EmptyG

(44,22)-(44,53)
EMPTY
EmptyG

(44,23)-(44,31)
EMPTY
EmptyG

(44,32)-(44,52)
EMPTY
EmptyG

(44,33)-(44,45)
EMPTY
EmptyG

(44,46)-(44,48)
EMPTY
EmptyG

(44,55)-(44,56)
EMPTY
EmptyG

(44,57)-(44,60)
EMPTY
EmptyG

(44,58)-(44,59)
EMPTY
EmptyG

*)

(* typed spans
int
int list
int
*)
