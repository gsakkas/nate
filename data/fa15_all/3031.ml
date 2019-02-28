
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ([((num1 + num2) + carry) mod 10] ::
        sum)) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,40)-(16,72)
((num1 + num2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(18,19)-(18,20)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (16,40)-(16,72)) Mod (Bop (Just (16,41)-(16,64)) Plus (Bop (Just (16,42)-(16,55)) Plus (Var (Just (16,43)-(16,47)) "num1") (Var (Just (16,50)-(16,54)) "num2")) (Var (Just (16,58)-(16,63)) "carry")) (Lit (Just (16,69)-(16,71)) (LI 10))
List (Just (18,19)-(18,21)) [] Nothing
*)

(* typed spans
(16,40)-(16,72)
(18,19)-(18,21)
*)

(* correct types
int
int list
*)

(* bad types
int list
int
*)
