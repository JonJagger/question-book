
const abled = function(node) {

  node.disable = function() {
    node.prop('disabled', true);
    return node;
  };

  node.enable = function() {
    node.prop('disabled',false);
    return node;
  };

  node.enableIf = function(tf) {
    if (tf) {
      node.enable();
    } else {
      node.disable();
    }
    return node;
  };

  node.disableIf = function(tf) {
    return node.enableIf(!tf);
  };

  return node;
};
