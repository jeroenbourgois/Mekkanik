require({
    paths: {
      cs: '../assets/js/libs/cs',
      order: '../assets/js/libs/order',
      jquery: 'http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min',
      underscore: '../assets/js/libs/underscore-min',
      backbone: '../assets/js/libs/backbone-min',
      ich: '../assets/js/libs/ICanHaz'
    }
  }, [
    'jquery',
    'order!underscore',
    'order!backbone',
    'order!ich',
    'cs!app'
  ]
);
