
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | [] ->
          if (arg1 + arg2) > 9
          then [1] @ ([(arg1 + arg2) mod 10] @ a)
          else (arg1 + arg2) :: a
      | h::t ->
          if ((arg1 + arg2) + h) > 9
          then [1] @ ([((arg1 + arg2) + h) mod 10] @ a)
          else ((arg1 + arg2) + h) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | [] ->
          if (arg1 + arg2) > 9
          then [1] @ ([(arg1 + arg2) mod 10] @ a)
          else (arg1 + arg2) :: a
      | h::t ->
          if ((arg1 + arg2) + h) > 9
          then [1] @ ([((arg1 + arg2) + h) mod 10] @ a)
          else ((arg1 + arg2) + h) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,5)-(30,52)
let res =
  List.fold_left f base args in
res
LetG NonRec [(VarPatG,AppG [EmptyG,EmptyG,EmptyG])] VarG

*)

(* type error slice
(17,5)-(30,52)
(17,11)-(27,40)
(22,22)-(22,50)
(22,46)-(22,47)
(22,48)-(22,49)
(30,5)-(30,52)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
*)
