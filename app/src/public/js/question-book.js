
const abled = function(node) {

  const disable = function() {
    node.prop('disabled',true);
  };

  const enable = function() {
    node.prop('disabled',false);
  };

  node.enable = function(tf) {
    if (tf === undefined || tf) {
      enable();
    } else {
      disable();
    }
    return node;
  };

  node.disable = function(tf) {
    if (tf === undefined || tf) {
      disable();
    } else {
      enable();
    }
    return node;
  };

  return node;
};
