
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let (o,p) = x in
    let r = bigAdd (mulByDigit o (List.rev l2)) [b] in
    match r with | [] -> [0] | h::t -> (h, (t :: c)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let r = bigAdd (mulByDigit x (List.rev l2)) [b] in
    match r with | [] -> (0, (0 :: c)) | h::t -> (h, ((List.hd t) :: c)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,4)-(35,52)
fun x ->
  (let (b , c) = a in
   let r =
     bigAdd (mulByDigit x
                        (List.rev l2)) [b] in
   match r with
   | [] -> (0 , 0 :: c)
   | h :: t -> (h , (List.hd t) :: c))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (31,10)-(34,72)) (VarPat (Just (31,10)-(31,11)) "x") (Let (Just (32,4)-(34,72)) NonRec [(TuplePat (Just (32,9)-(32,12)) [VarPat (Just (32,9)-(32,10)) "b",VarPat (Just (32,11)-(32,12)) "c"],Var (Just (32,16)-(32,17)) "a")] (Let (Just (33,4)-(34,72)) NonRec [(VarPat (Just (33,8)-(33,9)) "r",App (Just (33,12)-(33,51)) (Var (Just (33,12)-(33,18)) "bigAdd") [App (Just (33,19)-(33,47)) (Var (Just (33,20)-(33,30)) "mulByDigit") [Var (Just (33,31)-(33,32)) "x",App (Just (33,33)-(33,46)) (Var (Just (33,34)-(33,42)) "List.rev") [Var (Just (33,43)-(33,45)) "l2"]],List (Just (33,48)-(33,51)) [Var (Just (33,49)-(33,50)) "b"] Nothing])] (Case (Just (34,4)-(34,72)) (Var (Just (34,10)-(34,11)) "r") [(ConPat (Just (34,19)-(34,21)) "[]" Nothing,Nothing,Tuple (Just (34,25)-(34,38)) [Lit (Just (34,26)-(34,27)) (LI 0),ConApp (Just (34,29)-(34,37)) "::" (Just (Tuple (Just (34,30)-(34,36)) [Lit (Just (34,30)-(34,31)) (LI 0),Var (Just (34,35)-(34,36)) "c"])) Nothing]),(ConsPat (Just (34,41)-(34,45)) (VarPat (Just (34,41)-(34,42)) "h") (VarPat (Just (34,44)-(34,45)) "t"),Nothing,Tuple (Just (34,49)-(34,72)) [Var (Just (34,50)-(34,51)) "h",ConApp (Just (34,53)-(34,71)) "::" (Just (Tuple (Just (34,54)-(34,70)) [App (Just (34,54)-(34,65)) (Var (Just (34,55)-(34,62)) "List.hd") [Var (Just (34,63)-(34,64)) "t"],Var (Just (34,69)-(34,70)) "c"])) Nothing])]))) Nothing
*)

(* typed spans
(31,10)-(34,72)
*)

(* correct types
int -> (int * int list)
*)

(* bad types
int list
*)
