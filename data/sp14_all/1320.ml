
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = bigAdd (bigAdd (l l)) (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd (bigAdd l l) (mulByDigit (i - 1) l);;

*)

(* changed spans
(28,26)-(28,70)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
CaseG VarG [(LitPatG,Nothing,ListG []),(WildPatG,Nothing,AppG [EmptyG,EmptyG])]

*)

(* type error slice
(4,4)-(8,60)
(4,17)-(8,58)
(8,9)-(8,53)
(8,10)-(8,21)
(8,50)-(8,52)
(13,4)-(26,37)
(13,12)-(26,35)
(26,19)-(26,34)
(26,20)-(26,27)
(26,28)-(26,30)
(28,26)-(28,32)
(28,26)-(28,70)
(28,33)-(28,47)
(28,34)-(28,40)
(28,41)-(28,46)
(28,42)-(28,43)
(28,44)-(28,45)
*)
