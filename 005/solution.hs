import Text.Printf

sum_until n = n*(n+1)/2
sum_squares n = n * (n+1) * (2*n+1) /6

main = do
        let s = sum_until 100
        print $ (s*s - sum_squares 100)

