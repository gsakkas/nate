
let rec wwhile (f,b) = let temp = f b in wwhile (temp, b);;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  let (b',c') = temp in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(2,41)-(2,57)
let (b' , c') = temp in
if c' = true
then wwhile (f , b')
else b'
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(2,49)-(2,53)
EMPTY
EmptyG

(2,55)-(2,56)
f
VarG

*)
