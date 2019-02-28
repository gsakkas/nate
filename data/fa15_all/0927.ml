
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args =
    ((padZero l1 l2),
      (if (List.length l1) >= (List.length l2) then l1 else l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

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
  removeZero (add (padZero l1 l2));;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (aNum,wholeNum) ->
        (match a with
         | (zeros,total) ->
             ((zeros @ [0]),
               (bigAdd total ((mulByDigit aNum wholeNum) @ zeros)))) in
  let base = ([], []) in
  let args = let (x,y) = makeTuple l1 l2 in List.combine x y in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(5,5)-(5,40)
List.length l1 <= List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,7)-(6,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,7)-(7,59)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,11)-(15,49)
fun l ->
  (let f =
     fun a ->
       fun x ->
         if List.length a = 0
         then if x = 0 then [] else [x]
         else a @ [x] in
   let base = [] in
   List.fold_left f base l)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(10,2)-(15,49)
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (l1e , l2e) -> match a with
                            | (carry , list) -> (let num =
                                                   (l1e + l2e) + carry in
                                                 if num < 10
                                                 then (0 , [num] @ list)
                                                 else if num = 10
                                                      then (1 , [0] @ list)
                                                      else (num / 10 , [num mod 10] @ list)) in
     let base = (0 , []) in
     let args =
       List.combine (List.rev ([0] @ l1))
                    (List.rev ([0] @ l2)) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(10,14)-(10,22)
EMPTY
EmptyG

(10,14)-(10,42)
EMPTY
EmptyG

(10,23)-(10,42)
match x with
| (l1e , l2e) -> match a with
                 | (carry , list) -> (let num =
                                        (l1e + l2e) + carry in
                                      if num < 10
                                      then (0 , [num] @ list)
                                      else if num = 10
                                           then (1 , [0] @ list)
                                           else (num / 10 , [num mod 10] @ list))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(11,2)-(15,49)
match a with
| (carry , list) -> (let num =
                       (l1e + l2e) + carry in
                     if num < 10
                     then (0 , [num] @ list)
                     else if num = 10
                          then (1 , [0] @ list)
                          else (num / 10 , [num mod 10] @ list))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(11,13)-(11,21)
EMPTY
EmptyG

(11,13)-(11,41)
EMPTY
EmptyG

(11,22)-(11,41)
EMPTY
EmptyG

(12,2)-(15,49)
EMPTY
EmptyG

(13,5)-(13,20)
let args =
  List.combine (List.rev ([0] @ l1))
               (List.rev ([0] @ l2)) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(13,6)-(13,13)
List.combine
VarG

(13,14)-(13,16)
List.rev ([0] @ l1)
AppG (fromList [AppG (fromList [EmptyG])])

(13,17)-(13,19)
List.rev ([0] @ l2)
AppG (fromList [AppG (fromList [EmptyG])])

(14,6)-(14,63)
EMPTY
EmptyG

(14,10)-(14,26)
List.fold_left f base args
AppG (fromList [VarG])

(14,10)-(14,46)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(14,11)-(14,22)
removeZero
VarG

(14,23)-(14,25)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(14,30)-(14,46)
fun l1 ->
  fun l2 ->
    (let (x , y) =
       padZero l1 l2 in
     (List.rev x , clone y
                         (List.length y)))
LamG (LamG EmptyG)

(14,31)-(14,42)
clone y (List.length y)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(14,43)-(14,45)
y
VarG

(14,52)-(14,54)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (aNum , wholeNum) -> match a with
                                  | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                             (mulByDigit aNum
                                                                                         wholeNum @ zeros)) in
     let base = ([] , []) in
     let args =
       (let (x , y) =
          makeTuple l1 l2 in
        List.combine x y) in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

(15,2)-(15,49)
List.combine x y
AppG (fromList [VarG])

*)

(* typed spans
bool
(int list * int list)
(int list * int list)
int list -> int list
int list
(int * int list)
(int * int list)
int list
int list -> int list -> (int * int) list
int list
int list
(int * int list)
int list
int list -> int list
int list
int list -> int list -> (int list * int list list)
int list list
int list
int list -> int list -> int list
(int * int list) list
*)
