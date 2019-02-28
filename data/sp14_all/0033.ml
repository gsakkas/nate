
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with | [] -> (l1, [0; 0; 0; 0]) | h1::t1 -> (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (h1::t1,_) -> (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,6)-(24,76)
match a with
| (h1 :: t1 , _) -> (l1 , [0 ; 0 ; 0 ; 0])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (23,16)-(23,63)) (Var (Just (23,22)-(23,23)) "a") [(TuplePat (Just (23,32)-(23,40)) [ConsPat (Just (23,32)-(23,38)) (VarPat (Just (23,32)-(23,34)) "h1") (VarPat (Just (23,36)-(23,38)) "t1"),WildPat (Just (23,39)-(23,40))],Nothing,Tuple (Just (23,45)-(23,63)) [Var (Just (23,46)-(23,48)) "l1",List (Just (23,50)-(23,62)) [Lit (Just (23,51)-(23,52)) (LI 0),Lit (Just (23,54)-(23,55)) (LI 0),Lit (Just (23,57)-(23,58)) (LI 0),Lit (Just (23,60)-(23,61)) (LI 0)] Nothing])]
*)

(* typed spans
(23,16)-(23,63)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
