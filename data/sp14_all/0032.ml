
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
    let f a x = match a with | [] -> ([], []) | h1::t1 -> (l1, [0; 0; 0; 0]) in
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
    let f a x = (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,76)
(l1 , [0 ; 0 ; 0 ; 0])
TupleG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
Tuple (Just (23,16)-(23,34)) [Var (Just (23,17)-(23,19)) "l1",List (Just (23,21)-(23,33)) [Lit (Just (23,22)-(23,23)) (LI 0),Lit (Just (23,25)-(23,26)) (LI 0),Lit (Just (23,28)-(23,29)) (LI 0),Lit (Just (23,31)-(23,32)) (LI 0)] Nothing]
*)

(* typed spans
(23,16)-(23,34)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
