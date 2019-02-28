
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1), (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,23)-(16,51)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG)])

(29,15)-(29,58)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Case (Just (17,2)-(17,69)) (Var (Just (17,8)-(17,9)) "l") [(ConPat (Just (17,17)-(17,19)) "[]" Nothing,Nothing,List (Just (17,23)-(17,25)) [] Nothing),(ConsPat (Just (17,28)-(17,32)) (VarPat (Just (17,28)-(17,29)) "h") (VarPat (Just (17,31)-(17,32)) "t"),Nothing,Ite (Just (17,36)-(17,69)) (Bop (Just (17,39)-(17,44)) Eq (Var (Just (17,39)-(17,40)) "h") (Lit (Just (17,43)-(17,44)) (LI 0))) (App (Just (17,50)-(17,62)) (Var (Just (17,50)-(17,60)) "removeZero") [Var (Just (17,61)-(17,62)) "t"]) (Var (Just (17,68)-(17,69)) "l"))]
App (Just (30,15)-(30,55)) (Var (Just (30,15)-(30,27)) "List.combine") [App (Just (30,28)-(30,41)) (Var (Just (30,29)-(30,37)) "List.rev") [Var (Just (30,38)-(30,40)) "l1"],App (Just (30,42)-(30,55)) (Var (Just (30,43)-(30,51)) "List.rev") [Var (Just (30,52)-(30,54)) "l2"]]
*)

(* typed spans
(17,2)-(17,69)
(30,15)-(30,55)
*)

(* correct types
int list
(int * int) list
*)

(* bad types
'a
(int * int) list
*)
