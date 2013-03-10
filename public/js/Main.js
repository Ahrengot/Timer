// Generated by CoffeeScript 1.6.1
(function() {

  namespace('timer.views');

  namespace('timer.models');

  namespace('timer.collections');

  namespace('timer.router');

  $(function() {
    timer.router = new timer.router.MainRouter();
    return Backbone.history.start({
      pushState: false
    });
  });

  /* --------------------------------------------
       Begin Slip.coffee
  --------------------------------------------
  */


  timer.models.Slip = Backbone.Model.extend({
    defaults: {
      'running': false,
      'description': '',
      'duration': 0
    }
  });

  /* --------------------------------------------
       Begin Slips.coffee
  --------------------------------------------
  */


  timer.collections.Slips = Backbone.Collection.extend({
    url: "" + window.BASE_URL + "/slips/",
    model: timer.models.Slip,
    initialize: function() {
      var _this = this;
      this.loadingDfd = new $.Deferred();
      return this.on('reset', function() {
        return _this.loadingDfd.resolve();
      });
    }
  });

  /* --------------------------------------------
       Begin AddSlip.coffee
  --------------------------------------------
  */


  timer.views.AddSlip = Backbone.View.extend({
    tagName: 'section',
    className: 'add-slip',
    events: {
      'click button': 'addNewSlip'
    },
    initialize: function() {
      return this.template = timer.templates.getTemplate('add-slip');
    },
    transitionIn: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 400);
      this.$el.addClass('animated fadeIn');
      return dfd.promise();
    },
    addNewSlip: function() {
      var description;
      description = prompt('Enter slip name');
      if (description === null) {
        return;
      }
      if (description === '') {
        return alert('You need to enter a slip name');
      }
      if (timer.slips.where({
        'description': description
      }) > 0) {
        return alert('A slip with that name already exists');
      }
      timer.slips.add({
        description: description,
        'running': false
      });
      return timer.router.navigate("/track/" + (escape(description)), true);
    },
    render: function() {
      var template;
      template = _.template(this.template);
      this.$el.html(template({
        slips: timer.slips.toArray()
      }));
      this.transitionIn();
      return this;
    },
    transitionOut: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 400);
      this.$el.addClass('fadeOut');
      return dfd.promise();
    }
  });

  /* --------------------------------------------
       Begin SlipsList.coffee
  --------------------------------------------
  */


  timer.views.SlipList = Backbone.View.extend({
    tagName: 'section',
    className: 'slips-list',
    initialize: function() {
      this.template = timer.templates.getTemplate('slips-list');
      return timer.slips.on('reset', this.render, this);
    },
    transitionIn: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 1000);
      this.$el.addClass('animated fadeIn');
      return dfd.promise();
    },
    transitionOut: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 1000);
      this.$el.addClass('fadeOut');
      return dfd.promise();
    },
    render: function() {
      var template;
      template = _.template(this.template);
      this.$el.html(template({
        slips: timer.slips.toArray()
      }));
      this.transitionIn();
      return this;
    }
  });

  /* --------------------------------------------
       Begin TrackTime.coffee
  --------------------------------------------
  */


  timer.views.TrackTime = Backbone.View.extend({
    tagName: 'section',
    className: 'track-time',
    events: {
      'click button.resume, button.stop': 'toggleTimeTracking',
      'click button.reset': 'resetTimer'
    },
    initialize: function() {
      this.template = timer.templates.getTemplate('track-time');
      this.model.on('change:running', this.toggleTimer, this);
      return this.model.on('change:duration', this.updateTime, this);
    },
    toggleTimeTracking: function() {
      return this.model.set('running', !this.model.get('running'));
    },
    toggleTimer: function(model, running) {
      if (running) {
        return this.startTrackingTime();
      } else {
        return this.stopTrackingTime();
      }
    },
    startTrackingTime: function() {
      var _this = this;
      this.timer = setInterval(function() {
        var oldTime;
        oldTime = parseInt(_this.model.get('duration'), 10);
        return _this.model.set('duration', oldTime + 1);
      }, 1000);
      return this.stopBtn.text('Stop').removeClass('resume').addClass('stop red');
    },
    updateTime: function(model, totalSec) {
      var hour, min, sec;
      hour = Math.floor(totalSec / 3600);
      min = Math.floor((totalSec / 60) % 60);
      sec = totalSec % 60;
      if (hour < 10) {
        hour = "0" + hour;
      }
      if (min < 10) {
        min = "0" + min;
      }
      if (sec < 10) {
        sec = "0" + sec;
      }
      this.time.text("" + hour + ":" + min + ":" + sec);
      if (totalSec % 5 === 0) {
        return this.model.save();
      }
    },
    stopTrackingTime: function() {
      clearInterval(this.timer);
      this.stopBtn.text('Resume').removeClass('red stop').addClass('resume');
      return this.model.save();
    },
    resetTimer: function() {
      this.stopTrackingTime();
      this.model.set('duration', 0);
      if (this.model.get('running')) {
        return this.startTrackingTime();
      }
    },
    transitionIn: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 400);
      this.$el.addClass('animated fadeIn');
      return dfd.promise();
    },
    transitionOut: function() {
      var dfd;
      dfd = new $.Deferred();
      setTimeout(dfd.resolve, 400);
      this.$el.addClass('fadeOut');
      this.model.set('running', false);
      return dfd.promise();
    },
    render: function() {
      var template;
      template = _.template(this.template);
      this.$el.html(template(this.model.toJSON()));
      this.time = this.$el.find('time');
      this.stopBtn = this.$el.find('button.toggle-timer');
      this.updateTime(this.model, this.model.get('duration'));
      this.transitionIn();
      return this;
    }
  });

  /* --------------------------------------------
       Begin Timer.coffee
  --------------------------------------------
  */


  timer.views.Timer = Backbone.View.extend({
    tagName: 'article',
    className: 'timer',
    initialize: function() {
      this.addSlipView = new timer.views.AddSlip();
      this.slipList = new timer.views.SlipList();
      return this.render();
    },
    trackTime: function(model) {
      var _this = this;
      if (this.addSlipView != null) {
        this.addSlipView.transitionOut().done(function() {
          _this.addSlipView.remove();
          _this.addSlipView = null;
          return _this.addTrackTimeView(model);
        });
      }
      if (this.trackTimeView != null) {
        return this.trackTimeView.transitionOut().done(function() {
          _this.trackTimeView.remove();
          return _this.addTrackTimeView(model);
        });
      }
    },
    addTrackTimeView: function(model) {
      this.trackTimeView = new timer.views.TrackTime({
        model: model
      });
      this.$el.prepend(this.trackTimeView.render().el);
      return this.trackTimeView.time.fitText(0.39);
    },
    reset: function() {
      var _this = this;
      if (this.trackTimeView) {
        return this.trackTimeView.transitionOut().done(function() {
          _this.trackTimeView.remove();
          return _this.addSlipView.transitionIn();
        });
      } else {
        return this.addSlipView.transitionIn();
      }
    },
    render: function() {
      this.$el.append(this.addSlipView.render().el);
      this.$el.append(this.slipList.render().el);
      $('#container').html(this.$el);
      return this;
    }
  });

  /* --------------------------------------------
       Begin MainRouter.coffee
  --------------------------------------------
  */


  timer.router.MainRouter = Backbone.Router.extend({
    routes: {
      'track/:term': 'startTimer',
      'reset/:term': 'resetTimer',
      '': 'stopTimer'
    },
    initialize: function() {
      timer.templates = new TemplateController();
      timer.templates.addTemplate('track-time');
      timer.templates.addTemplate('add-slip');
      timer.templates.addTemplate('slips-list');
      timer.slips = new timer.collections.Slips();
      timer.view = new timer.views.Timer();
      return timer.slips.fetch();
    },
    startTimer: function(desc) {
      var _this = this;
      return timer.slips.loadingDfd.done(function() {
        var model;
        model = timer.slips.where({
          'description': unescape(desc)
        })[0];
        if (!model) {
          return _this.navigate('/', true);
        }
        timer.view.trackTime(model);
        if (model.isNew()) {
          return model.save();
        }
      });
    },
    stopTimer: function(desc) {
      return timer.view.reset();
    },
    resetTimer: function(desc) {}
  });

}).call(this);
