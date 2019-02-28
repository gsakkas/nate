
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let b' = f b in let f' = (b', (b == b')) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,2)-(5,60)
let f' =
  fun b ->
    (let b' = f b in
     (b' , b = b')) in
wwhile (f' , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,18)-(5,60)
EMPTY
EmptyG

*)

(* typed spans
(5,2)-(5,62)
*)

(* typed spans
'a
*)

(* typed spans
'a
*)
