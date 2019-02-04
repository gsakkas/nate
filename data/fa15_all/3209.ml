
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (c,a1::a2) = a in
    let v = (x1 * x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
  let base = (0, [0]) in
  let args =
    let y = padZero (l1 l2) in
    let (ar1,ar2) = y in List.rev (List.combine ar1 ar2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(15,11)-(24,49)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(16,2)-(24,49)
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           (let (x1 , x2) = x in
            let (c , a1 :: a2) = a in
            let v = (x1 + x2) + c in
            (v / 10 , [v / 10] @ ([v mod 10] @ a2))) in
     let base = (0 , [0]) in
     let args =
       List.rev (List.combine l1
                              l2) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(19,12)-(19,21)
x1 + x2
BopG VarG VarG

(22,4)-(23,56)
EMPTY
EmptyG

(22,12)-(22,19)
EMPTY
EmptyG

(22,20)-(22,27)
List.rev
VarG

(22,21)-(22,23)
List.combine l1 l2
AppG (fromList [VarG])

(23,4)-(23,56)
EMPTY
EmptyG

(23,20)-(23,21)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(23,25)-(23,33)
removeZero
VarG

(23,25)-(23,56)
List.fold_left f base args
AppG (fromList [VarG])

(23,34)-(23,56)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,35)-(23,47)
EMPTY
EmptyG

(23,48)-(23,51)
EMPTY
EmptyG

(23,52)-(23,55)
padZero
VarG

(24,2)-(24,49)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

*)
