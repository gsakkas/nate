LamG (LamG EmptyG)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
fun r -> fun a -> fun x -> a x
fun x -> fun a -> x a
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
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
fun l1 ->
  fun l2 ->
    if List.length l1 < List.length l2
    then clone 0
               (List.length l2 - List.length l1) @ l1
    else clone 0
               (List.length l1 - List.length l2) @ l2
fun l1 ->
  fun l2 ->
    (let (x , y) =
       padZero l1 l2 in
     (List.rev x , clone y
                         (List.length y)))
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (aNum , wholeNum) -> match a with
                                  | (zeros , total) -> (zeros @ [0] , bigAdd total
                                                                             (mulByDigit aNum
                                                                                         wholeNum @ zeros)) in
     let base = ([] , []) in
     let args =
       (let (x , y) =
          makeTuple l1 l2 in
        List.combine x y) in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun i ->
  fun l ->
    if i < 1
    then []
    else bigAdd l
                (mulByDigit (i - 1) l)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (b , c) = a in
            let r =
              bigAdd (mulByDigit x
                                 (List.rev l2)) [b] in
            match r with
            | [] -> (0 , 0 :: c)
            | h :: t -> (h , (List.hd t) :: c)) in
     let base = (0 , []) in
     let args = List.rev l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun a -> fun x -> (a * a) + x
fun x -> fun a -> x a
fun a -> fun x -> x
fun x ->
  fun n ->
    if n < 1
    then []
    else x :: (clone x (n - 1))
fun x ->
  fun n ->
    if n < 1
    then []
    else x :: (clone x (n - 1))
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
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun n ->
  fun x ->
    if n > 0
    then helper (n - 1) (x / 10)
    else []
fun l -> fun x -> List.map f l
fun l ->
  fun h ->
    match l with
    | [] -> []
    | hd :: tl -> if hd = h
                  then hd :: (filter tl h)
                  else filter tl h
fun (f , b) ->
  fun b -> (f b , f b = b)
fun (f , b) ->
  fun b -> (f b , f b = b)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                (let (x1 , x2) = x in
                 let (carry , res) = a in
                 (((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)) in
          let base = (0 , []) in
          let args =
            List.rev (List.combine l1
                                   l2) in
          let (carry , res) =
            List.fold_left f base args in
          [carry] @ res) in
     removeZero (add (padZero l1
                              l2)))
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                (let (x1 , x2) = x in
                 let (carry , res) = a in
                 (((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)) in
          let base = (0 , []) in
          let args =
            List.rev (List.combine l1
                                   l2) in
          let (carry , res) =
            List.fold_left f base args in
          [carry] @ res) in
     removeZero (add (padZero l1
                              l2)))
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun i ->
  fun l ->
    (let f =
       fun a ->
         fun x ->
           (let carry = i * x in
            match a with
            | h :: t -> ((h + carry) / 10) :: (((h + carry) mod 10) :: t)
            | _ -> [carry / 10 ; carry mod 10]) in
     let base = [] in
     removeZero (List.fold_left f
                                base (List.rev l)))
fun x ->
  fun n ->
    if n <= 0
    then []
    else x :: (clone x (n - 1))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                (let (x1 , x2) = x in
                 let (carry , res) = a in
                 (((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)) in
          let base = (0 , []) in
          let args =
            List.rev (List.combine l1
                                   l2) in
          let (carry , res) =
            List.fold_left f base args in
          [carry] @ res) in
     removeZero (add (padZero l1
                              l2)))
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun i ->
  fun l ->
    (let f =
       fun a ->
         fun x ->
           (let carry = i * x in
            match a with
            | h :: t -> ((h + carry) / 10) :: (((h + carry) mod 10) :: t)
            | _ -> [carry / 10 ; carry mod 10]) in
     let base = [] in
     removeZero (List.fold_left f
                                base (List.rev l)))
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
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
fun l1 ->
  fun l2 ->
    (let difference =
       List.length l1 - List.length l2 in
     if difference > 0
     then (l1 , clone 0
                      difference @ l2)
     else if difference < 0
          then (clone 0
                      ((-1) * difference) @ l1 , l2)
          else (l1 , l2))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match a with
                | (o , l) -> (let sum =
                                x + o in
                              if sum < 10
                              then (0 , sum :: l)
                              else (1 , (sum - 10) :: l)) in
          let base = (0 , []) in
          let args =
            (let combine =
               fun (a , b) -> a + b in
             List.map combine
                      (List.rev (List.combine l1
                                              l2)) @ [0]) in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun i ->
  fun l ->
    if i = 0
    then [0]
    else bigAdd l l
fun x ->
  fun l ->
    if x > 0
    then l @ []
    else appZero (x - 1) l
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a -> fun x -> a ^ x in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun f -> fun x -> x
fun f -> fun x -> x
fun f -> fun x -> x
fun a -> fun x -> x
fun a -> fun x -> x a
fun a -> fun x -> x a
fun a -> fun x -> x a
fun x -> fun a -> a
fun x -> fun a -> a x
fun a ->
  fun x -> fun x -> fun a -> a x
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           (let (c , a') = a in
            let m = mulByDigit x l2 in
            let s = bigAdd m a' in
            (c + 1 , s)) in
     let base = (0 , [0]) in
     let args = l1 in
     let (_ , res) =
       List.fold_left f base args in
     res)
