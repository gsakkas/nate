LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let base = (0 , []) in
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let (carryOver , rest) =
  List.fold_left f base
                 (List.rev l) in
carryOver :: rest
let base = ([] , []) in
let args =
  List.append (List.rev (List.combine l1
                                      l2)) [(0 , 0)] in
let (_ , res) =
  List.fold_left f base args in
res
