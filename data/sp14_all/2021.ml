
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [(bigAdd (mulByDigit x l2) h) / 10; h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(38,4)-(40,63)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(42,28)-(42,75)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)

(* changed exprs
Case (Just (38,4)-(38,74)) (Var (Just (38,10)-(38,11)) "a") [(ConPat (Just (38,19)-(38,21)) "[]" Nothing,Nothing,App (Just (38,25)-(38,40)) (Var (Just (38,25)-(38,35)) "mulByDigit") [Var (Just (38,36)-(38,37)) "x",Var (Just (38,38)-(38,40)) "l2"]),(WildPat (Just (38,43)-(38,44)),Nothing,App (Just (38,48)-(38,74)) (Var (Just (38,48)-(38,54)) "bigAdd") [Var (Just (38,55)-(38,56)) "a",App (Just (38,57)-(38,74)) (Var (Just (38,58)-(38,68)) "mulByDigit") [Var (Just (38,69)-(38,70)) "x",Var (Just (38,71)-(38,73)) "l2"]])]
Let (Just (40,28)-(40,71)) NonRec [(VarPat (Just (40,32)-(40,35)) "res",App (Just (40,38)-(40,64)) (Var (Just (40,38)-(40,52)) "List.fold_left") [Var (Just (40,53)-(40,54)) "f",Var (Just (40,55)-(40,59)) "base",Var (Just (40,60)-(40,64)) "args"])] (Var (Just (40,68)-(40,71)) "res")
*)

(* typed spans
(38,4)-(38,74)
(40,28)-(40,71)
*)

(* correct types
int list
int list
*)

(* bad types
int list list
'a
*)
