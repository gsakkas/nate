
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append (zeroes l2)))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in List.append ((zeroes l1), l2);;


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

*)

(* changed spans
(11,37)-(11,62)
List.append zeroes l2
AppG (fromList [VarG])

(14,32)-(14,61)
(List.append zeroes l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,32)-(14,61)
List.append zeroes l1
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (11,37)-(11,60)) (Var (Just (11,38)-(11,49)) "List.append") [Var (Just (11,50)-(11,56)) "zeroes",Var (Just (11,57)-(11,59)) "l2"]
Tuple (Just (14,32)-(14,61)) [App (Just (14,33)-(14,56)) (Var (Just (14,34)-(14,45)) "List.append") [Var (Just (14,46)-(14,52)) "zeroes",Var (Just (14,53)-(14,55)) "l1"],Var (Just (14,58)-(14,60)) "l2"]
App (Just (14,33)-(14,56)) (Var (Just (14,34)-(14,45)) "List.append") [Var (Just (14,46)-(14,52)) "zeroes",Var (Just (14,53)-(14,55)) "l1"]
*)

(* typed spans
(11,37)-(11,60)
(14,32)-(14,61)
(14,33)-(14,56)
*)

(* correct types
int list
(int list * int list)
int list
*)

(* bad types
'a list -> 'a list
('a list * 'b list -> 'b list)
('a list * 'b list -> 'b list)
*)
