function test_false -d "test_false"
  echo 1
  false
  if test $status != 0
    echo false
  end
  echo 2
  false
  echo 3
end
