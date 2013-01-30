package Classes
{
    
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
            trace("StockMessageReciever: init")
        }
        
        [MessageHandler]
        public function handleMessage (message:StockMessage) : void {
            (dictionary[message.name] as Stock).value = message.latest;
        }
        
        [MessageHandler]
        public function handleStockMessageArray (array:StockMessageArray) : void {
            while(array.length>0){
                handleMessage(array.pop());
            }
        }
        
        [MessageHandler]
        public function handleArrayMessage (array:Array) : void {
            throw new Error("Unhandled Message at StockMessageReciever:handleArrayMessage ");
        }
        
        
    }
}