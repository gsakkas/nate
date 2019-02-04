
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) <= (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

let makeTuple l1 l2 =
  let (x,y) = padZero l1 l2 in ((List.rev x), (clone y (List.length y)));;

let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = (1, []) in
  let args = makeTuple l1 l2 in
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
(9,14)-(10,72)
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

(10,2)-(10,72)
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

(12,11)-(16,49)
fun i ->
  fun l ->
    if i < 1
    then []
    else bigAdd l
                (mulByDigit (i - 1) l)
LamG (LamG EmptyG)

(13,14)-(13,22)
EMPTY
EmptyG

(13,14)-(13,42)
EMPTY
EmptyG

(13,23)-(13,42)
match x with
| (aNum , wholeNum) -> match a with
                       | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                  (mulByDigit aNum
                                                                              wholeNum @ zeros))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(14,2)-(16,49)
match a with
| (zeros , total) -> (zeros @ [0] , bigAdd total
                                           (mulByDigit aNum
                                                       wholeNum @ zeros))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(14,14)-(14,15)
EMPTY
EmptyG

(15,2)-(16,49)
[]
ListG EmptyG Nothing

(15,13)-(15,28)
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(16,2)-(16,49)
List.combine x y
AppG (fromList [VarG])

*)
