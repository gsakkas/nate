
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = "" in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (cin,res) = a
      and (d1,d2) = x in
      ((((cin + d1) + d2) mod 10), (((cin + d1) + d2) :: res)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,18)
let (cin , res) = a
and (d1 , d2) = x in
(((cin + d1) + d2) mod 10 , ((cin + d1) + d2) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (17,6)-(19,62)) NonRec [(TuplePat (Just (17,11)-(17,18)) [VarPat (Just (17,11)-(17,14)) "cin",VarPat (Just (17,15)-(17,18)) "res"],Var (Just (17,22)-(17,23)) "a"),(TuplePat (Just (18,11)-(18,16)) [VarPat (Just (18,11)-(18,13)) "d1",VarPat (Just (18,14)-(18,16)) "d2"],Var (Just (18,20)-(18,21)) "x")] (Tuple (Just (19,6)-(19,62)) [Bop (Just (19,7)-(19,33)) Mod (Bop (Just (19,8)-(19,25)) Plus (Bop (Just (19,9)-(19,19)) Plus (Var (Just (19,10)-(19,13)) "cin") (Var (Just (19,16)-(19,18)) "d1")) (Var (Just (19,22)-(19,24)) "d2")) (Lit (Just (19,30)-(19,32)) (LI 10)),ConApp (Just (19,35)-(19,61)) "::" (Just (Tuple (Just (19,36)-(19,60)) [Bop (Just (19,36)-(19,53)) Plus (Bop (Just (19,37)-(19,47)) Plus (Var (Just (19,38)-(19,41)) "cin") (Var (Just (19,44)-(19,46)) "d1")) (Var (Just (19,50)-(19,52)) "d2"),Var (Just (19,57)-(19,60)) "res"])) Nothing])
*)

(* typed spans
(17,6)-(19,62)
*)

(* correct types
(int * int list)
*)

(* bad types
string
*)
