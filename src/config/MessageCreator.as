package config
{
    import Classes.ConfigurableArrayCollection;
    import Classes.Stock;
    
    import flash.utils.setTimeout;

    public class MessageCreator
    {
        public function MessageCreator()
        {
           // dispatcher(new StockMessage("NASDAQ", 45654, 45489));
           // randomize();
        }
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
        [Inject]
        public var stockCollection:ConfigurableArrayCollection;
        
        private function randomize():void
        {
            stockCollection.turnOff();
            
            for( var i:int = 0; i < 100; i++){
                //var stock:Stock = stockCollection.getItemAt() as Stock;
                var stock:Stock = stockCollection.source[int(Math.random()*stockCollection.length)] as Stock;
                var change:Number = (Math.random() - 0.5) * stock.yesterday * 0.1;
                dispatcher(new StockMessage(stock.name, stock.value + change, stock.yesterday));
            }
            
            stockCollection.turnOn();
            
            setTimeout(randomize, 50)
            
            
            //stockCollection.dispatchEvent(new CollectionEvent(CollectionEvent.COLLECTION_CHANGE));
        }
    }
}