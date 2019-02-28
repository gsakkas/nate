
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
          ((List.rev List.tl (List.rev (h1 :: t1))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev List.tl (List.rev (h1 :: t1))), ((((h1 + x) + rh) / 10)
            :: (((h1 + x) + rh) mod 10) :: rt)) in
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
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,11)-(26,51)
List.rev (List.tl (List.rev (h1 :: t1)))
AppG (fromList [AppG (fromList [EmptyG])])

(29,11)-(29,51)
List.rev (List.tl (List.rev (h1 :: t1)))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (26,11)-(26,53)) (Var (Just (26,12)-(26,20)) "List.rev") [App (Just (26,21)-(26,52)) (Var (Just (26,22)-(26,29)) "List.tl") [App (Just (26,30)-(26,51)) (Var (Just (26,31)-(26,39)) "List.rev") [ConApp (Just (26,40)-(26,50)) "::" (Just (Tuple (Just (26,41)-(26,49)) [Var (Just (26,41)-(26,43)) "h1",Var (Just (26,47)-(26,49)) "t1"])) Nothing]]]
App (Just (29,11)-(29,53)) (Var (Just (29,12)-(29,20)) "List.rev") [App (Just (29,21)-(29,52)) (Var (Just (29,22)-(29,29)) "List.tl") [App (Just (29,30)-(29,51)) (Var (Just (29,31)-(29,39)) "List.rev") [ConApp (Just (29,40)-(29,50)) "::" (Just (Tuple (Just (29,41)-(29,49)) [Var (Just (29,41)-(29,43)) "h1",Var (Just (29,47)-(29,49)) "t1"])) Nothing]]]
*)

(* typed spans
(26,11)-(26,53)
(29,11)-(29,53)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list
*)
