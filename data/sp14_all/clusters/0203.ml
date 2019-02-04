LetG NonRec (fromList [ConAppG (Just EmptyG) Nothing]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let asd3 = asd :: t in
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
