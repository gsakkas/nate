
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1::t1,h2::t2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [0] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(18,14)
match x with
| (h1 , h2) -> ((h1 + h2) / 10) :: (((h1 + h2) mod 10) :: a)
| _ -> a
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG])))]))))])

(19,15)-(19,18)
[]
ListG EmptyG

*)

(* changed exprs
Case (Just (16,6)-(18,14)) (Var (Just (16,12)-(16,13)) "x") [(TuplePat (Just (17,9)-(17,14)) [VarPat (Just (17,9)-(17,11)) "h1",VarPat (Just (17,12)-(17,14)) "h2"],Nothing,ConApp (Just (17,19)-(17,62)) "::" (Just (Tuple (Just (17,19)-(17,62)) [Bop (Just (17,19)-(17,35)) Div (Bop (Just (17,20)-(17,29)) Plus (Var (Just (17,21)-(17,23)) "h1") (Var (Just (17,26)-(17,28)) "h2")) (Lit (Just (17,32)-(17,34)) (LI 10)),ConApp (Just (17,39)-(17,62)) "::" (Just (Tuple (Just (17,39)-(17,62)) [Bop (Just (17,39)-(17,57)) Mod (Bop (Just (17,40)-(17,49)) Plus (Var (Just (17,41)-(17,43)) "h1") (Var (Just (17,46)-(17,48)) "h2")) (Lit (Just (17,54)-(17,56)) (LI 10)),Var (Just (17,61)-(17,62)) "a"])) Nothing])) Nothing),(WildPat (Just (18,8)-(18,9)),Nothing,Var (Just (18,13)-(18,14)) "a")]
List (Just (19,15)-(19,17)) [] Nothing
*)

(* typed spans
(16,6)-(18,14)
(19,15)-(19,17)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
