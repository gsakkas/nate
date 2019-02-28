
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
  let add (l1,l2) = let (_,res) = 0; [0; 0; 0; 0] in res in
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
  let add (l1,l2) = let (_,res) = (0, [0; 0; 0; 0]) in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,34)-(22,49)
(0 , [0 ; 0 ; 0 ; 0])
TupleG (fromList [LitG,ListG EmptyG])

*)

(* changed exprs
Tuple (Just (22,34)-(22,51)) [Lit (Just (22,35)-(22,36)) (LI 0),List (Just (22,38)-(22,50)) [Lit (Just (22,39)-(22,40)) (LI 0),Lit (Just (22,42)-(22,43)) (LI 0),Lit (Just (22,45)-(22,46)) (LI 0),Lit (Just (22,48)-(22,49)) (LI 0)] Nothing]
*)

(* typed spans
(22,34)-(22,51)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
