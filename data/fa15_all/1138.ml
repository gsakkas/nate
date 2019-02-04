
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum =
          int_of_string
            (sepConcat " " (mulByDigit (int_of_string (sepConcat "" l1)) s)) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.combine l2 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,19)-(30,55)
EMPTY
EmptyG

(29,21)-(30,55)
EMPTY
EmptyG

(30,2)-(30,55)
EMPTY
EmptyG

(30,5)-(30,6)
EMPTY
EmptyG

(30,5)-(30,10)
EMPTY
EmptyG

(30,9)-(30,10)
EMPTY
EmptyG

(30,16)-(30,22)
EMPTY
EmptyG

(30,16)-(30,47)
EMPTY
EmptyG

(30,23)-(30,24)
EMPTY
EmptyG

(30,25)-(30,47)
EMPTY
EmptyG

(30,26)-(30,36)
EMPTY
EmptyG

(30,37)-(30,44)
EMPTY
EmptyG

(30,38)-(30,39)
EMPTY
EmptyG

(30,42)-(30,43)
EMPTY
EmptyG

(30,45)-(30,46)
EMPTY
EmptyG

(30,53)-(30,55)
EMPTY
EmptyG

(39,11)-(52,49)
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
LamG (LamG EmptyG)

(45,10)-(45,23)
EMPTY
EmptyG

(46,12)-(46,76)
EMPTY
EmptyG

(46,13)-(46,22)
EMPTY
EmptyG

(46,23)-(46,26)
intListToInt
VarG

(46,40)-(46,53)
EMPTY
EmptyG

(46,54)-(46,71)
EMPTY
EmptyG

(46,55)-(46,64)
EMPTY
EmptyG

(46,65)-(46,67)
intListToInt
VarG

(46,73)-(46,74)
[s]
ListG VarG Nothing

(51,13)-(51,21)
EMPTY
EmptyG

(51,13)-(51,42)
EMPTY
EmptyG

*)
