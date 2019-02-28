
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) helper
        [] (h * i);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))
        (helper [] (h * i));;

*)

(* changed spans
(37,6)-(38,18)
bigAdd (mulByDigit i
                   (List.rev (List.map (fun x ->
                                          x * 10) t)))
       (helper [] (h * i))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (37,6)-(38,27)) (Var (Just (37,6)-(37,12)) "bigAdd") [App (Just (37,13)-(37,70)) (Var (Just (37,14)-(37,24)) "mulByDigit") [Var (Just (37,25)-(37,26)) "i",App (Just (37,27)-(37,69)) (Var (Just (37,28)-(37,36)) "List.rev") [App (Just (37,37)-(37,68)) (Var (Just (37,38)-(37,46)) "List.map") [Lam (Just (37,47)-(37,65)) (VarPat (Just (37,52)-(37,53)) "x") (Bop (Just (37,58)-(37,64)) Times (Var (Just (37,58)-(37,59)) "x") (Lit (Just (37,62)-(37,64)) (LI 10))) Nothing,Var (Just (37,66)-(37,67)) "t"]]],App (Just (38,8)-(38,27)) (Var (Just (38,9)-(38,15)) "helper") [List (Just (38,16)-(38,18)) [] Nothing,Bop (Just (38,19)-(38,26)) Times (Var (Just (38,20)-(38,21)) "h") (Var (Just (38,24)-(38,25)) "i")]]
*)

(* typed spans
(37,6)-(38,27)
*)

(* correct types
int list
*)

(* bad types
int list
*)
