package Classes
{
    import flash.events.Event;
    
    import mx.collections.ArrayCollection;
    
    public class ConfigurableArrayCollection extends ArrayCollection
    {
        public static var dispatcherOn:Boolean = true;
        
        public function ConfigurableArrayCollection(source:Array=null)
        {
            super(source);
        }
        
        public override function dispatchEvent(event:Event):Boolean{
            if(dispatcherOn) {
                return super.dispatchEvent(event);
            }
            return false;
        }
        
        public function turnOff():void{
            dispatcherOn = false;
        }
        public function turnOn():void{
            dispatcherOn = true;
        }
    }
}