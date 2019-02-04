
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x =
    let (carry,res) = a in
    match x with | [] -> [] | h::t -> (res, (bigAdd (mulByDigit h l1) res)) in
  let base = (0, []) in
  let args = tenEx 0 l2 in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,19)-(2,61)
EMPTY
EmptyG

(2,22)-(2,23)
EMPTY
EmptyG

(2,22)-(2,27)
EMPTY
EmptyG

(2,26)-(2,27)
EMPTY
EmptyG

(2,33)-(2,34)
EMPTY
EmptyG

(2,40)-(2,42)
EMPTY
EmptyG

(2,40)-(2,61)
EMPTY
EmptyG

(2,45)-(2,61)
EMPTY
EmptyG

(2,46)-(2,52)
EMPTY
EmptyG

(2,53)-(2,60)
EMPTY
EmptyG

(2,54)-(2,55)
EMPTY
EmptyG

(2,58)-(2,59)
EMPTY
EmptyG

(4,14)-(4,65)
EMPTY
EmptyG

(28,19)-(34,66)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
LamG (LamG EmptyG)

(36,14)-(37,72)
EMPTY
EmptyG

(36,16)-(37,72)
EMPTY
EmptyG

(37,2)-(37,72)
EMPTY
EmptyG

(37,8)-(37,9)
EMPTY
EmptyG

(37,23)-(37,25)
EMPTY
EmptyG

(37,36)-(37,53)
EMPTY
EmptyG

(37,36)-(37,72)
EMPTY
EmptyG

(37,37)-(37,42)
EMPTY
EmptyG

(37,43)-(37,50)
EMPTY
EmptyG

(37,44)-(37,45)
EMPTY
EmptyG

(37,48)-(37,49)
EMPTY
EmptyG

(37,51)-(37,52)
EMPTY
EmptyG

(37,54)-(37,55)
EMPTY
EmptyG

(37,56)-(37,72)
EMPTY
EmptyG

(37,57)-(37,67)
EMPTY
EmptyG

(37,57)-(37,71)
EMPTY
EmptyG

(37,58)-(37,64)
EMPTY
EmptyG

(37,65)-(37,66)
EMPTY
EmptyG

(37,70)-(37,71)
EMPTY
EmptyG

(41,4)-(42,75)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(42,4)-(42,75)
EMPTY
EmptyG

(42,10)-(42,11)
EMPTY
EmptyG

(42,25)-(42,27)
EMPTY
EmptyG

(42,39)-(42,42)
EMPTY
EmptyG

(42,45)-(42,51)
bigAdd (mulByDigit x1
                   x2 @ carry) res
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(42,53)-(42,63)
mulByDigit x1 x2
AppG (fromList [VarG])

(42,64)-(42,65)
EMPTY
EmptyG

(42,66)-(42,68)
x1
VarG

(42,70)-(42,73)
carry
VarG

(43,14)-(43,15)
EMPTY
EmptyG

(44,2)-(45,63)
[]
ListG EmptyG Nothing

(44,13)-(44,18)
EMPTY
EmptyG

(44,13)-(44,23)
List.rev (helper l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(44,19)-(44,20)
helper
VarG

(44,21)-(44,23)
l1
VarG

(45,2)-(45,63)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(45,50)-(45,57)
EMPTY
EmptyG

(45,50)-(45,63)
EMPTY
EmptyG

(45,51)-(45,56)
EMPTY
EmptyG

(45,58)-(45,59)
EMPTY
EmptyG

*)
