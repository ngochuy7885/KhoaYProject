//based on some code in the Membership Editor from Peter Keller
//http://peterkellner.net/

Type.registerNamespace('DelayedSubmit');

DelayedSubmit.DelayedSubmitBehavior = function(element) {

    DelayedSubmit.DelayedSubmitBehavior.initializeBase(this, [element]);

    this._text = null;
    this._timer = null;
    this._tickHandler = null;
    this._keyupHandler = null;
    this._keydownHandler = null;

    this._TimeoutValue = null;

}

DelayedSubmit.DelayedSubmitBehavior.prototype = {

    initialize : function() {
        DelayedSubmit.DelayedSubmitBehavior.callBaseMethod(this, 'initialize');

        this._tickHandler = Function.createDelegate(this, this._onTimerTick);
        
        this._timer = new Sys.Timer();
        this._timer.set_interval(this._TimeoutValue);
        this._timer.add_tick(this._tickHandler);
               
        this._keyupHandler = Function.createDelegate(this, this._onkeyup);
        $addHandler(this.get_element(), "keyup", this._keyupHandler);    
        
        this._keydownHandler = Function.createDelegate(this, this._onkeydown);
        $addHandler(this.get_element(), "keydown", this._keydownHandler);
        
    },

    dispose : function() {
    
        if(this._timer) {
            this._timer.dispose();
            this._timer = null;
        }
        this._tickHandler = null;
    
        // TODO: add your cleanup code here
        // Detach event handlers
        if (this._keyupHandler) {
            $removeHandler(this.get_element(), "keyup", this._keyupHandler);
            this._keyupHandler = null;
        }
        if (this._keydownHandler) {
            $removeHandler(this.get_element(), "keydown", this._keydownHandler);
            this._keydownHandler = null;
        }

        DelayedSubmit.DelayedSubmitBehavior.callBaseMethod(this, 'dispose');
    },


    _onkeyup : function(ev) {
        var k = ev.keyCode ? ev.keyCode : ev.rawEvent.keyCode;        
        if (k != Sys.UI.Key.Tab) {
            this._timer.set_enabled(true);
        }        
    },
    
    
    _onkeydown : function(ev) {
        this._timer.set_enabled(false);
    },


    _onTimerTick : function(sender, eventArgs) {
        this._timer.set_enabled(false);
        
        if(this._text != this.get_element().value) {
            this._text = this.get_element().value;
            
            this.get_element().onchange(); //compare to this.changed.invoke(this, Sys.EventArgs.Empty);
        }
    },


    // TODO: (Step 2) Add your property accessors here
    //
    get_Timeout : function() {
        return this._TimeoutValue;
    },

    set_Timeout : function(value) {
        this._TimeoutValue = value;
    }
}

DelayedSubmit.DelayedSubmitBehavior.registerClass('DelayedSubmit.DelayedSubmitBehavior', AjaxControlToolkit.BehaviorBase);
