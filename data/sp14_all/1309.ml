
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
      | (h1,h2) -> (removeZero (((h1 + h2) / 10) :: ((h1 + h2) mod 10))) :: a
      | _ -> a in
    let base = [] in
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
(17,19)-(17,72)
(h1 + h2) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,19)-(17,72)
((h1 + h2) mod 10) :: a
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG])))

*)

(* changed exprs
Bop (Just (17,19)-(17,35)) Div (Bop (Just (17,20)-(17,29)) Plus (Var (Just (17,21)-(17,23)) "h1") (Var (Just (17,26)-(17,28)) "h2")) (Lit (Just (17,32)-(17,34)) (LI 10))
ConApp (Just (17,39)-(17,62)) "::" (Just (Tuple (Just (17,39)-(17,62)) [Bop (Just (17,39)-(17,57)) Mod (Bop (Just (17,40)-(17,49)) Plus (Var (Just (17,41)-(17,43)) "h1") (Var (Just (17,46)-(17,48)) "h2")) (Lit (Just (17,54)-(17,56)) (LI 10)),Var (Just (17,61)-(17,62)) "a"])) Nothing
*)

(* typed spans
(17,19)-(17,35)
(17,39)-(17,62)
*)

(* correct types
int
int list
*)

(* bad types
int list
int list
*)
