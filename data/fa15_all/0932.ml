
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
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i < 1 then [] else (bigAdd l) + (mulByDigit (i - (1 l)));;


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
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i <= 1 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(37,5)-(37,10)
i <= 1
BopG VarG LitG

(37,24)-(37,61)
l
VarG

(37,25)-(37,31)
bigAdd l (mulByDigit (i - 1)
                     l)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(37,37)-(37,61)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
Bop (Just (37,5)-(37,11)) Le (Var (Just (37,5)-(37,6)) "i") (Lit (Just (37,10)-(37,11)) (LI 1))
Var (Just (37,17)-(37,18)) "l"
App (Just (37,24)-(37,55)) (Var (Just (37,24)-(37,30)) "bigAdd") [Var (Just (37,31)-(37,32)) "l",App (Just (37,33)-(37,55)) (Var (Just (37,34)-(37,44)) "mulByDigit") [Bop (Just (37,45)-(37,52)) Minus (Var (Just (37,46)-(37,47)) "i") (Lit (Just (37,50)-(37,51)) (LI 1)),Var (Just (37,53)-(37,54)) "l"]]
App (Just (37,33)-(37,55)) (Var (Just (37,34)-(37,44)) "mulByDigit") [Bop (Just (37,45)-(37,52)) Minus (Var (Just (37,46)-(37,47)) "i") (Lit (Just (37,50)-(37,51)) (LI 1)),Var (Just (37,53)-(37,54)) "l"]
*)

(* typed spans
(37,5)-(37,11)
(37,17)-(37,18)
(37,24)-(37,55)
(37,33)-(37,55)
*)

(* correct types
bool
int list
int list
int list
*)

(* bad types
bool
int
int list -> int list -> int list
int
*)
