
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(26,25)-(26,70)
match i with
| 0 -> l
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (27,2)-(27,62)) (Var (Just (27,8)-(27,9)) "i") [(LitPat (Just (27,17)-(27,18)) (LI 0),Nothing,Var (Just (27,22)-(27,23)) "l"),(WildPat (Just (27,26)-(27,27)),Nothing,App (Just (27,31)-(27,62)) (Var (Just (27,31)-(27,37)) "bigAdd") [Var (Just (27,38)-(27,39)) "l",App (Just (27,40)-(27,62)) (Var (Just (27,41)-(27,51)) "mulByDigit") [Bop (Just (27,52)-(27,59)) Minus (Var (Just (27,53)-(27,54)) "i") (Lit (Just (27,57)-(27,58)) (LI 1)),Var (Just (27,60)-(27,61)) "l"]])]
*)

(* typed spans
(27,2)-(27,62)
*)

(* correct types
int list
*)

(* bad types
unit
*)
