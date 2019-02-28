
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> b @ ((w mod 10) :: ((y + z), (w / 10))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((y + z), (b @ ([w mod 10] @ [w / 10]))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,12)-(17,18)
(y + z , b @ ([w mod 10] @ [w / 10]))
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (18,25)-(18,65)) [Bop (Just (18,26)-(18,33)) Plus (Var (Just (18,27)-(18,28)) "y") (Var (Just (18,31)-(18,32)) "z"),App (Just (18,35)-(18,64)) (Var (Just (18,38)-(18,39)) "@") [Var (Just (18,36)-(18,37)) "b",App (Just (18,40)-(18,63)) (Var (Just (18,52)-(18,53)) "@") [List (Just (18,41)-(18,51)) [Bop (Just (18,42)-(18,50)) Mod (Var (Just (18,42)-(18,43)) "w") (Lit (Just (18,48)-(18,50)) (LI 10))] Nothing,List (Just (18,54)-(18,62)) [Bop (Just (18,55)-(18,61)) Div (Var (Just (18,55)-(18,56)) "w") (Lit (Just (18,59)-(18,61)) (LI 10))] Nothing]]]
*)

(* typed spans
(18,25)-(18,65)
*)

(* correct types
(int * int list)
*)

(* bad types
((int * int list) * (int * int))
*)
