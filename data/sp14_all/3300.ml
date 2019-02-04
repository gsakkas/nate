
let bigMul l1 l2 =
  let f a x = (a, x) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


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

let bigMul l1 l2 =
  let f a x =
    match x with
    | (k,v) -> (match a with | (c,d) -> (c, (bigAdd d (mulByDigit k v)))) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,11)-(11,49)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
LamG (LamG EmptyG)

(3,2)-(11,49)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(3,14)-(3,20)
match x with
| (v1 , v2) -> match a with
               | (list1 , list2) -> match list1 with
                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(3,15)-(3,16)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                     | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(3,18)-(3,19)
fun i ->
  fun l ->
    match List.rev l with
    | [] -> []
    | h :: t -> (let rec helper =
                   fun acc ->
                     fun v ->
                       if v = 0
                       then acc
                       else helper ((v mod 10) :: acc)
                                   (v / 10) in
                 bigAdd (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)))
                        (helper [] (h * i)))
LamG (LamG EmptyG)

(4,2)-(11,49)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (k , v) -> match a with
                        | (c , d) -> (c , bigAdd d
                                                 (mulByDigit k
                                                             v)) in
     let base = ([] , [0]) in
     let args =
       (let rec helper =
          fun acc ->
            fun l1 ->
              fun l2 ->
                match l1 with
                | [] -> acc
                | h :: t -> helper ((h , l2) :: acc)
                                   (List.map (fun x ->
                                                x * 10) t)
                                   l2 in
        helper [] (List.rev l1) l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

*)
