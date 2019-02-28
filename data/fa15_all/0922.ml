
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, (num @ list))
               else if num = 10 then (1, ([0] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

*)

(* changed spans
(23,25)-(23,28)
[num]
ListG VarG

(24,20)-(24,54)
(num / 10 , [num mod 10] @ list)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
List (Just (23,25)-(23,30)) [Var (Just (23,26)-(23,29)) "num"] Nothing
Tuple (Just (27,22)-(27,57)) [Bop (Just (27,23)-(27,33)) Div (Var (Just (27,24)-(27,27)) "num") (Lit (Just (27,30)-(27,32)) (LI 10)),App (Just (27,35)-(27,56)) (Var (Just (27,49)-(27,50)) "@") [List (Just (27,36)-(27,48)) [Bop (Just (27,37)-(27,47)) Mod (Var (Just (27,37)-(27,40)) "num") (Lit (Just (27,45)-(27,47)) (LI 10))] Nothing,Var (Just (27,51)-(27,55)) "list"]]
*)

(* typed spans
(23,25)-(23,30)
(27,22)-(27,57)
*)

(* correct types
int list
(int * int list)
*)

(* bad types
int
unit
*)
