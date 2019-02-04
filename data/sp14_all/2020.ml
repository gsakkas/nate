
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

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
    | h::t -> [(mulByDigit x l2) + (h / 10); h mod 10] @ t in
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
(2,19)-(3,57)
fun l1 ->
  fun l2 ->
    match List.length l1 = List.length l2 with
    | true -> (l1 , l2)
    | false -> (let lendiff =
                  List.length l1 - List.length l2 in
                match lendiff > 0 with
                | true -> (l1 , clone 0
                                      lendiff @ l2)
                | false -> (clone 0
                                  (- lendiff) @ l1 , l2))
LamG (LamG EmptyG)

(5,19)-(11,73)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun (x , y) ->
                match a with
                | [] -> (x + y) :: a
                | h :: t -> [(x + y) + (h / 10) ; h mod 10] @ t in
          let base = [] in
          let args =
            List.rev ((0 , 0) :: (List.combine l1
                                               l2)) in
          let res =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(15,4)-(17,58)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(16,12)-(16,34)
EMPTY
EmptyG

(16,33)-(16,34)
EMPTY
EmptyG

(17,14)-(17,54)
EMPTY
EmptyG

(17,15)-(17,32)
a
VarG

(17,15)-(17,43)
bigAdd
VarG

(17,35)-(17,43)
EMPTY
EmptyG

(17,36)-(17,37)
EMPTY
EmptyG

(17,40)-(17,42)
EMPTY
EmptyG

(17,45)-(17,46)
EMPTY
EmptyG

(17,45)-(17,53)
EMPTY
EmptyG

(17,51)-(17,53)
EMPTY
EmptyG

(17,55)-(17,56)
EMPTY
EmptyG

(17,57)-(17,58)
EMPTY
EmptyG

(19,28)-(19,75)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
