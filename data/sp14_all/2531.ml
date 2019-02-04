
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), (b = (f x))) in helper b), b);;


(* fix

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rand = makeRand (10, 39);;

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let x = rand (1, 4);;

let fixpoint (f,b) =
  wwhile ((let helper b = ((f b), (b = (f x))) in helper), b);;

*)

(* changed spans
(2,16)-(5,14)
fun (seed1 , seed2) ->
  (let seed =
     Array.of_list [seed1 ; seed2] in
   let s =
     Random.State.make seed in
   fun (x , y) ->
     x + Random.State.int s
                          (y - x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,14)-(8,63)
rand (1 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,22)-(8,46)
fun b -> (f b , b = f x)
LamG (TupleG (fromList [EmptyG]))

(8,30)-(8,31)
b
VarG

(8,50)-(8,58)
EMPTY
EmptyG

(8,61)-(8,62)
EMPTY
EmptyG

*)
