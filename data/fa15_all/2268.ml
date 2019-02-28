
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
  if i = 0 then [0] else bigAdd (l mulByDigit ((i - 1) l));;


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
  if i >= 0 then List.rev (mulByDigit (i - 1) l) else bigAdd l l;;

*)

(* changed spans
(31,5)-(31,10)
i >= 0
BopG VarG LitG

(31,25)-(31,31)
List.rev
VarG

(31,46)-(31,57)
i - 1
BopG VarG LitG

(31,46)-(31,57)
i
VarG

(31,46)-(31,57)
1
LitG

(31,46)-(31,57)
l
VarG

(31,46)-(31,57)
bigAdd l l
AppG (fromList [VarG])

*)

(* changed exprs
Bop (Just (31,5)-(31,11)) Ge (Var (Just (31,5)-(31,6)) "i") (Lit (Just (31,10)-(31,11)) (LI 0))
Var (Just (31,17)-(31,25)) "List.rev"
Bop (Just (31,38)-(31,45)) Minus (Var (Just (31,39)-(31,40)) "i") (Lit (Just (31,43)-(31,44)) (LI 1))
Var (Just (31,39)-(31,40)) "i"
Lit (Just (31,43)-(31,44)) (LI 1)
Var (Just (31,46)-(31,47)) "l"
App (Just (31,54)-(31,64)) (Var (Just (31,54)-(31,60)) "bigAdd") [Var (Just (31,61)-(31,62)) "l",Var (Just (31,63)-(31,64)) "l"]
*)

(* typed spans
(31,5)-(31,11)
(31,17)-(31,25)
(31,38)-(31,45)
(31,39)-(31,40)
(31,43)-(31,44)
(31,46)-(31,47)
(31,54)-(31,64)
*)

(* correct types
bool
int list -> int list
int
int
int
int list
int list
*)

(* bad types
bool
int list -> int list -> int list
'a
'a
'a
'a
'a
*)
