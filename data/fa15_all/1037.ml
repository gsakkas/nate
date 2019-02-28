
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let rec multHelper l3 l4 x =
  match l3 with
  | [] -> [0]
  | h::t -> bigAdd (mulByDigit h l4) (multHelper t l4 (x + 1));;

let bigMul l1 l2 =
  let f a x = multHelper (List.rev l1) l2 0 in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let r = bigAdd (mulByDigit x (List.rev l2)) [b] in
    match r with | [] -> (0, (0 :: c)) | h::t -> (h, ((List.hd t) :: c)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(28,62)-(28,63)
fun l2 ->
  (let f =
     fun a ->
       fun x ->
         (let (b , c) = a in
          let r =
            bigAdd (mulByDigit x
                               (List.rev l2)) [b] in
          match r with
          | [] -> (0 , 0 :: c)
          | h :: t -> (h , (List.hd t) :: c)) in
   let base = (0 , []) in
   let args = List.rev l1 in
   let (_ , res) =
     List.fold_left f base args in
   res)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(30,19)-(33,62)
EMPTY
EmptyG

(30,22)-(33,62)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (b , c) = a in
            let r =
              bigAdd (mulByDigit x
                                 (List.rev l2)) [b] in
            match r with
            | [] -> (0 , 0 :: c)
            | h :: t -> (h , (List.hd t) :: c)) in
     let base = (0 , []) in
     let args = List.rev l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

(31,2)-(33,62)
EMPTY
EmptyG

(31,8)-(31,10)
let r =
  bigAdd (mulByDigit x
                     (List.rev l2)) [b] in
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(32,10)-(32,13)
EMPTY
EmptyG

(32,11)-(32,12)
let (b , c) = a in
let r =
  bigAdd (mulByDigit x
                     (List.rev l2)) [b] in
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(33,31)-(33,32)
EMPTY
EmptyG

(33,33)-(33,35)
EMPTY
EmptyG

(33,37)-(33,62)
EMPTY
EmptyG

(33,38)-(33,48)
EMPTY
EmptyG

(33,49)-(33,50)
EMPTY
EmptyG

(33,51)-(33,53)
EMPTY
EmptyG

(33,54)-(33,61)
EMPTY
EmptyG

(33,59)-(33,60)
EMPTY
EmptyG

(35,11)-(38,75)
EMPTY
EmptyG

(35,14)-(38,75)
EMPTY
EmptyG

(36,2)-(38,75)
EMPTY
EmptyG

(36,8)-(36,43)
EMPTY
EmptyG

(36,10)-(36,43)
EMPTY
EmptyG

(36,14)-(36,24)
EMPTY
EmptyG

(36,14)-(36,43)
EMPTY
EmptyG

(36,26)-(36,34)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(36,35)-(36,37)
List.hd t
AppG (fromList [VarG])

(38,22)-(38,24)
l1
VarG

*)

(* typed spans
int list -> int list
int list -> int list -> int list
(int * int list)
(int * int list)
(int * int list)
int
int list
*)
