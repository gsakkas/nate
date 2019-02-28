
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
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
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
    let f x a =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,10)-(17,62)
fun x ->
  fun a ->
    (let (carry , num) = a in
     let (l1' , l2') = x in
     let addit =
       (l1' + l2') + carry in
     (if addit > 10
      then 1
      else 0 , (addit mod 10) :: num))
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (13,10)-(17,62)) (VarPat (Just (13,10)-(13,11)) "x") (Lam (Just (13,12)-(17,62)) (VarPat (Just (13,12)-(13,13)) "a") (Let (Just (14,6)-(17,62)) NonRec [(TuplePat (Just (14,11)-(14,20)) [VarPat (Just (14,11)-(14,16)) "carry",VarPat (Just (14,17)-(14,20)) "num"],Var (Just (14,24)-(14,25)) "a")] (Let (Just (15,6)-(17,62)) NonRec [(TuplePat (Just (15,11)-(15,18)) [VarPat (Just (15,11)-(15,14)) "l1'",VarPat (Just (15,15)-(15,18)) "l2'"],Var (Just (15,22)-(15,23)) "x")] (Let (Just (16,6)-(17,62)) NonRec [(VarPat (Just (16,10)-(16,15)) "addit",Bop (Just (16,18)-(16,37)) Plus (Bop (Just (16,18)-(16,29)) Plus (Var (Just (16,19)-(16,22)) "l1'") (Var (Just (16,25)-(16,28)) "l2'")) (Var (Just (16,32)-(16,37)) "carry"))] (Tuple (Just (17,6)-(17,62)) [Ite (Just (17,7)-(17,36)) (Bop (Just (17,11)-(17,21)) Gt (Var (Just (17,11)-(17,16)) "addit") (Lit (Just (17,19)-(17,21)) (LI 10))) (Lit (Just (17,27)-(17,28)) (LI 1)) (Lit (Just (17,34)-(17,35)) (LI 0)),ConApp (Just (17,38)-(17,61)) "::" (Just (Tuple (Just (17,39)-(17,60)) [Bop (Just (17,39)-(17,53)) Mod (Var (Just (17,40)-(17,45)) "addit") (Lit (Just (17,50)-(17,52)) (LI 10)),Var (Just (17,57)-(17,60)) "num"])) Nothing])))) Nothing) Nothing
*)

(* typed spans
(13,10)-(17,62)
*)

(* correct types
(int * int) -> (int * int list) -> (int * int list)
*)

(* bad types
(int * int list) -> (int * int) -> (int * int list)
*)
