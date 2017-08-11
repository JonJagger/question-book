
const ed = function(node) {

  node.disable = function() {
    node.prop('disabled', true);
    return node;
  };
  node.enable = function() {
    node.prop('disabled',false);
    return node;
  };

  return node;
};

var questionBook = (function(qb) {
  "use strict";

  qb.enable = function(node) {
    node.prop('disabled', false);
  };

  qb.disable = function(node) {
    node.prop('disabled', true);
  };

  qb.enableIf = function(node, tf) {
    if (tf) {
      qb.enable(node);
    } else {
      qb.disable(node);
    }
  };

  qb.disableIf = function(node, tf) {
    if (tf) {
      qb.disable(node);
    } else {
      qb.enable(node);
    }
  };

  return qb;

})(questionBook || {});
