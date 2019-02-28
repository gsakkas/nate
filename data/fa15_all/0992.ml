
let rec helper (f,b) =
  let (x,y) = f b in match x with | b -> (x, (x = b)) | _ -> helper (f, x);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,74)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(3,14)-(3,17)
fun b ->
  (let x = f b in (x , x <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,21)-(3,74)
EMPTY
EmptyG

(3,45)-(3,52)
x <> b
BopG VarG VarG

(3,61)-(3,74)
EMPTY
EmptyG

(3,72)-(3,73)
EMPTY
EmptyG

*)

(* typed spans
(2,19)-(2,62)
(2,25)-(2,57)
(2,48)-(2,56)
*)

(* typed spans
'a -> ('a * bool)
'a -> ('a * bool)
bool
*)

(* typed spans
('a * bool)
('a * 'b)
bool
*)
