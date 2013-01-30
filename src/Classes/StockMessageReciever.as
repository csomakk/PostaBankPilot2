package Classes
{
    import config.StockMessage;
    
    import flash.utils.Dictionary;

    public class StockMessageReciever
    {
        
        [Inject]
        public var stockCollection:ConfigurableArrayCollection;
        [Inject]
        public var dictionary:Dictionary;
        
        public function StockMessageReciever()
        {
        }
        
        [Init]
        public function init():void{
            trace("recieverready")
        }
        
        [MessageHandler]
        public function handleMessage (message:StockMessage) : void {
           (dictionary[message.name] as Stock).value = message.latest;
        }
    }
}