for i in {1..30}
do
  ganache-cli -a 10 -l 1000000000 -q 1>/dev/null &
  SUB_ID=$!
  sleep 5
  truffle test ./test/benchmark-test.js
  kill $SUB_ID


  echo "start==="
  ganache-cli -a 1000 -l 1000000000 -q 1>/dev/null &
  SUB_ID=$!

  sleep 9

  truffle test ./test/benchmark-test.js | tee -a log.log

  kill $SUB_ID
  echo killed $SUB_ID
  echo "end==="
done
