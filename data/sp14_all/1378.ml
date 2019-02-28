
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               if
                 ((List.length rest) = (List.length l1)) or
                   ((List.length rest) = (List.length l2))
               then carry :: rest
               else
                 ((((add1 + add2) + carry) / 10),
                   ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               if
                 ((List.length rest) = (List.length l1)) or
                   ((List.length rest) = (List.length l2))
               then (0, (carry :: rest))
               else
                 ((((add1 + add2) + carry) / 10),
                   ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,20)-(23,33)
(0 , carry :: rest)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
Tuple (Just (23,20)-(23,40)) [Lit (Just (23,21)-(23,22)) (LI 0),ConApp (Just (23,24)-(23,39)) "::" (Just (Tuple (Just (23,25)-(23,38)) [Var (Just (23,25)-(23,30)) "carry",Var (Just (23,34)-(23,38)) "rest"])) Nothing]
*)

(* typed spans
(23,20)-(23,40)
*)

(* correct types
(int * int list)
*)

(* bad types
int list
*)
