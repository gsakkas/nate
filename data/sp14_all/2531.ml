
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

(2,16)-(5,14)
makeRand (10 , 39)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,14)-(8,63)
rand (1 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(8,22)-(8,46)
fun b -> (f b , b = f x)
LamG (TupleG (fromList [EmptyG]))

(8,50)-(8,58)
helper
VarG

(8,50)-(8,58)
b
VarG

*)

(* changed exprs
Lam (Just (2,14)-(5,48)) (TuplePat (Just (2,14)-(2,25)) [VarPat (Just (2,14)-(2,19)) "seed1",VarPat (Just (2,20)-(2,25)) "seed2"]) (Let (Just (3,2)-(5,48)) NonRec [(VarPat (Just (3,6)-(3,10)) "seed",App (Just (3,13)-(3,41)) (Var (Just (3,13)-(3,26)) "Array.of_list") [List (Just (3,27)-(3,41)) [Var (Just (3,28)-(3,33)) "seed1",Var (Just (3,35)-(3,40)) "seed2"] Nothing])] (Let (Just (4,2)-(5,48)) NonRec [(VarPat (Just (4,6)-(4,7)) "s",App (Just (4,10)-(4,32)) (Var (Just (4,10)-(4,27)) "Random.State.make") [Var (Just (4,28)-(4,32)) "seed"])] (Lam (Just (5,2)-(5,48)) (TuplePat (Just (5,7)-(5,10)) [VarPat (Just (5,7)-(5,8)) "x",VarPat (Just (5,9)-(5,10)) "y"]) (Bop (Just (5,16)-(5,48)) Plus (Var (Just (5,16)-(5,17)) "x") (App (Just (5,20)-(5,48)) (Var (Just (5,21)-(5,37)) "Random.State.int") [Var (Just (5,38)-(5,39)) "s",Bop (Just (5,40)-(5,47)) Minus (Var (Just (5,41)-(5,42)) "y") (Var (Just (5,45)-(5,46)) "x")])) Nothing))) Nothing
App (Just (7,11)-(7,28)) (Var (Just (7,11)-(7,19)) "makeRand") [Tuple (Just (7,20)-(7,28)) [Lit (Just (7,21)-(7,23)) (LI 10),Lit (Just (7,25)-(7,27)) (LI 39)]]
App (Just (14,8)-(14,19)) (Var (Just (14,8)-(14,12)) "rand") [Tuple (Just (14,13)-(14,19)) [Lit (Just (14,14)-(14,15)) (LI 1),Lit (Just (14,17)-(14,18)) (LI 4)]]
Lam (Just (17,22)-(17,46)) (VarPat (Just (17,22)-(17,23)) "b") (Tuple (Just (17,26)-(17,46)) [App (Just (17,27)-(17,32)) (Var (Just (17,28)-(17,29)) "f") [Var (Just (17,30)-(17,31)) "b"],Bop (Just (17,34)-(17,45)) Eq (Var (Just (17,35)-(17,36)) "b") (App (Just (17,39)-(17,44)) (Var (Just (17,40)-(17,41)) "f") [Var (Just (17,42)-(17,43)) "x"])]) Nothing
Var (Just (17,50)-(17,56)) "helper"
Var (Just (17,59)-(17,60)) "b"
*)

(* typed spans
(2,14)-(5,48)
(7,11)-(7,28)
(14,8)-(14,19)
(17,22)-(17,46)
(17,50)-(17,56)
(17,59)-(17,60)
*)

(* correct types
*)

(* bad types
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a) -> 'a
('a -> 'a * 'a) -> 'b
'a -> ('a * bool)
('a * bool)
('a * bool)
*)
