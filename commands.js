module.exports = function(callback) {

  var functions = [
    function drawTransaction()
      {
        return Lottery
          .deployed()
          .then(function(instance){
            return instance.draw();
          })
      },

    function drawCall()
      {
        return Lottery
          .deployed()
          .then(function(instance){
            return instance.draw.call();
          }).then(function(value){
            return value
          });
      },

    function enterDraw(account, fee){
      return Lottery
        .deployed()
        .then(function(instance){
          return instance.enterDraw(account, {value: fee});
        });
    },

    function getParticipants() {
      return Lottery
        .deployed()
        .then(function(instance){
          return instance.getParticipants.call();
        })
        .then(function(value){
          return value
        });
    },

    function getContractBalance() {
      return Lottery
        .deployed()
        .then(function(instance){
          return instance.getContractBalance.call();
        })
        .then(function(value){
          return value
        });
    },

    function getBalance(account) {
      return web3.eth.getBalance(account)
    },
  ]

  var functionsString = '';

  for (var i = 0; i < functions.length; i++) {
    functionString = '' + functions[i];
    functionsString = functionsString + " " + functionString.replace(/(\r\n|\n|\r| +(?= ))/gm,"");
  }

  console.log('Function declarations:' + functionsString);

  callback();
}
