
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (carry,rest) = a in
      let total = (n1 + n2) + carry in
      ((total / 10), ((total mod 10) :: rest)) in
    let base = (0, []) in
    let args = List.rev (List.combine ((0 :: l1), (0 :: l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (carry,rest) = a in
      let total = (n1 + n2) + carry in
      ((total / 10), ((total mod 10) :: rest)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(27,24)-(27,61)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

*)

(* changed exprs
App (Just (27,24)-(27,58)) (Var (Just (27,25)-(27,37)) "List.combine") [ConApp (Just (27,38)-(27,47)) "::" (Just (Tuple (Just (27,39)-(27,46)) [Lit (Just (27,39)-(27,40)) (LI 0),Var (Just (27,44)-(27,46)) "l1"])) Nothing,ConApp (Just (27,48)-(27,57)) "::" (Just (Tuple (Just (27,49)-(27,56)) [Lit (Just (27,49)-(27,50)) (LI 0),Var (Just (27,54)-(27,56)) "l2"])) Nothing]
*)

(* typed spans
(27,24)-(27,58)
*)

(* correct types
(int * int) list
*)

(* bad types
(int * int) list
*)
