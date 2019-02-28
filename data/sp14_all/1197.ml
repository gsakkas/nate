
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in args in
  add (padZero l1 l2);;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,11)-(35,21)
fun l ->
  match l with
  | [] -> []
  | h :: t -> if h = 0
              then removeZero t
              else l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(33,6)-(33,34)
pair (List.rev l1)
     (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(34,48)-(34,52)
res
VarG

(35,2)-(35,5)
removeZero
VarG

(35,2)-(35,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (17,19)-(18,69)) (VarPat (Just (17,19)-(17,20)) "l") (Case (Just (18,2)-(18,69)) (Var (Just (18,8)-(18,9)) "l") [(ConPat (Just (18,17)-(18,19)) "[]" Nothing,Nothing,List (Just (18,23)-(18,25)) [] Nothing),(ConsPat (Just (18,28)-(18,32)) (VarPat (Just (18,28)-(18,29)) "h") (VarPat (Just (18,31)-(18,32)) "t"),Nothing,Ite (Just (18,36)-(18,69)) (Bop (Just (18,39)-(18,44)) Eq (Var (Just (18,39)-(18,40)) "h") (Lit (Just (18,43)-(18,44)) (LI 0))) (App (Just (18,50)-(18,62)) (Var (Just (18,50)-(18,60)) "removeZero") [Var (Just (18,61)-(18,62)) "t"]) (Var (Just (18,68)-(18,69)) "l"))]) Nothing
App (Just (36,6)-(36,38)) (Var (Just (36,6)-(36,10)) "pair") [App (Just (36,11)-(36,24)) (Var (Just (36,12)-(36,20)) "List.rev") [Var (Just (36,21)-(36,23)) "l1"],App (Just (36,25)-(36,38)) (Var (Just (36,26)-(36,34)) "List.rev") [Var (Just (36,35)-(36,37)) "l2"]]
Var (Just (37,48)-(37,51)) "res"
Var (Just (38,2)-(38,12)) "removeZero"
App (Just (38,13)-(38,34)) (Var (Just (38,14)-(38,17)) "add") [App (Just (38,18)-(38,33)) (Var (Just (38,19)-(38,26)) "padZero") [Var (Just (38,27)-(38,29)) "l1",Var (Just (38,30)-(38,32)) "l2"]]
*)

(* typed spans
(17,19)-(18,69)
(36,6)-(36,38)
(37,48)-(37,51)
(38,2)-(38,12)
(38,13)-(38,34)
*)

(* correct types
int list -> int list
(int * int) list
int list
int list -> int list
int list
*)

(* bad types
int list -> int list -> (int * int) list
(int * int) list
(int * int) list
(int list * int list) -> (int * int) list
(int list * int list) -> (int * int) list
*)
