
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
        let sum = mulByDigit (int_of_string (sepConcat "" l1)) s in
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
(29,20)-(30,56)
(29,22)-(30,56)
(30,3)-(30,56)
(30,6)-(30,7)
(30,6)-(30,11)
(30,10)-(30,11)
(30,17)-(30,23)
(30,17)-(30,47)
(30,24)-(30,25)
(30,27)-(30,37)
(30,27)-(30,47)
(30,39)-(30,40)
(30,39)-(30,44)
(30,43)-(30,44)
(30,46)-(30,47)
(30,54)-(30,56)
(36,7)-(37,59)
(37,7)-(37,59)
(37,23)-(37,59)
(39,12)-(50,50)
(40,3)-(50,50)
(41,5)-(47,42)
(44,9)-(47,42)
(44,19)-(44,65)
(44,31)-(44,44)
(44,46)-(44,55)
(44,46)-(44,61)
(44,56)-(44,58)
(44,64)-(44,65)
(48,3)-(50,50)
(49,3)-(50,50)
(49,14)-(49,22)
(49,14)-(49,42)
(50,3)-(50,50)
(50,17)-(50,31)
(50,17)-(50,43)
(50,32)-(50,33)
(50,34)-(50,38)
(50,39)-(50,43)
(50,47)-(50,50)
*)

(* type error slice
(4,4)-(10,20)
(4,13)-(10,17)
(4,16)-(10,17)
(9,46)-(9,57)
(9,46)-(9,60)
(9,58)-(9,60)
(15,4)-(27,37)
(15,12)-(27,33)
(15,15)-(27,33)
(27,20)-(27,27)
(27,20)-(27,33)
(27,31)-(27,33)
(30,17)-(30,23)
(30,17)-(30,47)
(30,27)-(30,37)
(30,27)-(30,47)
(44,9)-(47,42)
(44,19)-(44,29)
(44,19)-(44,65)
(45,13)-(45,16)
(45,13)-(45,20)
(46,17)-(46,20)
(46,17)-(46,24)
(46,36)-(46,39)
(46,36)-(46,43)
(47,21)-(47,24)
(47,21)-(47,28)
*)
