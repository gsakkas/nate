
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
      | (h1::t1,[]) ->
          if (h1 + x) > 9
          then (t1, [(h1 + x) / 10; (h1 + x) mod 10])
          else [(h1 + x) mod 10]
      | (h1::t1,rh::rt) ->
          if ((h1 + x) + rh) > 9
          then
            (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
          else (((h1 + x) + rh) mod 10) :: rt in
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
    let f a x =
      match a with
      | (h1::t1,[]) ->
          if (h1 + x) > 9
          then (t1, [(h1 + x) / 10; (h1 + x) mod 10])
          else (t1, [(h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          if ((h1 + x) + rh) > 9
          then
            (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
          else (t1, ((((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,15)-(28,32)
(t1 , [(h1 + x) mod 10])
TupleG (fromList [VarG,ListG EmptyG])

(33,15)-(33,45)
(t1 , (((h1 + x) + rh) mod 10) :: rt)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG])))])

*)

(* changed exprs
Tuple (Just (28,15)-(28,38)) [Var (Just (28,16)-(28,18)) "t1",List (Just (28,20)-(28,37)) [Bop (Just (28,21)-(28,36)) Mod (Bop (Just (28,21)-(28,29)) Plus (Var (Just (28,22)-(28,24)) "h1") (Var (Just (28,27)-(28,28)) "x")) (Lit (Just (28,34)-(28,36)) (LI 10))] Nothing]
Tuple (Just (33,15)-(33,53)) [Var (Just (33,16)-(33,18)) "t1",ConApp (Just (33,20)-(33,52)) "::" (Just (Tuple (Just (33,21)-(33,51)) [Bop (Just (33,21)-(33,45)) Mod (Bop (Just (33,22)-(33,37)) Plus (Bop (Just (33,23)-(33,31)) Plus (Var (Just (33,24)-(33,26)) "h1") (Var (Just (33,29)-(33,30)) "x")) (Var (Just (33,34)-(33,36)) "rh")) (Lit (Just (33,42)-(33,44)) (LI 10)),Var (Just (33,49)-(33,51)) "rt"])) Nothing]
*)

(* typed spans
(28,15)-(28,38)
(33,15)-(33,53)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
int list
int list
*)
