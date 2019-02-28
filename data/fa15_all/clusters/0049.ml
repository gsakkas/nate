LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)
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
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
let args =
  List.combine (List.rev (0 :: l1))
               (List.rev (0 :: l2)) in
let (_ , res) =
  List.fold_left f base args in
res
let separated = explode w in
let reversed =
  listReverse separated in
if separated = reversed
then true
else false
let temp = f b in
let (b' , c') = temp in
if c' = true
then wwhile (f , b')
else b'
