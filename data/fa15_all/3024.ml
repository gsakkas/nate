
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (num1,num2) = x in ((a * 10) + num1) + num2 in
    let base = 0 in
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
(13,39)-(13,63)
let (carry , sum) = a in
(((num1 + num2) + carry) / 10 , (((num1 + num2) + carry) mod 10) :: sum)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(13,40)-(13,48)
num1
VarG

(13,45)-(13,47)
carry
VarG

(13,51)-(13,55)
((num1 + num2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(14,4)-(16,51)
sum
VarG

(14,15)-(14,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG])

(15,4)-(16,51)
[]
ListG EmptyG

*)

(* typed spans
(15,6)-(17,13)
(16,10)-(16,14)
(16,25)-(16,30)
(16,40)-(16,72)
(17,8)-(17,11)
(18,15)-(18,22)
(18,19)-(18,21)
*)

(* typed spans
(int * int list)
int
int
int
int list
(int * int list)
int list
*)

(* typed spans
int
int
int
int
int list
int
int list
*)
