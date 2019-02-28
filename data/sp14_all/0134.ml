
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
      match x with
      | [] -> (0, (if carry > 0 then carry :: num else num))
      | h::t ->
          let (l1',l2') = h in
          let addit = (l1' + l2') + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
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
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(20,75)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (15,6)-(17,71)) NonRec [(TuplePat (Just (15,11)-(15,18)) [VarPat (Just (15,11)-(15,14)) "l1'",VarPat (Just (15,15)-(15,18)) "l2'"],Var (Just (15,22)-(15,23)) "x")] (Let (Just (16,6)-(17,71)) NonRec [(VarPat (Just (16,10)-(16,15)) "addit",Bop (Just (16,18)-(16,37)) Plus (Bop (Just (16,18)-(16,29)) Plus (Var (Just (16,19)-(16,22)) "l1'") (Var (Just (16,25)-(16,28)) "l2'")) (Var (Just (16,32)-(16,37)) "carry"))] (Tuple (Just (17,6)-(17,71)) [Ite (Just (17,7)-(17,47)) (Bop (Just (17,11)-(17,21)) Gt (Var (Just (17,11)-(17,16)) "addit") (Lit (Just (17,19)-(17,21)) (LI 10))) (Bop (Just (17,27)-(17,39)) Mod (Var (Just (17,27)-(17,32)) "addit") (Lit (Just (17,37)-(17,39)) (LI 10))) (Lit (Just (17,45)-(17,46)) (LI 0)),ConApp (Just (17,49)-(17,70)) "::" (Just (Tuple (Just (17,50)-(17,69)) [Bop (Just (17,50)-(17,62)) Div (Var (Just (17,51)-(17,56)) "addit") (Lit (Just (17,59)-(17,61)) (LI 10)),Var (Just (17,66)-(17,69)) "num"])) Nothing]))
*)

(* typed spans
(15,6)-(17,71)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
