
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x = (a, ((mulByDigit x l1) @ (clone 0 (List.length a)))) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    let y = i * x in
    match a with
    | h::t -> ((h + y) / 10) :: ((h + y) mod 10) :: t
    | _ -> [y / 10; y mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in (a1, ((mulByDigit x l1) @ (clone 0 (List.length a1)))) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(16,14)-(16,66)
let (a1 , a2) = a in
(a1 , mulByDigit x
                 l1 @ clone 0 (List.length a1))
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (17,4)-(17,77)) NonRec [(TuplePat (Just (17,9)-(17,14)) [VarPat (Just (17,9)-(17,11)) "a1",VarPat (Just (17,12)-(17,14)) "a2"],Var (Just (17,18)-(17,19)) "a")] (Tuple (Just (17,23)-(17,77)) [Var (Just (17,24)-(17,26)) "a1",App (Just (17,28)-(17,76)) (Var (Just (17,47)-(17,48)) "@") [App (Just (17,29)-(17,46)) (Var (Just (17,30)-(17,40)) "mulByDigit") [Var (Just (17,41)-(17,42)) "x",Var (Just (17,43)-(17,45)) "l1"],App (Just (17,49)-(17,75)) (Var (Just (17,50)-(17,55)) "clone") [Lit (Just (17,56)-(17,57)) (LI 0),App (Just (17,58)-(17,74)) (Var (Just (17,59)-(17,70)) "List.length") [Var (Just (17,71)-(17,73)) "a1"]]]])
*)

(* typed spans
(17,4)-(17,77)
*)

(* correct types
('a list * int list)
*)

(* bad types
('a list * int list)
*)
