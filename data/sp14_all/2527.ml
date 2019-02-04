
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile (let helper x = ((f x), ((f x) = (f b))) in ((helper b), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,9)-(8,69)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(8,53)-(8,68)
EMPTY
EmptyG

(8,54)-(8,64)
EMPTY
EmptyG

(8,66)-(8,67)
EMPTY
EmptyG

*)
