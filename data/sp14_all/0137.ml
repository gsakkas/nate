
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = x in
      let (l1',l2') = a in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(17,45)
a
VarG

(15,6)-(17,45)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(addit / 10 , (addit mod 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Var (Just (14,24)-(14,25)) "a"
Let (Just (15,6)-(17,45)) NonRec [(TuplePat (Just (15,11)-(15,18)) [VarPat (Just (15,11)-(15,14)) "l1'",VarPat (Just (15,15)-(15,18)) "l2'"],Var (Just (15,22)-(15,23)) "x")] (Let (Just (16,6)-(17,45)) NonRec [(VarPat (Just (16,10)-(16,15)) "addit",Bop (Just (16,18)-(16,37)) Plus (Bop (Just (16,18)-(16,29)) Plus (Var (Just (16,19)-(16,22)) "l1'") (Var (Just (16,25)-(16,28)) "l2'")) (Var (Just (16,32)-(16,37)) "carry"))] (Tuple (Just (17,6)-(17,45)) [Bop (Just (17,7)-(17,19)) Div (Var (Just (17,8)-(17,13)) "addit") (Lit (Just (17,16)-(17,18)) (LI 10)),ConApp (Just (17,21)-(17,44)) "::" (Just (Tuple (Just (17,22)-(17,43)) [Bop (Just (17,22)-(17,36)) Mod (Var (Just (17,23)-(17,28)) "addit") (Lit (Just (17,33)-(17,35)) (LI 10)),Var (Just (17,40)-(17,43)) "num"])) Nothing]))
*)

(* typed spans
(14,24)-(14,25)
(15,6)-(17,45)
*)

(* correct types
(int * int list)
(int * int list)
*)

(* bad types
(int * int list)
(int * int list)
*)
