LamG (LamG EmptyG)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun x ->
  fun a ->
    (let (carry , num) = a in
     let (l1' , l2') = x in
     let addit =
       (l1' + l2') + carry in
     (if addit > 10
      then 1
      else 0 , (addit mod 10) :: num))
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> l2
    | h :: t -> h :: (append t l2)
fun x -> fun a -> a
fun x -> fun a -> x a
fun xs1 ->
  fun xs2 ->
    match xs1 with
    | [] -> xs2
    | hd :: tl -> hd :: (append tl
                                xs2)
fun a -> fun x -> a x
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun f ->
  fun x ->
    fun f -> fun a -> f a x
fun f -> fun a -> f a x
fun absNum ->
  fun persCount ->
    if absNum < 10
    then (persCount , absNum)
    else (let xs =
            digits absNum in
          let theSum = sumList xs in
          additivePersAndRoot theSum
                              (persCount + 1))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun x ->
  fun n ->
    match n > 0 with
    | false -> []
    | true -> x :: (clone x
                          (n - 1))
fun l1 ->
  fun l2 ->
    match List.length l1 = List.length l2 with
    | true -> (l1 , l2)
    | false -> (let lendiff =
                  List.length l1 - List.length l2 in
                match lendiff > 0 with
                | true -> (l1 , clone 0
                                      lendiff @ l2)
                | false -> (clone 0
                                  (- lendiff) @ l1 , l2))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun (x , y) ->
                match a with
                | [] -> (x + y) :: a
                | h :: t -> [(x + y) + (h / 10) ; h mod 10] @ t in
          let base = [] in
          let args =
            List.rev ((0 , 0) :: (List.combine l1
                                               l2)) in
          let res =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
fun i ->
  fun l ->
    (let mult =
       fun i ->
         fun l ->
           (let f =
              fun a ->
                fun x ->
                  (let (carryOver , rest) = a in
                   let num =
                     carryOver + (x * i) in
                   let secondDigit =
                     num mod 10 in
                   let carryOver = num / 10 in
                   let result =
                     secondDigit :: rest in
                   (carryOver , rest)) in
            let base = (0 , []) in
            let (carryOver , rest) =
              List.fold_left f base
                             (List.rev l) in
            carryOver :: rest) in
     removeZero (mult i l))
fun a ->
  fun b ->
    if (10 * a) > b
    then a
    else helpFac (10 * a) b
fun f ->
  fun l ->
    match l with
    | [] -> "[]"
    | x :: xs -> (let g =
                    fun a ->
                      fun x -> a ^ ("; " ^ f x) in
                  let base = "[" ^ f x in
                  List.fold_left g base
                                 xs ^ "]")
fun a -> fun x -> x
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
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
fun acc ->
  fun v ->
    if v = 0
    then acc
    else helper ((v mod 10) :: acc)
                (v / 10)
fun l1 ->
  fun l2 ->
    if List.length l1 < List.length l2
    then (List.append (clone 0
                             (List.length l2 - List.length l1))
                      l1 , l2)
    else (l1 , List.append (clone 0
                                  (List.length l1 - List.length l2))
                           l2)
