
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with
           | ([],[]) -> a
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,10)-(19,63)
match x with
| (h1 , h2) -> ([(h1 + h2) / 10] , [(h1 + h2) mod 10])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (17,10)-(17,76)) (Var (Just (17,17)-(17,18)) "x") [(TuplePat (Just (17,27)-(17,32)) [VarPat (Just (17,27)-(17,29)) "h1",VarPat (Just (17,30)-(17,32)) "h2"],Nothing,Tuple (Just (17,37)-(17,75)) [List (Just (17,38)-(17,54)) [Bop (Just (17,39)-(17,53)) Div (Bop (Just (17,39)-(17,48)) Plus (Var (Just (17,40)-(17,42)) "h1") (Var (Just (17,45)-(17,47)) "h2")) (Lit (Just (17,51)-(17,53)) (LI 10))] Nothing,List (Just (17,56)-(17,74)) [Bop (Just (17,57)-(17,73)) Mod (Bop (Just (17,57)-(17,66)) Plus (Var (Just (17,58)-(17,60)) "h1") (Var (Just (17,63)-(17,65)) "h2")) (Lit (Just (17,71)-(17,73)) (LI 10))] Nothing])]
*)

(* typed spans
(17,10)-(17,76)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
