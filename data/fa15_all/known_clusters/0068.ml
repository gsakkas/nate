LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
let t1 =
  List.nth l1
           (List.length l1) in
let t2 =
  List.nth l2
           (List.length l2) in
if (t1 + t2) > 9
then (1 , [(t1 + t2) - 10])
else (0 , [t1 + t2])
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
let args =
  List.combine (List.rev ([0] @ l1))
               (List.rev ([0] @ l2)) in
let (_ , res) =
  List.fold_left f base args in
res
let r = List.rev t in
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
let intList = digits n in
let sum = sumList intList in
digitalRoot sum
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
