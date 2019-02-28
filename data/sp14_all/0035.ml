
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
      match a with
      | (h1::t1,rh::rt) ->
          (match x with | h2::t2 -> (t1, (((h1 + rh) mod 10) :: rt))) in
    let base = (l1, [0]) in
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
    let f a x =
      match a with
      | (h1::t1,rh::rt) -> (t1, ((((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, [0]) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,10)-(26,69)
(t1 , (((h1 + x) + rh) mod 10) :: rt)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG])))])

*)

(* changed exprs
Tuple (Just (25,27)-(25,65)) [Var (Just (25,28)-(25,30)) "t1",ConApp (Just (25,32)-(25,64)) "::" (Just (Tuple (Just (25,33)-(25,63)) [Bop (Just (25,33)-(25,57)) Mod (Bop (Just (25,34)-(25,49)) Plus (Bop (Just (25,35)-(25,43)) Plus (Var (Just (25,36)-(25,38)) "h1") (Var (Just (25,41)-(25,42)) "x")) (Var (Just (25,46)-(25,48)) "rh")) (Lit (Just (25,54)-(25,56)) (LI 10)),Var (Just (25,61)-(25,63)) "rt"])) Nothing]
*)

(* typed spans
(25,27)-(25,65)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
