
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
  if i >= 0 then bigAdd l l else mulByDigit (i - (1 l));;


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
(31,33)-(31,55)
List.rev
VarG

(31,33)-(31,55)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(31,49)-(31,54)
1
LitG

(31,49)-(31,54)
l
VarG

(31,49)-(31,54)
bigAdd l l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (31,17)-(31,25)) "List.rev"
App (Just (31,26)-(31,48)) (Var (Just (31,27)-(31,37)) "mulByDigit") [Bop (Just (31,38)-(31,45)) Minus (Var (Just (31,39)-(31,40)) "i") (Lit (Just (31,43)-(31,44)) (LI 1)),Var (Just (31,46)-(31,47)) "l"]
Lit (Just (31,43)-(31,44)) (LI 1)
Var (Just (31,46)-(31,47)) "l"
App (Just (31,54)-(31,64)) (Var (Just (31,54)-(31,60)) "bigAdd") [Var (Just (31,61)-(31,62)) "l",Var (Just (31,63)-(31,64)) "l"]
*)

(* typed spans
(31,17)-(31,25)
(31,26)-(31,48)
(31,43)-(31,44)
(31,46)-(31,47)
(31,54)-(31,64)
*)

(* correct types
int list -> int list
int list
int
int list
int list
*)

(* bad types
int list
int list
int
int
int
*)
